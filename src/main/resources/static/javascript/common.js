function priceFormat() {

	$("#productPrice span").each(function() {
		
		var price = Number($(this).text().trim()).toLocaleString();
		
		console.log(price);
		
		$(this).text(price);
	});

}
