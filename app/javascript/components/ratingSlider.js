export const ratingSlide = () => {
  const slide = document.getElementById("ratingslide")
  slide.addEventListener("input", (event) => {
    const rating = document.getElementById("rating")
    rating.innerText = event.currentTarget.value
  })
}