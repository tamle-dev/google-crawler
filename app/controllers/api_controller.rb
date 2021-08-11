#
class ApiController < ::ActionController::API
  include ApiResponser
  include ApiParamValidation
  include ApiErrorHandler

  protected

  def paging(collection)
    collection.page(params[:page]).per(per_page)
  end

  def per_page
    params[:per_page] || 10
  end
end
