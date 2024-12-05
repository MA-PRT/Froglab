class ActionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_action, only: %i[show destroy]
  before_action :set_ticket, only: %i[create]

  def index
    if params[:query].present?
      @actions = Action.joins(:user).where(
        "users.first_name ILIKE :query OR users.last_name ILIKE :query",
        query: "%#{params[:query]}%"
      )
    else
      @actions = Action.all.order(created_at: :desc)
    end
    # if params[:query].present?
    #   query = params[:query].downcase
    #   keywords = query.split # On sépare les mots-clés (ex. "nouveau haute")

    # @tickets = Ticket.all

    #   keywords.each do |keyword|
    #     # Vérifie si le mot-clé correspond à un statut
    #     if Action.statuses.keys.include?(keyword)
    #       @actions = @actions.where(status: Action.statuses[keyword])
    #     else
    #       # Applique la recherche textuelle pour les autres cas
    #       @actions = @actions.merge(Action.action_search(keyword))
    #     end
    #   end
    # else
    #   @actions = Action.all
    # end
  end

  def show
  end

  def new
    @action = Action.new
  end

  def create
    @action = @ticket.actions.build(action_params)
    if @action.save
      redirect_to action_path(@action)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update_status
    @action = Action.find(params[:id])
    @action.update(status: params[:status].to_i)
  end

  def destroy
    @action.destroy
    redirect_to ticket_path(@action.ticket)
  end

  private

  def action_params
    params.require(:action).permit(:title, :due_date, :status, :content, :ticket_id, :user_id)
  end

  def set_action
    @action = Action.find(params[:id])
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end
end
