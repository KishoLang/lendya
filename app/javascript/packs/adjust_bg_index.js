const { viewport } = require("@popperjs/core");

// Get bg class for index
let bg = document.getElementById("bg-index");
let container = document.getElementById("cards-container");
let searchButton = document.getElementById("search-button");

searchButton.addEventListener("click", adjustBackground);

if (container.clientHeight > window.innerHeight) {
  bg.style.height = "100%";
}

function adjustBackground() {
  if (container.clientHeight > window.innerHeight) {
    bg.style.height = "100%";
  }
}
