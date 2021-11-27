import { Controller } from "stimulus";
import { useClickOutside } from "stimulus-use";


export default class extends Controller {
  static targets = ['list'];

  displayBrands() {
    console.log("Hey you got this boo"); // remove me
    this.listTarget.classList.remove('d-none');
    useClickOutside(this)
  }

  clickOutside(event) {
    event.preventDefault()
    this.listTarget.classList.add('d-none');
  }
}
