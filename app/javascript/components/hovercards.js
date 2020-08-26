let hover = document.querySelectorAll(".movieposter");
let popup = document.querySelector(".popup");

hover.forEach(movie => {
  movie.addEventListener("mouseover", function( event ) {
  // highlight the mouseenter target
  event.target.nextElementSibling.style.display = "block";
  movie.style.transform = "scale(1.5)";
  movie.style.zIndex = "99";
  });
  movie.addEventListener("mouseout", function( event ) {
  // highlight the mouseenter target
  event.target.nextElementSibling.style.display = "none";
  movie.style.transform = "scale(1)";
  movie.style.zIndex = "initial";
  });
});
