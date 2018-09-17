function Review(title, content, rating) {
    this.title = title;
    this.content = content;
    this.rating = rating;
}

Review.prototype.renderReview = function() {
  $("#reviewTitle").text(post["title"]);
  $("#reviewContent").text(post["content"]);
  $("#reviewRating").text(post["rating"]);
}
