import { Controller } from "@hotwired/stimulus";
import { useClickOutside } from "stimulus-use";

export default class extends Controller {
  static targets = ['list', 'form', 'input', 'search'];

  connect() {
    this.listTarget.classList.add('d-none');
    this.searchTarget.style.borderRadius = "32px";
  }

  displayBrands() {
    this.listTarget.classList.remove('d-none');
    this.searchTarget.style.borderRadius = "32px 32px 0px 0px";
    useClickOutside(this);
  }

  clickOutside(event) {
    this.listTarget.classList.add('d-none');
    this.searchTarget.style.borderRadius = "32px";
  }

  updateBrandsList(event) {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
    .then(response => response.text())
    .then((data) => {
      this.listTarget.outerHTML = data;
    })
  }
}
