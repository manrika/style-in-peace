import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["share"]

  share() {
    window.open("https://twitter.com/share?ref_src=twsrc%5Etfw")
  }
}
