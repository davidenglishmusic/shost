import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["scoreImg", "gridContainer", "previousNotes"]

  connect() {
    this.setupGrid();
    this.appendPreviousNotes();
    if (this.element.dataset.editing === 'true') {
      this.setupGridEditing();
    }
  }

  setupGrid() {
    const gridWidth = 100;
    const gridHeight = 100;
    let xCoordinate = 0;
    let yCoordinate = 0;
    const pointHeight = $(this.scoreImgTarget).height() / 100;
    const gridContainer = $(this.gridContainerTarget);
    for (let i = 0; i < gridHeight; i++) {
      gridContainer.append(`<div class="grid-point" id="${xCoordinate}-${yCoordinate}" style="height:${pointHeight}px;"></div>`);
      for (let j = 0; j < gridWidth; j++) {
        gridContainer.append(`<div class="grid-point" id="${xCoordinate}-${yCoordinate}" style="height:${pointHeight}px;"></div>`);
        xCoordinate++;
        if (xCoordinate > gridWidth) {
          xCoordinate = 0;
        }
      }
      yCoordinate++;
    }
  }

  appendPreviousNotes() {
    const previousNotes = JSON.parse(this.previousNotesTarget.dataset.previousNotes);
    for (let index in previousNotes) {
      const previousNote = previousNotes[index];
      $(`#${previousNote.xcoordinate}-${previousNote.ycoordinate}`).append(
        `<div id="pop-note-${previousNote.xcoordinate}-${previousNote.ycoordinate}" class="previous-pop-note">
           <div class="previous-pop-note-info">
             <h4>Measure(s)</h4>
             <h5>${previousNote.measure}</h5>
             <h4>Note</h4>
             <h5>${previousNote.note}</h5>
           </div>
         </div>`);
    }
  }

  setupGridEditing() {
    $(".grid-point").click(function() {
      if (!$(this).find(".pop").length) {
        let pointID = $(this).attr("id");
        let template = $('#form-template').html();
        let currentInfoData = $('#score-edit-current-page-information').data();
        $(this).append(`<div class="pop" id="pop${pointID}"><div class="pop-info">${template}</div></div>`);
        $('.pop .pop-info #new_songnote input#songnote_songtitle', this).val(currentInfoData.notesDefaultSongTitle);
        $('.pop .pop-info #new_songnote input#songnote_page', this).val(currentInfoData.notesDefaultSongPage);
        $('.pop .pop-info #new_songnote input#songnote_xcoordinate', this).val(pointID.match(/\d+/));
        $('.pop .pop-info #new_songnote input#songnote_ycoordinate', this).val(pointID.match(/[^-]+$/));
      }
    });
  }

  disconnect() {
    $(".grid-point").off('click');
  }
}
