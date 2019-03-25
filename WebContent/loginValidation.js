function formValidation(oEvent) {
	oEvent = oEvent || window.event;
	var txtField = oEvent.target || oEvent.srcElement;

	var status = true;
	if (document.getElementById("userId").value.length < 7 || isNaN(document.getElementById("userId").value)) {
		status = false;
	}
	if (document.getElementById("password").value.length < 3) {
		status = false;
	}

	if (status) {
		document.getElementById("login-button").disabled = false;
	} else {
		document.getElementById("login-button").disabled = true;
	}// end of if checking status of t1ck variable

}

function resetForm() {
	document.getElementById("login-button").disabled = true;
	var frmMain = document.forms[0];
	frmMain.reset();
}

//window.onload = 
function myFunction() {

	var btnSignUp = document.getElementById("login-button");

	var t1 = document.getElementById("userId");
	var t2 = document.getElementById("password");

	var status = false;
	btnSignUp.disabled = true;
	t1.onkeyup = formValidation;
	t2.onkeyup = formValidation;

}