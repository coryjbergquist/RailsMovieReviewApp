// class Review {
//
//   constructor(data) {
//       this.movieTitle = data["movie"]["title"];
//       this.title = data["title"];
//       this.content = data["content"];
//       this.rating = data["rating"];
//   }
//
//   renderReview() {
//     $("#movieTitle").text("Review for: " + this["movieTitle"]);
//     $("#reviewTitle").text("Title: " + this["title"]);
//     $("#reviewContent").text("Content: " + this["content"]);
//     $("#reviewRating").text("Rating: " + this["rating"]);
//   }
//
// }

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

$(function () {
  $(".js-reviews").on('click', function() {
    var id = $(this).data("id");
    $.get("/movies/" + id + "/movie_data", function(data) {

      $('#body-' + id).empty()
      // Replace text of body-id div
      $.each(data["reviews"], function(index) {
        $('#body-' + id).append(
          "<h3>" + data["reviews"][index]["title"] + "</h3>" +
          "<p>" + data["reviews"][index]["content"] + "</p>" +
          '<a href="/movies/' + data["reviews"][index]["movie_id"] + "/reviews/" + data["reviews"][index]["id"] + '">'+ "see full review" +'</a>'
        );
      });
    });
  });
});

$(function () {
  $(".js-topReviews").on('click', function() {
    var id = $(this).data("id");
    $.get("/movies/" + id + "/movie_data", function(data) {

      $('#body-' + id).empty()
      // Replace text of body-id div

      const result = data["reviews"].filter(review => review.rating > 4);
      $.each(result, function(index) {

        $('#body-' + id).append(
          "<h3>" + result[index]["title"] + "</h3>" +
          "<p>" + result[index]["content"] + "</p>" +
          "<p>" + result[index]["rating"] + "</p>" +
          '<a href="/movies/' + result[index]["movie_id"] + "/reviews/" + result[index]["id"] + '">'+ "see full review" +'</a>'
        );
      });
    });
  });
});

$(function () {
  $('form').submit(function(event) {
    event.preventDefault();
    var $values = $(this).serializeArray();
    var $posting = $.post('/movies/' + this[2]["value"] +
                          '/reviews/', $values);
    $posting.done(function(data) {
      var review = new Review(data);
      $("#postResult").append(review.renderReview())
    });
  });
});

// Reviews Show Next/Previous links


$(function () {
  $(".js-next").on("click", function() {
    $(".editLink").html('');
    var nextId = parseInt($(".js-next").attr("review-id")) + 1;
    $.get("/reviews/" + nextId + ".json", function(data) {

      $(".movieTitle").html("Movie Title: " + data["movie"]["title"]);
      $(".reviewTitle").html("Review Title: " + data["title"]);
      $(".reviewContent").html("Review Content: " + data["content"]);
      $(".reviewRating").html("Rating: " + data["rating"]);
      // re-set the id to current on the link
      $(".js-next").attr("review-id", data["id"]);
    });
    return false
  });
});

$(function () {
  $(".js-previous").on("click", function() {
    $(".editLink").html('');
    var nextId = parseInt($(".js-next").attr("review-id")) - 1;
    $.get("/reviews/" + nextId + ".json", function(data) {

      $(".movieTitle").html("Movie Title: " + data["movie"]["title"]);
      $(".reviewTitle").html("Review Title: " + data["title"]);
      $(".reviewContent").html("Review Content: " + data["content"]);
      $(".reviewRating").html("Rating: " + data["rating"]);
      // re-set the id to current on the link
      $(".js-next").attr("review-id", data["id"]);
    });
    return false
  });
});


function test() {
  console.log("this is a test")
}
