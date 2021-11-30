import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['articles', 'form', 'input', 'search'];

  connect() {
    console.log("news controller connected");
  }

  updateNews(event) {
    console.log("updating news...");
    console.log(this.articlesTarget);
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.articlesTarget.outerHTML = data;
      })
    event.preventDefault();
  }
}
