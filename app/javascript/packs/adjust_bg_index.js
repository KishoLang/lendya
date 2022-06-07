const { viewport } = require("@popperjs/core");

// Get bg class for index
let bg = document.getElementById("bg-index");
let container = document.getElementById("cards-container");

if (container.clientHeight > window.innerHeight) {
  bg.style.height = "100%";
}
