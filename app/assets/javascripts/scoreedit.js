// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener("grid-setup-complete", e => {
  $(".grid-point").click(function() {
    if (!$(this).find('.pop').length) {
      let pointID = $(this).attr('id');
      let template = $('#form-template').html();
      let currentInfoData = $('#score-edit-current-page-information').data();
      $(this).append(`<div class="pop" id="pop${pointID}"><div class="pop-info">${template}</div></div>`);
      $('.pop .pop-info #new_songnote input#songnote_songtitle', this).val(currentInfoData.notesDefaultSongTitle);
      $('.pop .pop-info #new_songnote input#songnote_page', this).val(currentInfoData.notesDefaultSongPage);
      $('.pop .pop-info #new_songnote input#songnote_xcoordinate', this).val(pointID.match(/\d+/));
      $('.pop .pop-info #new_songnote input#songnote_ycoordinate', this).val(pointID.match(/[^-]+$/));
    }
  });
});
