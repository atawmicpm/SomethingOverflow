$(document).ready(function(){
  $('#answers-box').on('ajax:success', '.answer .up', function(e, data) {
    console.log(data)
    $('#votecount-' + data.answer_id).html(data.vote_count);
  });

  $('#answers-box').on('ajax:success', '.answer .down', function(e, data) {
    console.log(data)
    $('#votecount-' + data.answer_id).html(data.vote_count);
  });

});
