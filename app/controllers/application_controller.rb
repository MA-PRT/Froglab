class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  DOMAIN = "www.froglab.tech"

  def after_sign_in_path_for(resource)
    home_path
  end

  def default_url_options
    { host: ENV[DOMAIN] || "localhost:3000" }
    end

end
