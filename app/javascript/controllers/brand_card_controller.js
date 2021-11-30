import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["card", "info"]

  changeCard() {
    this.cardTarget.classList.add('d-none')
    this.infoTarget.classList.remove('d-none')
  }

  changeCardBack() {
    this.cardTarget.classList.remove('d-none')
    this.infoTarget.classList.add('d-none')
  }

}
