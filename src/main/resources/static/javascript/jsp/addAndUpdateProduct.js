// /product/addProductView

function productCheck(fnc){
	
	//Form ��ȿ�� ����
 	var name = $("input[name='prodName']").val();
	var detail = $("#prodDetail").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();
	
	confirm(manuDate);

	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}

	switch(fnc) {
		case "add":
			$("form").attr("action", "/product/addProduct");
			break;
		
		case "update":
			$("form").attr("action", "/product/updateProduct");
			break;
	}
	
	console.log("action : "+$("form").attr("action"));
	
	$("form").submit();
}


function resetData(){
	$("form")[0].reset();
}


$(function() {
	
	$("form").attr("method", "POST").attr("enctype", "multipart/form-data");
	
	var fnc = $("input[name='fnc']").val();
	console.log("fnc : "+fnc);
	
	// ��ư �Լ�
	$("button").on('click', function() {
		var text = $(this).text().replace(/\s/g, "");
		
		switch(text) {
			case "���":
				productCheck(fnc);
				break;
			
			case "����":
				productCheck(fnc);
				break;
			
			case "�ʱ�ȭ":
				resetData();
				break;
				
			case "����":
				history.back();
				break;
		}
	});
	
	// ��ǰ �� ���� ���ڼ� ����
	$("#prodDetail").on('input', function() {
		
		const maxChar = 200;
		
		if ($("#prodDetail").val().length > maxChar) {
			$("#prodDetail").text().substring(0, maxChar);
			alert("�� ������ �ִ� "+maxChar+"�ڱ��� �Է� �����մϴ�.");
		}
		
	});
	
});
