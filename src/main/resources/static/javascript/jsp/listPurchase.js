/* /purchase/listPurchase */

function searchCheck() {
	
	let bigger = parseInt($("input[name='searchPriceBigger']").val());
	let less = parseInt($("input[name='searchPriceLess']").val());
	
	let startDate = $("input[name='startDate']").val();
	let endDate = $("input[name='endDate']").val();
	
	let okFlag = true;
	
	if (bigger - less > 0 && bigger - less != bigger) {
		alert("���� ������ �ùٸ��� �ʽ��ϴ�");
		$("input[name='searchPriceBigger']").focus();
		
		okFlag = false;
	}
	
	if (startDate > endDate) {
		alert("���� �Ⱓ ������ �ùٸ��� �ʽ��ϴ�")
		
		okFlag = false;
	}
	
	console.log("okFlag : "+okFlag);
	
	return okFlag;
}

function fncGetPurchaseList(page) {
	
	let okFlag = searchCheck();
	
	if (okFlag) {
		$("input[name='page']").val(page);
		$("form").submit();
	}
}

function fncGetPurchaseHistoryList(page) {
	
	let okFlag = searchCheck();
		
	if (okFlag) {
		$("input[name='historyPage']").val(page);
		$("form").submit();
	}
}

// ��۽���, ��ۿϷ�, ����Ȯ��
function fncUpdateTranCode(tranNo, tranCode) {
	
	let text = "";
	alert (tranCode);
	
	switch (tranCode) {

		// ����Ȯ��
		case 5 :
			text = "����Ȯ���Ͻðڽ��ϱ�?"
			break;
		
		// ��ۿϷ�
		case  4 :
			text = "��ۿϷ��Ͻðڽ��ϱ�?";
		 break;
		 
		 // ��۽���
		 case 3 :
			text = "����Ͻðڽ��ϱ�?";
			break;
	}
	
	if (confirm(text)) {
		$(self.location).attr("href", "/purchase/updateTranCode?tranNo="+tranNo+"&tranCode="+tranCode);
	}
	
}

$(function () {
	
	$("form").attr("action", "/purchase/listPurchase").attr("method", "POST");
	
	// ���� �˻�
	$(document).on("keydown", function(event) {
		if (event.key == 'Enter') {
			$("input[name='historyPage']").val(1);
			fncGetPurchaseList(1);
		}
	});
	
	// �˻���ư
	$("#search").on('click', function() {
		$("input[name='historyPage']").val(1);
		fncGetPurchaseList(1);
	});
		
	// ���� ��ư
	$("#reset").on('click', function() {
//		$("select[name='searchCondition']").val("0");
//		$("input[name='searchKeyword'").val("");
//		$("input[name='searchPriceBigger'], input[name='searchPriceLess']").val(0);
//		$("input[type='radio']").prop("checked", false);
		
	});
	
	// ������� ����
	// updateTranCode
	$(".updateTranCode").on('click', function() {
		var tranNo = $(this).data("tranno");
		var tranCode = $(this).data("trancode");
		
		fncUpdateTranCode(tranNo, tranCode);
	});
	
	// ���� �Լ�
	pageNavigate("paging", fncGetPurchaseList);
	pageNavigate("historyPaging", fncGetPurchaseHistoryList);
	priceFormat()
	
});