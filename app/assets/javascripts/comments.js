var Comment = {
  init: function() {
    $('#yield').on('click', '.comment-toggle', this.toggleComment);
    $('.new_comment').on('ajax:success', this.appendComment);
    $('.new_comment').on('ajax:error', this.appendErrors);
  },

  toggleComment: function(e) {
    e.preventDefault();
    $(this).closest('.answer-box').children('.comments').toggle();
  },

  appendComment: function(e, data) {
    var $errorsBox = $(this).parent().next();
    $errorsBox.next().prepend(data);
    Comment.clearInput();
    Comment.clearMessages($errorsBox);
  },

  appendErrors: function(e, xhr) {
    var $errorsBox = $(this).parent().next();
    Comment.clearMessages($errorsBox);
    $errorsBox.append(xhr.responseText);
  },

  clearInput: function() {
    $('#comment_content').val('');
  },

  clearMessages: function(errorsBox) {
    errorsBox.html('');
  }
}

$(document).ready(function() {
  Comment.init();
});
