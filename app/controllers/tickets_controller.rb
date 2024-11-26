class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: %i[ show destroy ]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(params_ticket)
    @ticket.user = current_user
    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def params_ticket
    params.require(:ticket).permit(:title, :content, :priority, photos: [])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
