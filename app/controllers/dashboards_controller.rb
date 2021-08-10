#
class DashboardsController < ApplicationController
  def index
    render 'user/dashboards/index'
  end
end
