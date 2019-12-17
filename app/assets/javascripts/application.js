$('.accept-correction').on('click', function() {
  $('.hidden_form').toggle()
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
