// /product/addProduct.jsp

$(function() {
	
	// 상품상세조회의 버튼
	$("button").on('click', function() {
		var text = $(this).text().replace(/\s/g, "");
		var prodNo = $("#prodNo").text().replace(/\s/g, "");
		
		console.log(text);
		
		switch(text) {
			case "수정":
				$(self.location).attr("href", "/product/updateProduct?prodNo="+prodNo);
				break;
			
			case "구매":
				$(self.location).attr("href", "/purchase/addPurchase?prodNo="+prodNo);
				break;
				
			case "이전":
				history.back();
				break;
				
			case "확인":
				$(self.location).attr("href", "/product/manageProduct");
				break;
			
			case "등록":
				$(self.location).attr("href", "/product/addProduct");
				break;
		}
		
	});
	
	priceFormat();
	
});
