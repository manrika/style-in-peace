import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['helloPopup', 'successPopup', 'closeHello', 'closeSuccess', 'submit'];

  // connected(event) {
  //   console.log("Hi, notif controller connected");
  //   event.preventDefault();
  // }

  // displaySuccessNotif() {
  //   console.log("form submitteeed");
  //   console.log("current_user.brands_referred");
  // }


  hideHelloPopup() {
    this.helloPopupTarget.classList.add('d-none')
  }

  showSuccessPopup() {
    this.successPopupTarget.classList.remove('d-none')
  }

  hideSuccessPopup() {
    this.successPopupTarget.classList.add('d-none')
  }

}
