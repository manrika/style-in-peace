import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['articles', 'form', 'input', 'search'];

  updateNews(event) {
    console.log("updating news...");
    console.log(this.articlesTarget);
    event.preventDefault();
    const url = `${this.formTarget.action}?news_query=${this.inputTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.articlesTarget.outerHTML = data;
      })
  }
}
