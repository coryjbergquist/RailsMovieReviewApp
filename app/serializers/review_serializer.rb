class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :rating, :movie_id
  belongs_to :movie
  belongs_to :user

end
