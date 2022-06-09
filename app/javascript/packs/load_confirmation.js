setTimeout(() => {
  const box = document.getElementById("box");
  const loadingBox = document.getElementById("loading-box");

  // 👇️ hides element (still takes up space on page)
  box.style.visibility = "visible";
  loadingBox.style.display = "none";
}, 6000); // 👈️ time in milliseconds
