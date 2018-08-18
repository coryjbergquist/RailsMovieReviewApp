class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5}

end
