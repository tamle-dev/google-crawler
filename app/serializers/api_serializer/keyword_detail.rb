# ApiSerializer::KeywordDetail.new(collection, root: :data)
module ApiSerializer
  class KeywordDetail < ::ApiSerializer::Resource
    attributes  :title,
                :description,
                :url,
                :domain,
                :position
  end
end
