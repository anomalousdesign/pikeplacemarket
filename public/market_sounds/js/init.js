audiojs.events.ready(function() {
	var ajso = audiojs.createAll();
 	$('.next').live('click', function(){
		var thisIndex = $(this).parents('.audiojs').index('.audiojs');
		$.each(ajso, function(index,val){
			if ( index != thisIndex && ajso[index].playing ) ajso[index].pause(); 
		});
	});
});

$(document).ready(function() {

	var count = 0;	
	var howmanyquestions = $(".question").length;
	$(".answers li").click(function(){
		if (!($(this).parent("ul").hasClass("answered"))) {
			$(this).parent("ul").siblings(".next-sound, .submit").animate({opacity: 1}, 500);
			$(this).find(".radio").addClass("selected");
			$(this).parent("ul").addClass("answered");
			if (!($(this).hasClass("correct"))) {
				var correctanswer = $(this).siblings(".correct").find('p').text();
				$(this).addClass("wronganswer");
				$(this).siblings(".correct").addClass("realanswer");
				$(this).parent().parent().children("div").prepend('<p>You guessed INCORRECTLY. The correct answer was <span class="green">' + correctanswer + '</span>.<br />Try the next sound!</p>');
				$(this).parent().parent().children("div").addClass("wrong");
				$(this).parent().parent().children("div").fadeTo(500, 1);
			}
			if ($(this).hasClass("correct")) {
				count++;
				$(this).addClass("correctanswer");
				$(this).parent().parent().children("div").prepend('<p>You are CORRECT! Try the next sound!</p>');
				$(this).parent().parent().children("div").addClass("right");
				$(this).parent().parent().children("div").fadeTo(750, 1);
			}
			if ($('.answered').length == howmanyquestions) {
				if(count == 0) {
					$('.total').html('You guessed ' + count + ' out of ' + howmanyquestions + ' correctly.</strong> Play again!');
				}
				if(count > 0 && count < 7) {
					$('.total').html('Great effort! <strong>You guessed ' + count + ' out of ' + howmanyquestions + ' correctly!</strong>');
				}
				if(count > 6 && count < 12) {
					$('.total').html('Well done! <strong>You guessed ' + count + ' out of ' + howmanyquestions + ' correctly!</strong>');
				}
				if(count > 11) {
					$('.total').html('Very Impressive! <strong>You guessed ' + count + ' out of ' + howmanyquestions + ' correctly!</strong>');
				}
			}
		}
	});
	
	$('a.next-sound, a.submit').css('opacity','0');
		  
	$('#slides').slides({
		effect: 'slide',
		play: 0,
		generatePagination: false
	});
	
	$.fn.shuffle = function() {
		var allElems = this.get(),
			getRandom = function(max) {
				return Math.floor(Math.random() * max);
			},
			shuffled = $.map(allElems, function(){
				var random = getRandom(allElems.length),
					randEl = $(allElems[random]).clone(true)[0];
				allElems.splice(random, 1);
				return randEl;
		   });
		this.each(function(i){
			$(this).replaceWith($(shuffled[i]));
		});
		return $(shuffled);
	};
	
	$('.question').each(function() {
		$(this).find('.answers li').shuffle();
		$(this).find('.answers li:eq(1)').addClass('middle');
	});

});


