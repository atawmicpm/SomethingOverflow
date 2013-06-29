var Comment = {
  init: function() {
    $('#answers-box').on('click', '.comment-toggle', this.toggleComment);
  },

  toggleComment: function(e) {
    e.preventDefault();
    var $commentBox = $(this).parent().parent().next().toggle();
  },
}

$(document).ready(function() {
  Comment.init();
});
