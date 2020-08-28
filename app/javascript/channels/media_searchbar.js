const fetchMedia = (query) => {
  const results = document.querySelector("#results"); // results is ul from the navbar where results get inserted as li
  const form = document.querySelector("template"); // from navbar
  const TMDB_KEY = results.dataset.tmdbApiKey; // takes the tmdb key from the ul dataset
  fetch(`https://api.themoviedb.org/3/search/multi?api_key=${TMDB_KEY}&query=${query}`)
  .then(response => response.json())
  .then((data) => {
    if (data.results.length !== 0) { // if no results we get an empty array
      data.results.slice(0, 5).reverse().forEach((result) => {
        const name = result.title ? result.title : result.name;
        const medium = form.innerHTML; // takes the inner html of the template in navbar
        results.insertAdjacentHTML("afterbegin", medium); // puts the template html in the ul
        const newForm = document.querySelector(".media-form"); // query for the template to actually have access to the html inside
        const idInput = newForm.querySelector("#tmdb_id");
        idInput.value = result.id;
        const mediaType = newForm.querySelector("#media_type");
        mediaType.value = result.media_type;
        const image = newForm.querySelector("img");
        image.src = result.poster_path ? `http://image.tmdb.org/t/p/w500///${result.poster_path}`: "https://image.flaticon.com/icons/svg/16/16980.svg";
        const title = document.querySelector("#media-name");
        title.innerText = name;
      });
    } else { // if we get an empty array / no results
      const medium = form.innerHTML; // se above
      results.insertAdjacentHTML("afterbegin", medium);
      const image = results.querySelector("img");
      image.remove();
      const title = document.querySelector("#media-name");
      title.innerText = "no search results";
    };
  })
};

export { fetchMedia };
