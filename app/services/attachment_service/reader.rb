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
        keywords << ::Keyword.new(value: keyword.first, attachment_id: attachment.id)
      end

      ::Keyword.import keywords

      craw_keyword_details(keywords)
    end

    def craw_keyword_details(keywords)
      keywords.each do |keyword|
        KeywordService::Crawler.new(keyword).exec
      end
    end
  end
end