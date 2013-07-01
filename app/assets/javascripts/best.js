var Best = {

	init: function() {
		this.setBest();
		$('#answers-box').on('ajax:success', '.best_answer', this.chooseBestAnswer);
	},
	
	setBest: function() {
		$('#best-answer').css('background-color','#DCF0F7');
		$('#best-answer').css('border','1px solid lightblue');
		$('#best-answer').children().find('.best_answer').hide();
	},

	chooseBestAnswer: function() {
		var bestAnswer = $(this).closest('.answer');
		var firstAnswer = $('#answers-box').children().first();
		
		Best.hideBestAnswerLink($(this));
		Best.replaceBestAnswer(firstAnswer, bestAnswer);
	},

	hideBestAnswerLink: function(bestAnswerLink) {
		$('.best_answer').show();
		$('.answer').css('border', '1px solid white');
		$('.answer').css('background-color', '#eee');
		bestAnswerLink.hide();
	},

	replaceBestAnswer: function(answer1, answer2) {
		var firstAnswer = answer1.clone();
		var bestAnswer = answer2.clone();

		answer1.replaceWith(bestAnswer);
		Best.styleBestAnswer(bestAnswer);
		bestAnswer.animate({opacity: "1.0"}, 600);

		answer2.replaceWith(firstAnswer);
		firstAnswer.css("opacity", "0.0");
		firstAnswer.animate({opacity: "1.0"}, 600);
	},

	styleBestAnswer: function(bestAnswer) {
		bestAnswer.css("opacity", "0.0");
		bestAnswer.css('background-color','#DCF0F7');
		bestAnswer.css('border','1px solid lightblue');
	}
};

$(document).ready(function() {
	Best.init();
});
