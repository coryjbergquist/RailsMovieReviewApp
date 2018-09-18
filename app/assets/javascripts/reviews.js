function Review(data) {
    this.movieTitle = data["movie"]["title"];
    this.title = data["title"];
    this.content = data["content"];
    this.rating = data["rating"];
}

Review.prototype.renderReview = function() {
  $("#movieTitle").text("Review for: " + this["movieTitle"]);
  $("#reviewTitle").text("Title: " + this["title"]);
  $("#reviewContent").text("Content: " + this["content"]);
  $("#reviewRating").text("Rating: " + this["rating"]);
}

function test() {
  console.log("this is a test")
}
