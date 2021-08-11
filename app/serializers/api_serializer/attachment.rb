#
module ApiSerializer
  class Attachment < ::ApiSerializer::Resource
    attributes  :url,
                :file_name
  end
end
