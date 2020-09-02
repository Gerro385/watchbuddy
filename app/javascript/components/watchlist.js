export const setWatchlistButtons = () => {
  const watchlistButtons = document.querySelectorAll(".button-watchlist");
    watchlistButtons.forEach(button => {
        const id = button.getAttribute("id")
          button.addEventListener('click', (e) => {
            e.preventDefault();
            watchlistRequest(id, button)
      });
    });
};

const watchlistRequest = (id, button) => {
  fetch (`/watchlist/${id}`, {headers: {accept: "application/json"}})
  .then (response => response.json())
  .then (data => {
    changeImage(button, data.is_saved);
    console.log(data);
  })
};

const emptyWatchlist = "https://res.cloudinary.com/g385/image/upload/Pictograms/watchlist-empty.png"
const filledWatchlist = "https://res.cloudinary.com/g385/image/upload/Pictograms/watchlist-filled-metallic.png"

const changeImage = (anchorElement, isWatchlist) => {
  anchorElement.firstElementChild.src = isWatchlist ? filledWatchlist : emptyWatchlist
}
