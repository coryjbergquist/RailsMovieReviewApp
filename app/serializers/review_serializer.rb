class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :movie_id
end
