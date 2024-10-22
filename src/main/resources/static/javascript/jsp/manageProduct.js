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
	
//	$("#getProduct").on('click', function() {
//		let prodNo = $(this).data("prodno");
//		
//		$(self.location).attr("href", "/product/getProdcut?menu=search&prodNo="+prodNo);
//	});
	
	pageNavigate("paging", fncGetManageProductList);
	
	$("button.btn-sm").on('click', function() {
		let link = $(this).data("href");
		let prodNo = $(this).data("prodno");
		
		$(self.location).attr("href", link+"prodNo="+prodNo);
	});
	
	priceFormat();
});
