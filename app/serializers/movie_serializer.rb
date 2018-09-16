class MovieSerializer < ActiveModel::Serializer
  has_many :reviews
  attributes :id, :title

end
