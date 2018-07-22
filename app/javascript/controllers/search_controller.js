import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["query"]

  search() {
    const element = this.queryTarget
    const searchQuery = element.value
    $("#infoTable tbody tr").each((index, element) => {
      if ($(element).text().toLowerCase().indexOf(searchQuery.toLowerCase()) !== -1) {
        return $(element).show();
      } else {
        return $(element).hide();
      }
    });
  }
}
