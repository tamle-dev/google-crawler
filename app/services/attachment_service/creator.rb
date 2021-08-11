# AttachmentService::Creator.new(params).exec
module AttachmentService
  class Creator
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def exec
      attachment = ::Attachment.create(params)

      read_attachment(attachment)

      attachment
    end

    private

    def read_attachment(attachment)
      AttachmentService::Reader.new(attachment).exec
    end
  end
end
