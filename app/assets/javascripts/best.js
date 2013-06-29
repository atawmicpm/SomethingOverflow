var Best = {

	init: function() {
		this.setBest();
		$('.best_answer').on('ajax:success', this.chooseBest)
	},

	chooseBest: function() {
		$('.best_answer').show();
		$('h2').hide();
		var bestAnswer = $('h2').clone();
		$('.answer').css('border', '1px solid white');
		$('.answer').css('background-color', '#eee');
		$(this).hide();
		$(this).closest('.answer').css('background-color','#DCF0F7');
		$(this).closest('.answer').css('border','1px solid lightblue');
		$(this).closest('.answer').prepend($bestAnswer);
	},

	setBest: function() {

		$('#best-answer').css('background-color','#DCF0F7');
		$('#best-answer').css('border','1px solid lightblue');
		$('#best-answer').children().find('.best_answer').hide();
	}

}

$(document).ready(function() {
  Best.init();
});