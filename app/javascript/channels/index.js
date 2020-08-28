// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

import { fetchMedia } from './media_searchbar.js';

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)


document.addEventListener("turbolinks:load", () => {
  const form = document.querySelector('#search-media');
  const results = document.querySelector("#results");
  form.addEventListener('keyup', (event) => {
    event.preventDefault();
    results.innerHTML = "";
    // const input = document.querySelector('#search-input');
    fetchMedia(form.value);
  });
});
