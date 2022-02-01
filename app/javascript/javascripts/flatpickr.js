import flatpickr from "flatpickr";
document.addEventListener("turbolinks:load", () => {
  flatpickr("[class='flatpickr']", {
    disableMobile: true
  })
})