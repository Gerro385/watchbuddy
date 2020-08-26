// #  import { ENV } from './env.js.erb';

// const apiKey = <% ENV['TMDB_KEY'] %>;
const fetchMedia = (query) => {
  const results = document.querySelector("#results");
  const TMDB_KEY = results.dataset.tmdbApiKey
  console.log("fetchMedia -> TMDB_KEY", TMDB_KEY)
  
  fetch(`https://api.themoviedb.org/3/search/multi?api_key=8081155eac22e256dfac70b9d7913b13&query=${query}`) //PUT IN API KEY HERE INSTEAD OF ENV
  .then(response => response.json())
  .then((data) => {
    //console.log(data);
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
