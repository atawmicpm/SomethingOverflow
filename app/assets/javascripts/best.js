var Best = {

	init: function() {
		this.setBest();
		$('#answers-box').on('ajax:success', '.best_answer', this.chooseBest)
	},

	chooseBest: function() {
		// $('.best_answer').show();
		// $('.answer').css('border', '1px solid white');
		// $('.answer').css('background-color', '#eee');

		

		// var $clone = $(this).closest('.answer').clone();
		// $(this).closest('.answer').css('opacity', '0').hide('blind', {}, 700, function() { 
		// 	$(this).remove();
		// });
		// setTimeout(function(){
		// 	$(this).hide();
		// 	$clone.css('background-color','#DCF0F7');
		// 	$clone.css('border','1px solid lightblue');

		// 	$('#answers-box').prepend($clone)
		// 	$clone.hide().show('blind');
		// }, 700);



		$('.best_answer').show();
		$('.answer').css('border', '1px solid white');
		$('.answer').css('background-color', '#eee');
		
		$(this).hide();
		
		$(this).closest('.answer').css('background-color','#DCF0F7');
		$(this).closest('.answer').css('border','1px solid lightblue');
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
