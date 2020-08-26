// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

import { fetchMedia } from './media_searchbar';

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)




const form = document.querySelector('#search-media');
const results = document.querySelector("#results");
form.addEventListener('keyup', (event) => {
  event.preventDefault();
  results.innerHTML = "";
  fetchMedia('harry potter');
});

/* stcon form = document.querySelector('#search-media');
form.addEventListener('keyup', (event) => {
  event.preventDefault();
  list.innerHTML = '';
  const input = document.querySelector('#search-input');
  fetchMovies(input.value);
});



element.style {
    position: absolute;
    z-index: 5;
    left: 0;
    background-color: white;
*/
