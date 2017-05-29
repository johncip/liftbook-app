class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # :reek:UtilityFunction
  #
  # TODO: implement for real
  def current_user
    User.first
  end
end
