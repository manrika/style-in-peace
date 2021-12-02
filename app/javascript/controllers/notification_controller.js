import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['success'];

  connected(event) {
    console.log("Hi, notif controller connected");
    event.preventDefault();
  }

  displaySuccessNotif() {
    console.log("form submitteeed");
    console.log("current_user.brands_referred");
  }
}
