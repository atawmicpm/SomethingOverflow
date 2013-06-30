var Best = {

	init: function() {
		this.setBest();
		$('#answers-box').on('ajax:success', '.best_answer', this.chooseBest);
	},

	// MEGA MOOOOOOTH!!! Refactor to OOJS plz...

	chooseBest: function() {

		$('.best_answer').show();
		$('.answer').css('border', '1px solid white');
		$('.answer').css('background-color', '#eee');

		$(this).hide();

		var bestAnswer = $(this).closest('.answer');
		var firstAnswer = $('#answers-box').children().first();

		firstAnswer.animate({opacity: "0.0"});
		var firstClone = firstAnswer.clone();

		bestAnswer.animate({opacity: "0.0"});
		var bestClone = bestAnswer.clone();

		firstAnswer.replaceWith(bestClone);
		bestClone.css("opacity", "0.0");
		bestClone.css('background-color','#DCF0F7');
		bestClone.css('border','1px solid lightblue');
		bestClone.animate({opacity: "1.0"});

		bestAnswer.replaceWith(firstClone);
		firstClone.css("opacity", "0.0");
		firstClone.animate({opacity: "1.0"});

	},

	setBest: function() {

		$('#best-answer').css('background-color','#DCF0F7');
		$('#best-answer').css('border','1px solid lightblue');
		$('#best-answer').children().find('.best_answer').hide();
	}

};

$(document).ready(function() {
	Best.init();
});
