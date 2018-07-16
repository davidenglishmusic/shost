# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

setUpGrid = () ->
	gridWidth = 100
	gridHeight = 100
	xcoor = 0
	ycoor = 0
	pointHeight = $( "#central-image" ).height() / 100
	for item in [gridHeight..0]
		$( "#grid-container" ).append( '<div class="grid-point" id="' + xcoor + '-' + ycoor + '" style="height:' + pointHeight + 'px;"></div>' )
		for element in [gridWidth..0]
			$( "#grid-container" ).append( '<div class="grid-point" id="' + xcoor + '-' + ycoor + '" style="height:' + pointHeight + 'px;"></div>' );
			xcoor++
			if xcoor > gridWidth
				xcoor = 0
		ycoor++
	console.log "Finished Creating Grid"

appendPreviousNotes = () ->
	$( '.previous-pop-note').each ->
		noteXCoor = $(this).attr('id').match(/\d+/)
		console.log this
		console.log noteXCoor
		noteYCoor = $(this).attr('id').match(/[^-]+$/)
		console.log noteYCoor
		destination = "#" + noteXCoor + "-" + noteYCoor
		console.log destination
		$(destination).append(this)
	console.log "Added points"


scoreviewSetup = () ->
	setUpGrid()
	appendPreviousNotes()

$(window).load(scoreviewSetup)
