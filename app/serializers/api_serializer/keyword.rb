# ApiSerializer::Keyword.new(collection, root: :data)
module ApiSerializer
  class Keyword < ::ApiSerializer::Resource
    attributes  :value,
                :total_adword,
                :total_url,
                :total_result,
                :total_result_time,
                :total_result_text,
                :total_result_time_text,
                :details

    def details
      CollectionSerializer.new(object.keyword_details, ApiSerializer::KeywordDetail).to_a
    end
  end
end
