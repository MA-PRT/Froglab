import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch-status"
export default class extends Controller {
  static targets = [ "status" ]
  static values = { id: Number }

  connect() {
    console.log(this.idValue)
  }

  switch(e) {
    const currentStatus = e.currentTarget.checked
    console.log(currentStatus)

    this.statusTarget.innerHTML = currentStatus ? "complétée" : "active"

    fetch(`update_status/${this.idValue}?status=${currentStatus ? 1 : 0}`,{
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
      },
    })

    if (currentStatus === false) {
      this.statusTarget.classList.remove("card-tkt-show-resolu-txt");
      this.statusTarget.classList.add("card-tkt-show-encours-txt");
    } else if (currentStatus === true) {
      this.statusTarget.classList.remove("card-tkt-show-encours-txt");
      this.statusTarget.classList.add("card-tkt-show-resolu-txt");
    }
    }
}
