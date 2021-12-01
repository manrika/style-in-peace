import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["shadow", "card", "info"]

  changeCard() {
    this.cardTarget.classList.add('hidden')
    this.infoTarget.classList.remove('hidden')
    this.shadowTarget.classList.add('shadowed')
  }

  changeCardBack() {
    this.cardTarget.classList.remove('hidden')
    this.infoTarget.classList.add('hidden')
    this.shadowTarget.classList.remove('shadowed')
  }

}
