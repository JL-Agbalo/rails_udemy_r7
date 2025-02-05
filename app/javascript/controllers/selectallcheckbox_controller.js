import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["checkbox", "chkheader"];

  connect() {
    console.log("SelectAllCheckbox controller connected");
  }

  toggleCheckboxes(event) {
    let isChecked = event.target.checked;
    this.checkboxTargets.forEach((checkbox) => {
      checkbox.checked = isChecked;
    });
  }
}
