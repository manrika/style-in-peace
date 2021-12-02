import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["share"]
  static values = {url: String}

  share() {
    const message = "Check out this eco-friendly brand!";
    const url = `https://twitter.com/intent/tweet?text=${message}&url=${this.urlValue}`
    window.open(url, "Tweet", "left=100,top=100,width=320,height=320");
  }
}
