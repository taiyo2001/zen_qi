import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "modal" ];

  connect() {
    console.log("ok");
  }

  toggleModal() {
    if (this.modalTarget.classList.contains("hidden")) {
      this.modalTarget.classList.remove("hidden");
    } else {
      this.modalTarget.classList.add("hidden");
    }
  }
}
