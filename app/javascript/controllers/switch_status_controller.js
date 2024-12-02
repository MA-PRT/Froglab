import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch-status"
export default class extends Controller {
  connect() {
    console.log("SwitchStatusController connected")
  }

  switch() {
    console.log("SwitchStatusController switch")
  }
}
