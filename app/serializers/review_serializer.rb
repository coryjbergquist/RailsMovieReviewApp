class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :movie_id
  belongs_to :movie

  # def self.serialize(reviews)
  #   reviews.map do |review|
  #     serialized_product = '{'
  #
  #     serialized_product += '"id": ' + review.id.to_s + ', '
  #     serialized_product += '"title": "' + review.title + '", '
  #     serialized_product += '"content": "' + review.content + '", '
  #
  #     serialized_product += '}'
  #   end
  # end

end
