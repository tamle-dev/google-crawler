class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  respond_to :html

  layout 'user'
  
  def healthz
    render json: {
      timestamp: Time.zone.now
    }, status: 200
  end

  def version
    render json: {
      version: APP_VERSION,
      timestamp: Time.zone.now
    }, status: 200
  end
end
