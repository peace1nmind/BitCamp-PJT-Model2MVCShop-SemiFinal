// /product/addProduct.jsp

$(function() {
	
	// ��ǰ����ȸ�� ��ư
	$("button").on('click', function() {
		var text = $(this).text().replace(/\s/g, "");
		var prodNo = $("#prodNo").text().replace(/\s/g, "");
		
		console.log(text);
		
		switch(text) {
			case "����":
				$(self.location).attr("href", "/product/updateProduct?prodNo="+prodNo);
				break;
			
			case "����":
				$(self.location).attr("href", "/purchase/addPurchase?prodNo="+prodNo);
				break;
				
			case "����":
				history.back();
				break;
				
			case "Ȯ��":
				$(self.location).attr("href", "/product/manageProduct");
				break;
			
			case "���":
				$(self.location).attr("href", "/product/addProduct");
				break;
		}
		
	});
	
	priceFormat();
	
});
