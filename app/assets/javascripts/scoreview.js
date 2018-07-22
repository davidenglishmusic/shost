// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

const setUpGrid = function() {
  const gridWidth = 100;
  const gridHeight = 100;
  let xcoor = 0;
  let ycoor = 0;
  const pointHeight = $("#central-image").height() / 100;
  for (let i = 0; i < gridHeight; i++) {
    $("#grid-container").append(`<div class="grid-point" id="${xcoor}-${ycoor}" style="height:${pointHeight}px;"></div>`);
    for (let j = 0; j < gridWidth; j++) {
      $("#grid-container").append(`<div class="grid-point" id="${xcoor}-${ycoor}" style="height:${pointHeight}px;"></div>`);
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
  $('.previous-pop-note').each(function() {
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
  appendPreviousNotes();
  document.dispatchEvent(new Event('grid-setup-complete'));
};

$(window).load(scoreviewSetup);
