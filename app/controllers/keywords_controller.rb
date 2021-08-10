# 
class KeywordsController < ResourcesController
  protected

  def klass
    current_user.keywords
  end
end
