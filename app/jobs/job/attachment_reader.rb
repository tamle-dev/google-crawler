# Job::AttachmentReader.perform_later(attachment_id)
module Job
  class AttachmentReader < Job::Application
    def perform(attachment_id)
      attachment = ::Attachment.find_by(id: attachment_id)
      return unless attachment

      AttachmentService::Reader.new(attachment).exec
    end
  end
end
