class InPageSearch
	constructor: () ->
	

	adjustListToSearchKeyword: (inputTerm) ->
		$("#infoTable tbody tr").each (index, element) =>
			console.log $(element).text()
			if ($(element).text().toLowerCase().indexOf(inputTerm.toLowerCase()) != -1)
				$(element).show()
			else
				$(element).hide()

$(document).ready ->
	$("input[name='searchField']").keyup ->
		v = $("input[name='searchField']").val()
		console.log(v)
		searchObject = new InPageSearch
		searchObject.adjustListToSearchKeyword(v)
