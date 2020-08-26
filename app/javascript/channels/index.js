// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

import { fetchMovies } from '/media_searchbar';




document.querySelector('#search-media');
form.addEventListener('keyup', (event) => {
  event.preventDefault();
  fetchMovies('harry potter');
});

/* stcon form = document.querySelector('#search-media');
form.addEventListener('keyup', (event) => {
  event.preventDefault();
  list.innerHTML = '';
  const input = document.querySelector('#search-input');
  fetchMovies(input.value);
});
*/
