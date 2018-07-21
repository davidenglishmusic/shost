// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

const setUpGrid = function() {
	const gridWidth = 100;
	const gridHeight = 100;
	let xcoor = 0;
	let ycoor = 0;
	const pointHeight = $( "#central-image" ).height() / 100;
	for (let item = gridHeight, asc = gridHeight <= 0; asc ? item <= 0 : item >= 0; asc ? item++ : item--) {
		$( "#grid-container" ).append( `<div class="grid-point" id="${xcoor}-${ycoor}" style="height:${pointHeight}px;"></div>` );
		for (let element = gridWidth, asc1 = gridWidth <= 0; asc1 ? element <= 0 : element >= 0; asc1 ? element++ : element--) {
			$( "#grid-container" ).append( `<div class="grid-point" id="${xcoor}-${ycoor}" style="height:${pointHeight}px;"></div>` );
			xcoor++;
			if (xcoor > gridWidth) {
				xcoor = 0;
			}
		}
		ycoor++;
	}
	return console.log("Finished Creating Grid");
};

const appendPreviousNotes = function() {
	$( '.previous-pop-note').each(function() {
		const noteXCoor = $(this).attr('id').match(/\d+/);
		console.log(this);
		console.log(noteXCoor);
		const noteYCoor = $(this).attr('id').match(/[^-]+$/);
		console.log(noteYCoor);
		const destination = `#${noteXCoor}-${noteYCoor}`;
		console.log(destination);
		return $(destination).append(this);
	});
	return console.log("Added points");
};


const scoreviewSetup = function() {
	setUpGrid();
	return appendPreviousNotes();
};

$(window).load(scoreviewSetup);
