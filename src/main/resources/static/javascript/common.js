function priceFormat() {

	$("#productPrice span").each(function() {
		
		var price = Number($(this).text().trim()).toLocaleString();
		
		console.log(price);
		
		$(this).text(price);
	});

}

function getToday() {
	
	let today = new Date();
	let year = today.getFullYear();
	let month = (today.getMonth() + 1).toString().padStart(2, '0');
	let day = today.getDate().toString().padStart(2, '0');
	
	return `${year}-${month}-${day}`
}