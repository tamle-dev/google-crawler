#
class DashboardsController < ApplicationController
  def index
    @total_attachments = current_user.keyword_csv_attachments.uniq.size
    @total_keywords = current_user.keywords.size
    @total_keyword_details = current_user.keyword_details.size
    
    render 'user/dashboards/index'
  end
end
