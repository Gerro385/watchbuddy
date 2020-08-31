
// let popup = document.querySelector(".popup");
export const setFavouriteButtons = () => {
  const favouriteButtons = document.querySelectorAll(".button-favorite");
    favouriteButtons.forEach(button => {
        const id = button.getAttribute("id")
          button.addEventListener('click', (e) => {
            e.preventDefault();
            likeRequest(id, button)
      });
    });
};

const likeRequest = (id, button) => {
  fetch (`/like/${id}`, {headers: {accept: "application/json"}})
  .then (response => response.json())
  .then (data => {
    changeImage(button, data.is_saved);
    console.log(data);
  })
};

const emptyHeart = "http://res.cloudinary.com/g385/image/upload/diamond-heart-empty"
const filledHeart = "http://res.cloudinary.com/g385/image/upload/diamond-heart-filled"

const changeImage = (anchorElement, isFavourite) => {
  anchorElement.firstElementChild.src = isFavourite ? filledHeart : emptyHeart
}

// event.prevent default
// - Create JS file and add event listener to favourite button
// - Check if watch is already present and update status if present
// - If watch is not present, create watch with status favourite true


// look at rails AJAX
