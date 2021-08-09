require 'application_responder'

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  self.responder = ApplicationResponder
  respond_to :html

  layout 'user'

  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(resource_or_scope)
    dashboards_path
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
