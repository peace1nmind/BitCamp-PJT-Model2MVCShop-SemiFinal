// product/listProduct

function fncGetProductList(){
	var bigger = document.detailForm.searchPriceBigger;
	var less = document.detailForm.searchPriceLess;
	if (bigger.value - less.value > 0 && bigger.value - less.value != bigger.value) {
		alert("가격 범위가 올바르지 않습니다");
		document.detailForm.searchPriceBigger.focus();
		document.detailForm.searchPriceBigger.setSelectionRange(document.detailForm.searchPriceBigger.value.length, document.detailForm.searchPriceBigger.value.length);
	} else {
		$("#page1").val(1);
		document.detailForm.submit();
	}
}


$(function() {
		
	$("form").attr("action", "/product/listProduct").attr("method", "post");
	
	
	// 엔터 검색
	$(document).on("keydown", function(event) {
		if (event.key == 'Enter') {
			fncGetProductList();
		}
	});
	
	
	// 리셋 버튼
	$("#reset").on('click', function() {
		$("select[name='searchCondition']").val("0");
		$("input[name='searchKeyword'").val("");
		$("input[name='searchPriceBigger'], input[name='searchPriceLess']").val(0);
		$("input[type='radio']").prop("checked", false);
	});
	
});
