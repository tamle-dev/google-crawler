module ApplicationHelper
  def build_version
    APP_VERSION
  end
  
  def active_menu(options = {})
    ActiveMenuService.new(controller, options).exec
  end
end
