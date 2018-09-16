class CommentsWorker
  include Sidekiq::Worker

  def perform(movie_comments)

  end
end
