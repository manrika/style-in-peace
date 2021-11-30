import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["card", "info"]

  changeCard() {
    this.cardTarget.classList.add('hidden')
    this.infoTarget.classList.remove('hidden')
  }

  changeCardBack() {
    this.cardTarget.classList.remove('hidden')
    this.infoTarget.classList.add('hidden')
  }

}
