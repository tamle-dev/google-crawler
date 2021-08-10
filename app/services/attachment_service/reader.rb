# TODO use background job in craw_keyword_details
require 'open-uri'
require 'csv'

# AttachmentService::Reader.new(attachment).exec
module AttachmentService
  class Reader
    attr_reader :attachment

    def initialize(attachment)
      @attachment = attachment
    end

    def exec
      attachment_url = attachment.file_url

      keywords = []
      CSV.new(open(attachment_url)).each do |keyword|
        keywords << ::Keyword.new(value: keyword.first, keyword_attachment_id: attachment.id)
      end

      ::Keyword.import keywords

      update_attachment_status
      craw_keyword_details(keywords)
    end

    def craw_keyword_details(keywords)
      keywords.each do |keyword|
        KeywordService::Crawler.new(keyword).exec
      end
    end

    def update_attachment_status
      AttachmentService::Updater.new(attachment, status: :completed).exec
    end
  end
end
