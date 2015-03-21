//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap.min
//= require_tree  .

function slideChallengers(show) {
	if (show) {
		$('#challengerContainer').addClass("is-visible");
	} else {
		$('#challengerContainer').removeClass("is-visible");
	}
}