/* /product/manageProduct - 상품관리 */

function fncGetManageProductList(page){
	
	let bigger = parseInt($("input[name='searchPriceBigger']").val());
	let less = parseInt($("input[name='searchPriceLess']").val());
	
	if (bigger - less > 0 && bigger - less != bigger) {
		alert("가격 범위가 올바르지 않습니다");
		$("input[name='searchPriceBigger']").focus();
	} else {
		$("input[name='page']").val(page);
		$("form").submit();
	}
	
}

$(function() {
		
	$("form").attr("action", "/product/manageProduct").attr("method", "post");
	
	// 엔터 검색
	$(document).on("keydown", function(event) {
		if (event.key == 'Enter') {
			fncGetManageProductList(1);
		}
	});
	
	
	// 리셋 버튼
	$("#reset").on('click', function() {
		$("select[name='searchCondition']").val("0");
		$("input[name='searchKeyword'").val("");
		$("input[name='searchPriceBigger'], input[name='searchPriceLess']").val(0);
		$("input[type='radio']").prop("checked", false);
		$("input[type='checkbox']").prop("checked", false)
	});
	
	// 검색버튼
	$("#search").on('click', function() {
		fncGetManageProductList(1);
	});
	
	
	$("button.btn-sm").on('click', function() {
		let link = $(this).data("href");
		let prodNo = $(this).data("prodno");
		
		if (link == "/purchase/updateTranCode") {
			
			let tranCode = $(this).data("trancode");
			
			$("input[name='prodNo'").val(prodNo);
			$("input[name='tranCode'").val(tranCode);
			
			switch (tranCode) {

				// 구매확정
				case 5 :
					text = "구매확정하시겠습니까?"
					break;
				
				// 배송완료
				case  4 :
					text = "배송완료하시겠습니까?";
				 break;
				 
				 // 배송시작
				 case 3 :
					text = "배송하시겠습니까?";
					break;
			}
			
			if (confirm(text)) {
				$("form").attr("action", "/purchase/updateTranCode").submit();
			}
			
		} else {
			$(self.location).attr("href", link+"prodNo="+prodNo);
		}
	});
	

	pageNavigate("paging", fncGetManageProductList);
	priceFormat();
});
