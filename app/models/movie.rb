class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
  validates :title, presence: true
  validates :release_year, presence: true

  def self.top_movies
    self.all.select do |movie|
      reviews = movie.reviews
      if !reviews.empty?
        if reviews.average(:rating).round > 4
        movie
        end
      end
    end
    # joins(:reviews).group("reviews.movie_id").where("rating > 4")
    # the above gets all movies that have any reviews containing a rating above 4
  end

  def self.bottom_movies
    joins(:reviews).group("reviews.movie_id").where("rating < 2")
  end

  def self.most_reviews
    joins(:reviews).group("reviews.movie_id").order(Arel.sql("count(reviews.movie_id) desc")).limit(1)
  end

end
