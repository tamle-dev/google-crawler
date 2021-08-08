#
class ApiController < ::ActionController::API
  include ApiResponser
  include ApiParamValidation
  include ApiErrorHandler
end
