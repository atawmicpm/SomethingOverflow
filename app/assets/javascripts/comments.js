var Comment = {
  init: function() {
    $('#yield').on('click', '.comment-toggle', this.toggleComment);
    $('.new_comment').on('ajax:success', this.appendComment);
    $('.new_comment').on('ajax:error', this.appendErrors);
  },

  toggleComment: function(e) {
    e.preventDefault();
 
    var link = $(this);
    link.siblings().last().slideToggle();
    if (link.text() == "Add/View Comments") {
      link.text("Hide Comments");
    }
    else {
      link.text("Add/View Comments");
    }
  },

  appendComment: function(e, data) {
    var commentBox = $(this).parent().siblings().closest('.comment-box');

    if (commentBox.children().length === 0) {
      commentBox.html(data);
    }
    else {
      commentBox.prepend(data);
    }

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
};

$(document).ready(function() {
  Comment.init();
});
