var photoId = null;

var getPhoto = function() {
  $.getJSON('http://www.clother.me/pick_photo.json', function(data) {
    photoId = data.id;
    var elem = document.createElement("img");
    elem.setAttribute("src", "https://s3-us-west-2.amazonaws.com/clotherphotos/assets/" + data.file);
    elem.setAttribute("alt", "photo");
    document.getElementById("game-photo").appendChild(elem);
  });
};

var empty = function() {
  $("#game-photo").empty();
  photoId = null;
};

var vote = function(str) {
  $.post("http://www.clother.me/photos/" + photoId + "/" + str);
  empty();
  getPhoto();
};

$(function() {
  getPhoto();

  $(".love").click(function() {
    vote("love");
  });

  $(".hate").click(function() {
    vote("hate");
  });
});
