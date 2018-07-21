class InPageSearch {
  constructor() {}

  adjustListToSearchKeyword(inputTerm) {
    $("#infoTable tbody tr").each((index, element) => {
      console.log($(element).text());
      if ($(element).text().toLowerCase().indexOf(inputTerm.toLowerCase()) !== -1) {
        return $(element).show();
      } else {
        return $(element).hide();
      }
    });
  }
}

$(document).ready(() =>
  $("input[name='searchField']").keyup(function() {
    const v = $("input[name='searchField']").val();
    console.log(v);
    const searchObject = new InPageSearch;
    return searchObject.adjustListToSearchKeyword(v);
  })
);
