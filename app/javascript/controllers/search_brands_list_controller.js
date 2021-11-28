import { Controller } from "stimulus";
import { useClickOutside } from "stimulus-use";

export default class extends Controller {
  static targets = ['list', 'form', 'input'];

  connect() {
    console.log("Hiding"); // remove me
    this.listTarget.classList.add('d-none');
  }

  displayBrands() {
    console.log("Displaying"); // remove me
    this.listTarget.classList.remove('d-none');
    useClickOutside(this);
  }

  clickOutside(event) {
    console.log("Hiding"); // remove me
    event.preventDefault();
    this.listTarget.classList.add('d-none');
  }

  updateBrandsList(event) {
    console.log("Updating"); // remove me
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
    .then(response => response.text())
    .then((data) => {
      this.listTarget.outerHTML = data;
    })
    // this.listTarget.classList.remove('d-none');
    // event.preventDefault();
  }
}
