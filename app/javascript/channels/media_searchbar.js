const fetchMovies = (query) => {
  const results = document.querySelector("#results");
  fetch(`https://api.themoviedb.org/3/search/multi?api_key=8081155eac22e256dfac70b9d7913b13&query=${query}`)
  .then(response => response.json())
  .then((data) => {
    data.Search.forEach((result) => {
      const medium = `<li class="list-inline-item">
        <img src="http://image.tmdb.org/t/p/w500///${result.poster_path}" alt="No img available">
        <p>${if (result.title === null) {
          return result.name;
        } else {
          return result.title;
        } }</p>
      </li>`;
      results.insertAdjacentHTML("beforeend", medium);
    });
  });

export { fetchMovies }; 
