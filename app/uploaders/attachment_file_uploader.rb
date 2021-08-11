#
class AttachmentFileUploader < BaseUploader
  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
