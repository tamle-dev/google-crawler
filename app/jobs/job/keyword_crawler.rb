# Job::KeywordCrawler.perform_later(keyword_id)
module Job
  class KeywordCrawler < Job::Application
    def perform(keyword_id)
      keyword = ::Keyword.find_by(id: keyword_id)
      return unless keyword

      KeywordService::Crawler.new(keyword).exec
    end
  end
end
