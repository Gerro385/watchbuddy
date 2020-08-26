let hover = document.querySelectorAll(".movieposter");
let popup = document.querySelector(".popup");


hover.forEach(movie => {
  movie.addEventListener("mouseover", function( event ) {
  // highlight the mouseenter target
  console.log(event.target.nextElementSibling)
  event.target.nextElementSibling.style.display = "block";
  });
});
