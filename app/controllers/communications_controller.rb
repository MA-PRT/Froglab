class CommunicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_communication, only: %i[ show destroy ]

  def index
    @communications = Communication.all
  end

  def show
  end

  def new
    @communication = Communication.new
    @teams = current_user.teams

    if @teams.count == 1
      @communication.teams << @teams.first
    end
  end

  def create
    @communication = current_user.communications.build(communication_params)
    if @communication.save
      set_team_associations
      redirect_to communications_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @communication.destroy
    redirect_to communications_path
  end

  private

  def communication_params
    params.require(:communication).permit(:title, :category, :content, photos: [])
  end

  def set_communication
    @communication = Communication.find(params[:id])
  end

  def set_team_associations
    @communication.teams = Team.where(id: params[:communication][:team_ids])
  end
end
