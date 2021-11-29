import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    console.log(".connected")
    const markers = document.querySelectorAll(".mapboxgl-marker")
    console.log(markers)
  }

}
