# ApiSerializer::User.new(collection, root: :data)
module ApiSerializer
  class User < ::ApiSerializer::Resource
    attributes  :email
  end
end
