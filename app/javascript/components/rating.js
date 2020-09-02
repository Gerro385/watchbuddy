export const giveRating = () => {
  const ratingStar = document.getElementById("your-rating");
  const ratingPopup = document.querySelector(".rating-popup");
    ratingStar.addEventListener('click', (e) => {
      e.preventDefault();
      // seenRequest(id, button)
      if (ratingPopup.classList.contains("d-none")){
        ratingPopup.classList.remove("d-none")
      } else {
        ratingPopup.classList.add("d-none")
      }
    });
};

export const rateClick = () => {
  const rateBtn = document.querySelector(".btn-outline-spacegreen")
  const id = rateBtn.getAttribute("id")
  rateBtn.addEventListener("click", (event) => {
    event.preventDefault();
  rateRequest(id, rateBtn)
  })
}

const rateRequest = (id, button) => {
  const slide = document.getElementById("ratingslide")
  console.log("rateRequest -> slide", slide.value)
  const desc = document.getElementById("ratingdesc")
  console.log("rateRequest -> desc", desc.value)
  fetch(`/rate/${id}?rating=${slide.value}&desc=${desc.value}`, {headers: {accept: "application/json"}})
  .then(response => response.json())
  .then(data => {
  console.log("rateRequest -> data", data)
    //changeImage(button, data.is_saved);
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
