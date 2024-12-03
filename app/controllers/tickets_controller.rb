class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: %i[show destroy]

  def index
    if params[:query].present?
      query = params[:query].downcase
      keywords = query.split # On sépare les mots-clés (ex. "nouveau haute")

      @tickets = Ticket.all

      keywords.each do |keyword|
        # Vérifie si le mot-clé correspond à un statut
        if Ticket.statuses.keys.include?(keyword)
          @tickets = @tickets.where(status: Ticket.statuses[keyword])
        # Vérifie si le mot-clé correspond à une priorité
        elsif Ticket.priorities.keys.include?(keyword)
          @tickets = @tickets.where(priority: Ticket.priorities[keyword])
        else
          # Applique la recherche textuelle pour les autres cas
          @tickets = @tickets.merge(Ticket.ticket_search(keyword))
        end
      end
    else
      @tickets = Ticket.all

      # Tri personnalisé par statut et date de création
      @tickets = @tickets.order(
        Arel.sql("CASE
          WHEN status = '0' THEN 1
          WHEN status = '1' THEN 2
          WHEN status = '2' THEN 3
          ELSE 4 END"),
          created_at: :desc
        )
    end 
  end


  # def index
  #   if params[:query].present?
  #     @tickets = Ticket.ticket_search(params[:query])
  #   else
  #     @tickets = Ticket.all
  #   end

  #   # Tri personnalisé par status et date de création
  #   @tickets = @tickets.order(
  #     Arel.sql("CASE
  #       WHEN status = '0' THEN 1
  #       WHEN status = '1' THEN 2
  #       WHEN status = '2' THEN 3
  #       ELSE 4 END"),
  #     created_at: :desc
  #   )
  # end

  def show
    @action = Action.new
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    @teams = current_user.teams
    @ticket.team = @teams.first if @teams.count == 1
    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      @teams = current_user.teams
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :content, :priority, :category, :team_id, photos: [])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end


end
