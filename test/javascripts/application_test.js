//= require application

QUnit.test("slideChallengers properly adjusts #challengerContainer class", function(assert) {
	element = document.createElement('div')
	element.id = 'challengerContainer';
	document.body.appendChild(element);
	slideChallengers(true);
	assert.equal($('#challengerContainer').hasClass("is-visible"), true, "slideChallengers did not show");
});