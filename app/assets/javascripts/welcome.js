function submitLogin() {
	username = $(usernameTextBox).val();
	if (username == '') {
		$(usernameTextBox).css('border-color', 'red');
	}
	else 
	{
		$(loginUsername).text("Username: " + username.toUpperCase());
		$(loginMessage).show();
		$(loginInput).hide();
		$(gameDiv).show();
	}
}