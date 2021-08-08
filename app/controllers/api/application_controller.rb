#
module Api
  class ApplicationController < ::ApiController
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
end
