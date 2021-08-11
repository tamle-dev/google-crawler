#
class Api::V1::GetKeywordsController < ::Api::AuthController
  def call
    collection = paging get_keywords

    render json: CollectionSerializer.new(
      collection,
      ApiSerializer::Keyword,
      root: :data,
      meta: {
        paging: PagingSerializer.new(collection).to_hash
      },
    ), status: :ok
  end

  private

  def get_keywords
    current_user.keywords
  end
end

