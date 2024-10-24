/* /purchase/listPurchase */

function searchCheck() {
	
	let bigger = parseInt($("input[name='searchPriceBigger']").val());
	let less = parseInt($("input[name='searchPriceLess']").val());
	
	let startDate = $("input[name='startDate']").val();
	let endDate = $("input[name='endDate']").val();
	
	let okFlag = true;
	
	if (bigger - less > 0 && bigger - less != bigger) {
		alert("가격 범위가 올바르지 않습니다");
		$("input[name='searchPriceBigger']").focus();
		
		okFlag = false;
	}
	
	if (startDate > endDate) {
		alert("구매 기간 설정이 올바르지 않습니다")
		
		okFlag = false;
	}
	
	console.log("okFlag : "+okFlag);
	
	return okFlag;
}

function fncGetPurchaseList(page) {
	
//	let okFlag = searchCheck();
	
//	if (okFlag) {
		$("input[name='page']").val(page);
		$("form").submit();
//	}
}

function fncGetPurchaseHistoryList(page) {
	
//	let okFlag = searchCheck();
		
//	if (okFlag) {
		$("input[name='historyPage']").val(page);
		$("form").submit();
//	}
}

// 배송시작, 배송완료, 구매확정
function fncUpdateTranCode(tranNo, tranCode) {
	
	let text = "";
	alert (tranCode);
	
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
		$(self.location).attr("href", "/purchase/updateTranCode?tranNo="+tranNo+"&tranCode="+tranCode);
	}
	
}

function getToday() {
	
	let today = new Date();
	let year = today.getFullYear();
	let month = (today.getMonth() + 1).toString().padStart(2, '0');
	let day = today.getDate().toString().padStart(2, '0');
	
	return `${year}-${month}-${day}`
}

function getMonthAgo() {
	
	let monthAgo = new Date();
	monthAgo.setMonth(monthAgo.getMonth() - 1);
	
	let year = monthAgo.getFullYear();
	let month = (monthAgo.getMonth() + 1).toString().padStart(2, '0');
	let day = monthAgo.getDate().toString().padStart(2, '0');
	
	return `${year}-${month}-${day}`
}


$(function () {
	
	$("form").attr("action", "/purchase/listPurchase").attr("method", "POST");
	
	// 엔터 검색
	$(document).on("keydown", function(event) {
		if (event.key == 'Enter') {
			
			if (searchCheck()) {
				$("input[name='historyPage']").val(1);
				fncGetPurchaseList(1);
			}
		}
	});
	
	// 검색버튼
	$("#search").on('click', function() {
		
		if (searchCheck()) {
			$("input[name='historyPage']").val(1);
			fncGetPurchaseList(1);
		}
		
	});
		
	// 리셋 버튼
	$("#reset").on('click', function() {
		$("select[name='searchCondition']").val("0");
		$("input[name='searchKeyword'").val("");
		$("input[name='searchPriceBigger'], input[name='searchPriceLess']").val(0);
		$("input[type='radio']").prop("checked", false);
		
		$("input[name='startDate']").val(getMonthAgo());
		$("input[name='endDate']").val(getToday());
		
	});
	
	// 배송정보 수정
	// updateTranCode
	$(".updateTranCode").on('click', function() {
		var tranNo = $(this).data("tranno");
		var tranCode = $(this).data("trancode");
		
		fncUpdateTranCode(tranNo, tranCode);
	});
	
	// 공통 함수
	pageNavigate("paging", fncGetPurchaseList);
	pageNavigate("historyPaging", fncGetPurchaseHistoryList);
	priceFormat()
	
});