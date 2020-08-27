const fetchMedia = (query) => {
  const results = document.querySelector("#results");
  const form = document.querySelector("template");
  const TMDB_KEY = results.dataset.tmdbApiKey;
  fetch(`https://api.themoviedb.org/3/search/multi?api_key=${TMDB_KEY}&query=${query}`)
  .then(response => response.json())
  .then((data) => {
    if (data.results) {
      data.results.slice(0, 5).reverse().forEach((result) => {
        const name = result.title ? result.title : result.name;
        const medium = form.innerHTML;
        results.insertAdjacentHTML("afterbegin", medium);
        const newForm = document.querySelector(".media-form");
        const idInput = newForm.querySelector("#tmbd_id");
        idInput.value = result.id;
        const image = newForm.querySelector("img");
        image.src = result.poster_path ? `http://image.tmdb.org/t/p/w500///${result.poster_path}`: "https://image.flaticon.com/icons/svg/16/16980.svg";
        const title = document.querySelector("#media-name");
        title.innerText = name;
      };
    } else {
      results.innerText= "No search results");
    };
    );
  });
};

export { fetchMedia };


// if data.results do stuff
// else display error as list element
