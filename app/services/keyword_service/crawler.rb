require 'watir'

# KeywordService::Crawler.new(keyword).exec
module KeywordService
  class Crawler
    attr_reader :keyword

    def initialize(keyword)
      @keyword = keyword
    end

    def exec
      # headless: true
      browser = Watir::Browser.new(:firefox)
      browser.goto "https://www.google.com/search?q=#{normalized_keyword}"

      @doc = Nokogiri::HTML.parse(browser.html)

      update_keyword
      store_html_file
    end

    private

    def normalized_keyword
      keyword.value.gsub(/ /,"+")
    end

    def normalized_result
      result_str = @doc.at_css("div#result-stats").children.text

      pattern = /([0-9\.|\,]+)/
      matcher = result_str.scan(pattern)

      total_result      = matcher[0][0].gsub('.','').to_i
      total_result_time = matcher[1][0].gsub(',','.').to_f * 1000 #milisecond

      return total_result, total_result_time
    end

    def total_adword
      @doc.search("div#tads div[data-text-ad='1']").count
    end

    def total_url
      @doc.search('//a/@href').count
    end

    def fetch_seach_gs
      @doc.search('div.g')
    end

    def build_keyword_details
      fetch_seach_gs.each_with_index.inject([]) do |rs, (search_g, idx)|
        title = search_g.search("h3")&.text

        rs.push({
          title:        title,
          description:  search_g.search("span").map(&:text).join(' | '),
          url:          search_g.search("a").attribute("href")&.text,
          domain:       search_g.search("cite")[0]&.children&.first&.text,
          position:     idx + 1
        }) unless title.blank?

        rs
      end
    end

    def build_keyword_update_params
      total_result, total_result_time = normalized_result

      {
        total_adword: total_adword,
        total_url: total_url,
        total_result: total_result,
        total_result_time: total_result_time,
        page_resource: nil,
        keyword_details_attributes: build_keyword_details
      }
    end

    def update_keyword
      KeywordService::Updater.new(keyword, build_keyword_update_params).exec
    end

    def store_html_file
      KeywordService::HtmlWriter.new(keyword, @doc).exec
    end
  end
end
