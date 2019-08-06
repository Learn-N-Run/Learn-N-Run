function postxhr(url,cssSelector) {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			document.querySelector('#testclass').innerHTML = xhr.responseText;
		}else{
			console.log('아직');
		}
	};
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.open('POST', url);
	xhr.send("fname=Henry&lname=Ford");	
	xhr.send();
	
}