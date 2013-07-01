var Comment = {
  init: function() {
    $('#yield').on('click', '.comment-toggle', this.toggleComment);
    $('.new_comment').on('ajax:success', this.appendComment);
    $('.new_comment').on('ajax:error', this.appendErrors);
  },

  toggleComment: function(e) {
    e.preventDefault();
    $(this).siblings().last().slideToggle();
  },

  appendComment: function(e, data) {
    $(this).closest('.comments').children('.comment-box').prepend(data);
    Comment.clearInput();
    var $errorsBox = $(this).closest('.comments').children('#errors');
    Comment.clearMessages($errorsBox);
  },

  appendErrors: function(e, xhr) {
    var $errorsBox = $(this).closest('.comments').children('#errors');
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
