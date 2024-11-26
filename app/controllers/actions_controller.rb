class ActionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rocket, only: %i[ show edit update destroy ]
  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

end
