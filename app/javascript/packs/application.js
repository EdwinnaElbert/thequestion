// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
$(document).on('turbolinks:load', function() {
  $('.accept-correction').on('click', function() {
    var correction_id = $(this).data('correction-id');
    $('.hidden_form_' + correction_id).toggle()
  })

  $('.show_correction').on('mouseover', function() {
    var diff_answer_id = $(this).data('diff-answer-id');
    var answer_id = $(this).data('answer-id');

    $.ajax({
      type : "GET",
      url : window.location.origin + '/diff_answers/' + diff_answer_id,
      datatype : "json",
      success : function(data) {
        $('.answer_' + answer_id).html(data.data);
    }});
  })

  $('.show_correction').on('mouseout', function() {
    var diff_answer_id = $(this).data('diff-answer-id');
    var answer_id = $(this).data('answer-id');

    $.ajax({
      type : "GET",
      url : window.location.origin + '/answers/' + answer_id,
      datatype : "json",
      success : function(data) {
        $('.answer_' + answer_id).html(data.data);
    }});
  })
});
