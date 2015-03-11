//= require application

function init() {
	element = document.createElement('div')
	element.id = 'challengerContainer';
	document.body.appendChild(element);
}

QUnit.test("slideChallengers properly adds is-visible class to #challengerContainer element on show=true", function(assert) {
	init();

	slideChallengers(true);
	assert.equal($('#challengerContainer').hasClass("is-visible"), true, "slideChallengers did not show");
});

QUnit.test("slideChallengers properly removes is-visible class to #challengerContainer element show=false", function(assert) {
	init();
	
	slideChallengers(false);
	assert.equal($('#challengerContainer').hasClass("is-visible"), false, "slideChallengers did not show");
});