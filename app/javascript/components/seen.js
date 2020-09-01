
// let popup = document.querySelector(".popup");
export const setSeenButtons = () => {
  const seenButtons = document.querySelectorAll(".button-tick");
    seenButtons.forEach(button => {
        const id = button.getAttribute("id")
          button.addEventListener('click', (e) => {
            e.preventDefault();
            seenRequest(id, button)
      });
    });
};

const seenRequest = (id, button) => {
  fetch (`/seen/${id}`, {headers: {accept: "application/json"}})
  .then (response => response.json())
  .then (data => {
    changeImage(button, data.is_saved);
    console.log(data);
  })
};

const emptyTick = "https://res.cloudinary.com/g385/image/upload/v1598946122/Pictograms/tick-empty.png"
const filledTick = "https://res.cloudinary.com/g385/image/upload/v1598946122/Pictograms/tick-filled.png"

const changeImage = (anchorElement, isSeen) => {
  anchorElement.firstElementChild.src = isSeen ? filledTick : emptyTick
};
