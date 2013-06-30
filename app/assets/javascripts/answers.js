var Answer = {
  init: function() {

    $('#new_answer').on('ajax:success', this.appendAnswer);
    $('#new_answer').on('ajax:error', this.appendErrors);
  },

  appendAnswer: function(e, data) {
    $('#answers-box').prepend(data);
    Answer.clearInput();
    Answer.clearMessages();
  },

  appendErrors: function(e, xhr, status, error) {
    Answer.clearMessages();
    $('.messages').append(xhr.responseText);
  },

  clearInput: function() {
    $('.answer-input').val('');
  },

  clearMessages: function() {
    $('.messages').html('');
  }
}

$(document).ready(function() {
  Answer.init();
});
