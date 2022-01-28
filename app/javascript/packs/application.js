import 'jquery'
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap'
import '../stylesheets/application'

require('flatpickr')
require('flatpickr/dist/l10n/ja')
require("flatpickr")
import flatpickr from "flatpickr";
document.addEventListener("turbolinks:load", () => {
  flatpickr("[class='flatpickr']", {
    disableMobile: true
  })
})

Rails.start()
Turbolinks.start()
ActiveStorage.start()

const images = require.context('../images', true)
const imagePath = (name) => images(name, true)
