export const giveRating = () => {
  const ratingStar = document.getElementById("your-rating");
  const ratingPopup = document.querySelector(".rating-popup");
    ratingStar.addEventListener('click', (e) => {
      e.preventDefault();
      console.log("hello")
      // seenRequest(id, button)
      if (ratingPopup.classList.contains("d-none")){
        ratingPopup.classList.remove("d-none")
      } else {
        ratingPopup.classList.add("d-none")
      }
    });
};

const rateClick = () => {
  const rateBtn = document.querySelector(".btn-outline-spacegreen")
  const id = rateBtn.getAttribute("id")
  rateBtn.addEventListener("click", (event) => {
  rateRequest(id)
  })
}

const rateRequest = (id, button) => {
  fetch (`/rate/${id}`, {headers: {accept: "application/json"}})
  .then (response => response.json())
  .then (data => {
    changeImage(button, data.is_saved);
    console.log(data);
  })
};

/*
fetch('https://httpbin.org/post', {
    method: 'POST',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({a: 1, b: 'Textual content'})
*/

const emptyStar = "https://res.cloudinary.com/g385/image/upload/v1598863329/Pictograms/star-empty.png"
const filledStar = "https://res.cloudinary.com/g385/image/upload/v1598863329/Pictograms/star-filled.png"

const changeImage = (anchorElement, isSeen) => {
  anchorElement.firstElementChild.src = isSeen ? filledStar : emptyStar
};
