/* /product/manageProduct - ��ǰ���� */

function fncGetManageProductList(page){
	
	let bigger = parseInt($("input[name='searchPriceBigger']").val());
	let less = parseInt($("input[name='searchPriceLess']").val());
	
	if (bigger - less > 0 && bigger - less != bigger) {
		alert("���� ������ �ùٸ��� �ʽ��ϴ�");
		$("input[name='searchPriceBigger']").focus();
	} else {
		$("input[name='page']").val(page);
		$("form").submit();
	}
	
}

$(function() {
		
	$("form").attr("action", "/product/manageProduct").attr("method", "post");
	
	// ���� �˻�
	$(document).on("keydown", function(event) {
		if (event.key == 'Enter') {
			fncGetManageProductList(1);
		}
	});
	
	
	// ���� ��ư
	$("#reset").on('click', function() {
		$("select[name='searchCondition']").val("0");
		$("input[name='searchKeyword'").val("");
		$("input[name='searchPriceBigger'], input[name='searchPriceLess']").val(0);
		$("input[type='radio']").prop("checked", false);
		$("input[type='checkbox']").prop("checked", false)
	});
	
	// �˻���ư
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
				$("form").attr("action", "/purchase/updateTranCode").submit();
			}
			
		} else {
			$(self.location).attr("href", link+"prodNo="+prodNo);
		}
	});
	

	pageNavigate("paging", fncGetManageProductList);
	priceFormat();
});
