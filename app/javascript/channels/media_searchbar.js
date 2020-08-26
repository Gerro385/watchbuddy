// const apiKey = "<%= ENV['TMDB_KEY'] %>";
const fetchMedia = (query) => {
  const results = document.querySelector("#results");
  const TMDB_KEY = results.dataset.tmdbApiKey
  fetch(`https://api.themoviedb.org/3/search/multi?api_key=${TMDB_KEY}&query=${query}`)
  .then(response => response.json())
  .then((data) => {
    data.results.slice(0, 5).forEach((result) => {
      const name = result.title ? result.title : result.name;
      const medium = `<li class="list-inline-item card p-2">
        <img src="http://image.tmdb.org/t/p/w500///${result.poster_path}" alt="No img available">
        <p>${name}</p>
      </li>`;
      results.insertAdjacentHTML("beforeend", medium);
    });
  });
};

export { fetchMedia }; 
