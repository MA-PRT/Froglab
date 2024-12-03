class CommentsController < ApplicationController
  before_action :set_ticket, only: %i[create]

  def index
  end

  # def new
  #   @comment = Comment.new
  # end

  def create
    @comment = Comment.new(comment_params)
    @comment.ticket = @ticket
    @comment.user = current_user
    if @comment.save
      redirect_to ticket_path(@ticket)
    else
      respond_to &:turbo_stream
    end
  end

  def edit
  end

  def updated
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to ticket_path(@comment.ticket), status: :see_other
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
