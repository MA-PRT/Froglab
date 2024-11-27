class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: %i[show destroy]

  def index
    @tickets = Ticket.all
  end

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
