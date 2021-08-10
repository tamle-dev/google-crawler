# KeywordService::HtmlWriter.new(keyword, doc).exec
module KeywordService
  class HtmlWriter
    attr_reader :keyword, :doc

    def initialize(keyword, doc)
      @keyword = keyword
      @doc     = doc
    end

    def exec
      output_file = Tempfile.new(["result_#{keyword.value}_#{keyword.id}", '.html'])
      output_file.binmode
      output_file.write doc.to_html
      output_file.flush
      
      attachment = Attachment.new(file: output_file)
      attachment.save

      update_html_attachment(attachment)
    end

    private

    def update_html_attachment(attachment)
      keyword.update(result_attachment_id: attachment.id)
      keyword
    end
  end
end
