const { viewport } = require("@popperjs/core");

// Get bg class for index
let bg = document.getElementById("bg-show");
let container = document.getElementById("show-container");

if (container.clientHeight > window.innerHeight) {
  bg.style.height = "100%";
}
