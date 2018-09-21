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
      const result = data["reviews"]
      result.forEach(function(result) {

        $('#body-' + id).append(
          "<h3>" + result["title"] + "</h3>" +
          "<p>" + result["content"] + "</p>" +
          "<p>" + result["rating"] + "</p>" +
          '<a href="/movies/' + result["movie_id"] + "/reviews/" + result["id"] + '">'+ "see full review" +'</a>'
        );
      });
    });
  });



  $(".js-topReviews").on('click', function() {
    var id = $(this).data("id");
    $.get("/movies/" + id + "/movie_data", function(data) {

      $('#body-' + id).empty()
      // Replace text of body-id div

      const result = data["reviews"].filter(review => review.rating > 4);
      result.forEach(function(result) {
        $('#body-' + id).append(
          "<h3>" + result["title"] + "</h3>" +
          "<p>" + result["content"] + "</p>" +
          "<p>" + result["rating"] + "</p>" +
          '<a href="/movies/' + result["movie_id"] + "/reviews/" + result["id"] + '">'+ "see full review" +'</a>'
        );
      });
    });
  });



  $('form').submit(function(event) {
    event.preventDefault();
    var $values = $(this).serializeArray();
    var $posting = $.post('/movies/' + this[2]["value"] +
                          '/reviews/', $values);
    $posting.done(function(data) {
      var review = new Review(data);
      $("#postResult").append(review.renderReview())
      // $('#new_review')[0].reset()
      $( '#new_review' ).each(function(){
        this.reset();
      });
    });
  });



// Reviews Show Next/Previous links


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


// -----USE A CUSTOM BUTTON TO SUBMIT FORM ------
// $(function () {
//   $("#newReview").on('click', function() {
//     event.preventDefault();
//     var $values = $(this).serializeArray();
//     var $posting = $.post('/movies/' + this[2]["value"] +
//                           '/reviews/', $values);
//     $posting.done(function(data) {
//       var review = new Review(data);
//       $("#postResult").append(review.renderReview())
//       // $('#new_review')[0].reset()
//       document.getElementById("new_review").value = "";
//     });
//   });
// });



function test() {
  console.log("this is a test")
}
