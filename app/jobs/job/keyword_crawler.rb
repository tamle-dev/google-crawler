# Job::KeywordCrawler.perform_later(keyword_ids)
module Job
  class KeywordCrawler < Job::Application
    def perform(keyword_ids)
      keywords = ::Keyword.where(id: keyword_ids)
      return unless keywords

      KeywordService::Crawler.new(keywords).exec
    end
  end
end
