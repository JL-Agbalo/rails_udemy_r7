// Not Working!
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["salaryInput", "allowanceSalary", "netSalary"];

  connect() {
    console.log("Salary controller connected");
  }

  calculate(event) {
    const salary = parseFloat(this.salaryInputTarget.value) || 0;
    const percentage = parseFloat(event.target.dataset.percentage) || 0;
    const allowance = (salary * percentage) / 100;
    const netSalary = salary + allowance;

    this.allowanceSalaryTarget.value = allowance.toFixed(2);
    this.netSalaryTarget.value = netSalary.toFixed(2);
  }
}
