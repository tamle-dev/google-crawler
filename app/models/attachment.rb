class Attachment < ApplicationRecord
  include AttachmentStatusEnum

  mount_uploader :file, BaseUploader

  belongs_to :user, optional: true
  has_many :keywords, foreign_key: :keyword_attachment_id

  def url
    URI::decode_www_form_component(file.url)
  end

  def file_name
    file&.file&.filename
  end

  def content_type
    file&.content_type
  end
end
