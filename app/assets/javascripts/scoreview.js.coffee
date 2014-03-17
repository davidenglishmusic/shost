# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

setUpGrid = () ->
	gridWidth = 100
	gridHeight = 100
	xcoor = 0
	ycoor = 0
	pointWidth = $( "#centralImage" ).width() / gridWidth * 0.98
	#pointWidth = 19
	#console.log $( "#centralImage" ).height()
	pointHeight = $( "#centralImage" ).height() / gridHeight * 0.99
	#console.log pointWidth
	#console.log pointHeight
	for item in [gridHeight..0]
		#console.log xcoor + ',' + ycoor
		$( "#gridContainer" ).append( '<div class="gridPoint" id="' + xcoor + '-' + ycoor + '" style="width:' + pointWidth + 'px;height:' + pointHeight + 'px;float:left;clear:left;"></div>' )
		for element in [gridWidth..0]
			#console.log xcoor + ',' + ycoor
			$( "#gridContainer" ).append( '<div class="gridPoint" id="' + xcoor + '-' + ycoor + '" style="width:' + pointWidth + 'px;height:' + pointHeight + 'px;float:left;"></div>' );
			xcoor++
			if xcoor > gridWidth
				xcoor = 0
		ycoor++
		console.log "Finished Creating Grid"

appendPreviousNotes = () ->
	$( '.previousPopNote').each ->
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


###
jQuery ($) ->
	$( ".gridPoint" ).hover ->
		k = $(this).attr('id')
		#$( "#coordinateDisplay" ).val(k)
		console.log k
###
