function changecenter(value) {
	var xhttp;
	if(window.XMLHttpRequest) {
		xhttp = new XMLHttpRequest();
	} else {
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.onreadystatechange = function() {
		if(this.readyState == 4 && this.status == 200) {
			var array = JSON.parse(this.responseText); 
			var options = '';
			for (var x = 0; x < array.length; x++){
				options += '<option value="' + array[x] + '">' + array[x] + '</option>';
			}
			$('#center').html(options);
		}
	};
	xhttp.open("GET", "FoodieeServlet?action=centerList&city="+value, true);
	xhttp.send();
}


function getcity() {
	var xhttp;
	nakul = "Hello";
	if(window.XMLHttpRequest) {
		xhttp = new XMLHttpRequest();
	} else {
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.onreadystatechange = function() {
		if(this.readyState == 4 && this.status == 200) {
			var array = JSON.parse(this.responseText); 
			var options = '<option value="">---Select City---</option>';
			for (var x = 0; x < array.length; x++){
				options += '<option value="' + array[x] + '">' + array[x] + '</option>';
			}
			$('#city').html(options);
		}
	};
	xhttp.open("GET", "FoodieeServlet?action=cityList", true);
	xhttp.send();
}

function addItem(productId, productName){
	check = productId;
	check1 = productName;
	var xhttp;
	if(window.XMLHttpRequest) {
		xhttp = new XMLHttpRequest();
	} else {
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.onreadystatechange = function() {
		if(this.readyState == 4 && this.status == 200) {
		 array = JSON.parse(this.responseText); 
		}
	};
	xhttp.open("GET", "FoodieeServlet?action=addItem&productId="+productId+ "&productName="+productName, true);
	xhttp.send();	
	return true;
}
