class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :movie_id

  def self.serialize(reviews)
    serialized_review = {}
    reviews.map do |review|
      serialized_product = '{'

      serialized_product += '"id": ' + review.id.to_s + ', '
      serialized_product += '"title": "' + review.title + '", '
      serialized_product += '"content": "' + review.content + '", '

      serialized_product += '}'
    end
end

end
