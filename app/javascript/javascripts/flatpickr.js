require('flatpickr/dist/l10n/ja')
require("flatpickr")
import flatpickr from "flatpickr";
document.addEventListener("turbolinks:load", () => {
  flatpickr("[class='flatpickr']", {
    disableMobile: true
  })
})
