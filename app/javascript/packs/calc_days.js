console.log("Hello from My JS");

days_booked = 0;
//Get the button
const start_button = document.getElementById("booking_pick_up_3i");
const end_button = document.getElementById("booking_return_3i");
// const days_booked_html = document.getElementById("days-booked");

const currentDate = new Date();
const day = currentDate.getDate();
let start_day = day;
let end_day = 0;

start_button.addEventListener("input", calcStartDay);
end_button.addEventListener("input", calcEndDay);

// When the user clicks on the button, scroll to the top of the document
function calcStartDay() {
  if (start_button.value > start_day) {
    start_day = start_button.value;
  }
  console.log(start_day);
}

function calcEndDay() {
  if (end_button.value < start_day) {
    alert("Please enter a valid return day!");
    end_day = start_day;
  } else {
    end_day = end_button.value;
  }
  days_booked = end_day - start_day;
  console.log(days_booked);
  document.getElementById("days").textContent = days_booked;
  const item_price = document.getElementById("item-price").textContent;
  const price_between = (document.getElementById(
    "item-price-between"
  ).textContent = item_price * days_booked);
  document.getElementById("item-price-total").textContent = price_between + 3;
}
