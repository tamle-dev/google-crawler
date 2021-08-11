require 'watir'

# KeywordService::Crawler.new(keywords).exec
module KeywordService
  class Crawler
    attr_reader :keywords

    def initialize(keywords)
      @keywords = keywords
    end

    def exec
      browser = Watir::Browser.new(:firefox, headless: true)

      keywords.each do |keyword|
        next if keyword.crawled?

        browser.goto "https://www.google.com/search?q=#{normalized_keyword(keyword)}"

        doc = Nokogiri::HTML.parse(browser.html)

        update_keyword(keyword, build_keyword_update_params(doc))
        store_html_file(keyword, doc)
      end

      browser.close
    end

    private

    def normalized_keyword(keyword)
      keyword.value.gsub(/ /,"+")
    end

    def update_keyword(keyword, params)
      KeywordService::Updater.new(keyword, params).exec
    end

    def store_html_file(keyword, doc)
      KeywordService::HtmlWriter.new(keyword, doc).exec
    end

    def build_keyword_update_params(doc)
      KeywordService::Parser.new(doc).exec
    end
  end
end
