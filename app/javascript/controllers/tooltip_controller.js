import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect(){
    $(function() {
      $('[data-toggle="tooltip"]').tooltip()
    })
  }
}
