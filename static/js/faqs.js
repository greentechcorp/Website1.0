var numQuestions = $('#FAQs').find('.faq-list li').length;
let i;
let j;
for(i = 0; i < numQuestions; i++) {
	$('#FAQs').find('.question-' + i.toString()).click((event) => {
		$(event.target).parent().find('.answer').slideDown();
		var questionClasses = $(event.target).attr('class');
		var questionNo = questionClasses[questionClasses.length-1];
		for (j = 0; j < numQuestions; j++) {
			if (j != questionNo) {
				$('#FAQs').find('.answer-' + j.toString()).slideUp();
			}
		}
	});
}