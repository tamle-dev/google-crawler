#
class Api::V1::GetKeywordController < ::Api::AuthController
  before_action :set_keyword

  def call
    unless @keyword
      render_t_error(:resource_not_found)
      return
    end

    render json: ApiSerializer::Keyword.new(@keyword, root: :data), status: :ok
  end

  private

  def set_keyword
    @keyword = Keyword.where(id: params[:id]).where(id: current_user.keywords.map(&:id)).first
  end
end

