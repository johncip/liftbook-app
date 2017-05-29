class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # TODO: implement for real
  def current_user
    User.first
  end
end
