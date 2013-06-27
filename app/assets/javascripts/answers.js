// REVIEW: super clean, nice!
var Answer = {
  init: function() {
    $('#new_answer').on('ajax:success', this.appendAnswer);
    $('#new_answer').on('ajax:error', this.appendErrors);
  },

  appendAnswer: function(e, data) {
    $('.answers').append(data);
    // REVIEW: I would move this to it's own method, to calrify what you're doing.
    $('.answer_input').val('');
    $('.messages').html('');
  },

  appendErrors: function(e, xhr, status, error) {
    $('.messages').html('');
    $('.messages').append(xhr.responseText);
  }
}

$(document).ready(function() {
  Answer.init();
});
