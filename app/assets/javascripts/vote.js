var Vote = {
  init: function() {
    Vote.onLoad();
    $(document).on('ajax:success', '.up', this.upVote);
    $(document).on('ajax:success', '.down', this.downVote);
  },

  onLoad: function() {
    $('.vote-buttons').each(function() {
      var value = $(this).data('vote-value');
      var $upButton = $(this).find('.up');
      var $downButton = $(this).find('.down');
      switch(value) {
        case 1:
          Vote.modifyVotes($upButton, $downButton);
          break;
        case -1:
          Vote.modifyVotes($downButton, $upButton);
          break;
      }
    });
  },

  upVote: function(e, data) {
    var $upButton = $(this);
    var $downButton = $(this).next();
    Vote.modifyVotes($upButton, $downButton, data.vote_id, data.vote_count);
    Vote.sortAnswers();
  },

  downVote: function(e, data) {
    var $downButton = $(this);
    var $upButton = $(this).prev();
    Vote.modifyVotes($downButton, $upButton, data.vote_id, data.vote_count);
    Vote.sortAnswers();
  },

  modifyVotes: function(live_button, disabled_button, vote_id, vote_count) {
    live_button.parent().attr('data-vote-id', vote_id);
    Vote.updateVoteCount(live_button, vote_count);
    Vote.modifyLiveVote(live_button);
    Vote.modifyDisabledVote(disabled_button);
  },

  updateVoteCount: function(button, vote_count) {
    button.parent().prev().find('#num-votes').text(vote_count);
  },

  modifyLiveVote: function(live_button) {
    live_button.css('opacity', '1');
    live_button.attr('data-method', 'put');
    live_button.prop('disabled', true);
    live_button.on("click", function(e) {
      e.preventDefault();
    });
  },

  sortAnswers: function() {
    $('.answer-box:not(:first)').tsort('#num-votes', { order: 'desc' });
  },

  // sortAnswers: function() {
  //   var $answersBox = $('#answers-box');
  //   $answersBox.css({position:'relative',height:$answersBox.height(),display:'block'});

  //   var answerBoxHeight;
  //   var $answer = undefined;
  //   var $answer = $('.answer-box:not(:first)');

  //   $answer.each(function(index, answer){
  //     var answerTopPosition = $(answer).position().top;
  //     $.data(answer,'topPosition',answerTopPosition);
  //     if (index===0) answerBoxHeight = answerTopPosition;
  //   });
    
  //   $answer.tsort('#num-votes', { order: 'desc' }).each(function(index,answer){
  //     var $Answer = $(answer);
  //     var indexFrom = $.data(answer,'topPosition');
  //     var indexTo = ((index+1)*answerBoxHeight);
  //     $Answer.css({position:'absolute',top:indexFrom}).animate({top:indexTo},500);
  //   });

  //   $answer.each(function(index, answer){
  //     var $Answer = $(answer);
  //     $Answer.css({position:'absolute'});
  //   });

  // },

  modifyDisabledVote: function(disabled_button) {
    var voteID = disabled_button.parent().data('vote-id');
    var newLink = disabled_button.attr('href').replace(/votes\?/, 'votes/' + voteID + '?');
    disabled_button.attr('href', newLink);
    disabled_button.prop('disabled', false);
    disabled_button.attr('data-method', 'put');
    disabled_button.css('opacity', '0.5');
  }
};

$(document).ready(function() {
  Vote.init();
  Vote.sortAnswers();
});
