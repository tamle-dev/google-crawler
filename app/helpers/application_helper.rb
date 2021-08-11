module ApplicationHelper
  def build_version
    APP_VERSION
  end
  
  def active_menu(options = {})
    ActiveMenuService.new(controller, options).exec
  end

  def format_datetime(time, options = {})
    options[:format] ||= :default
    I18n.l(time, options)
  rescue I18n::ArgumentError
    ''
  end
end
