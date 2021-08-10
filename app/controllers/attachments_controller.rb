# 
class AttachmentsController < ResourcesController
  protected

  def klass
    current_user.keyword_csv_attachments
  end

  def set_act_by
    super

    params[:resource][:user_id] = current_user.id
  end

  def permitted_params
    params.require(:resource).permit(
      :file,
      :user_id
    )
  end
end
