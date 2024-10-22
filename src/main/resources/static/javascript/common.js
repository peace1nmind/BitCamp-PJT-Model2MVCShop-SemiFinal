var priceFormat = () => {

	$("#productPrice").each(function() {
		var price = Number($(this).text().trim()).toLocaleString();
		
		$(this).text(price);
	});

}