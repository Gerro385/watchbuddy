// const apiKey = "<%= ENV['TMDB_KEY'] %>";
const fetchMedia = (query) => {
  const results = document.querySelector("#results");
  const form = document.querySelector("template");
  console.log(form)
  const TMDB_KEY = results.dataset.tmdbApiKey;
  fetch(`https://api.themoviedb.org/3/search/multi?api_key=${TMDB_KEY}&query=${query}`)
  .then(response => response.json())
  .then((data) => {
    data.results.slice(0, 5).reverse().forEach((result) => {
      console.log(result)
      const name = result.title ? result.title : result.name;
      const medium = form.innerHTML;
      results.insertAdjacentHTML("afterbegin", medium);
      const newForm = document.querySelector(".media-form");
      const idInput = newForm.querySelector("#tmdb_id");
      idInput.value = result.id;
      const image = newForm.querySelector("img");
      image.src = `http://image.tmdb.org/t/p/w500///${result.poster_path}`;
      const title = document.querySelector("#media-name");
      title.innerText = name;
    });
  });
};

export { fetchMedia };
