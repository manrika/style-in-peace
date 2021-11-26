import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["card", "info"]

  changeCard() {
    // this.cardTarget.insertAdjacentHTML("afterbegin", "<div style='width: 300px; height: auto; '><%= render 'brands/info_card', brand: brand %></div >");
    this.cardTarget.classList.add('d-none')
    this.infoTarget.classList.remove('d-none')
  }

  changeCardBack() {
    // this.cardTarget.insertAdjacentHTML("afterbegin", "<div style='width: 300px; height: auto; '><%= render 'brands/info_card', brand: brand %></div >");
    this.cardTarget.classList.remove('d-none')
    this.infoTarget.classList.add('d-none')
  }

}
