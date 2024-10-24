/* /purchase/getPurchase */

function getProductPage(prodNo){
	popWin = window.open("/product/getProduct?menu=pop&prodNo="+prodNo, "popWin", 
						"left=300, top=200, width=800, height=600, marginwidth=0, marginheight=10, scrollbars=no, scrolling=no, menubar=no, resizable=no");
}

$(function() {
	
	priceFormat();
	
	$("#getProduct").on('click', function() {
		let prodNo = $(this).data("prodno");
		
		getProductPage(prodNo);
	});
	
	// ��ư
	$("button").on('click', function() {
		
		var text = $(this).text().replace(/\s/g, "");
		
		console.log(text);
		
		switch (text) {
			
			case "��ǰ���" :
				$(self.location).attr("href", "/product/listProduct");
				break;
			
			case "���Ÿ��" :
				$(self.location).attr("href", "/purchase/listPurchase");
				break;
			
			case "����" :
				history.back();
				break;
				
			case "����" :
				let tranNo = $(this).data("tranno");
				$(self.location).attr("href", "/purchase/updatePurchase?tranNo="+tranNo);
				break;
		}
		
	});
})