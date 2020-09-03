// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
// import '../components/hovercards.js'
import { setFavouriteButtons }from '../components/buttons.js'
import { setWatchlistButtons }from '../components/watchlist.js'
import { setSeenButtons }from '../components/seen.js'
import { giveRating, rateClick }from '../components/rating.js'
import { ratingSlide }from '../components/ratingSlider.js'


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  setFavouriteButtons();
  setWatchlistButtons();
  setSeenButtons();
  $(function () {
    $('[data-toggle="tooltip"]').tooltip({
      trigger : 'hover'
    })
  });
  giveRating();   // bottom three can cause trouble, just move to the bottom or fix your shit!
  ratingSlide();
  rateClick();
});

