import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['cards', 'form', 'input', 'search'];

  updateBrandsIndex() {
    console.log(this.cardsTarget);
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.cardsTarget.outerHTML = data;
      })
  }
}
