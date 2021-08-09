#
class Api::V1::CreateAttachmentController < ::Api::ApplicationController
  def call
    attachment = Attachment.new permitted_params

    attachment.save

    render json: ApiSerializer::Attachment.new(attachment, root: :data), status: :created
  end

  private

  def permitted_params
    params.permit(:file)
  end
end
