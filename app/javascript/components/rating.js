export const giveRating = () => {
  if (document.querySelector(".rating-section")) {
  const ratingSection = document.querySelector(".rating-section");
  const ratingPopup = document.querySelector(".rating-popup");
    ratingSection.addEventListener('click', (e) => {
      e.preventDefault();
      // seenRequest(id, button)
      if (ratingPopup.classList.contains("d-none")){
        ratingPopup.classList.remove("d-none")
      } else {
        ratingPopup.classList.add("d-none")
      }
    });
  };
};

export const rateClick = () => {
  const rateBtn = document.querySelector(".btn-outline-spacegreen")
  if (document.getElementById("ratingslide")) {
    const id = rateBtn.getAttribute("id")
    rateBtn.addEventListener("click", (event) => {
      event.preventDefault();
    rateRequest(id, rateBtn)
    })
  }
}

const rateRequest = (id, button) => {
  const slide = document.getElementById("ratingslide")
  const desc = document.getElementById("ratingdesc")
  fetch(`/rate/${id}?rating=${slide.value}&desc=${desc.value}`, {headers: {accept: "application/json"}})
  .then(response => response.json())
  .then(data => {
    const ratingNum = document.getElementById("ratingnum");
    ratingNum.innerText = data.rating
    const ratingPopup = document.querySelector(".rating-popup");
    ratingPopup.classList.add("d-none")
    const ratingStar = document.getElementById("your-rating");
    // changeImage(ratingStar, data.is_saved);
    if (ratingStar.src === emptyStar) {
      ratingStar.src = filledStar
    }
  })
};

const emptyStar = "https://res.cloudinary.com/g385/image/upload/v1598863329/Pictograms/star-empty.png"
const filledStar = "https://res.cloudinary.com/g385/image/upload/v1598863329/Pictograms/star-filled.png"
