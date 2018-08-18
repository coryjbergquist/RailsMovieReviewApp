class User < ActiveRecord::Base
  has_many :reviews
  has_many :movies, through: :reviews
  validates :name, presence: true
  has_secure_password


end
