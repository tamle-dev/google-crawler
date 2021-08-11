#
class Api::V1::CreateAttachmentController < ::Api::AuthController
  def call
    form = UserForm::Attachment.new(permitted_params)
    unless form.valid?
      render_form_error(@form)
      return
    end

    attachment = AttachmentService::Creator.new(permitted_params.merge(user_id: current_user_id)).exec

    render json: ApiSerializer::Attachment.new(attachment, root: :data), status: :created
  end

  private

  def permitted_params
    params.permit(:file)
  end
end
