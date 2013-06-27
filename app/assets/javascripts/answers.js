var Answer = {
  init: function() {
    $('#new_answer').on('ajax:success', this.appendAnswer);
    $('#new_answer').on('ajax:error', this.appendErrors);
  },

  appendAnswer: function(e, data) {
    $('.answers').append(data);
    $('.answer_input').val('');
    $('.messages').html('');
  },

  appendErrors: function(e, xhr, status, error) {
    $('.messages').append(xhr.responseText);
  }
}

$(document).ready(function() {
  Answer.init();
});
