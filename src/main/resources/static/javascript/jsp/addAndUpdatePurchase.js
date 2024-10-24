/* /purchase/addAndUpdatePurchase */

function getToday() {
	
	let today = new Date();
	let year = today.getFullYear();
	let month = (today.getMonth() + 1).toString().padStart(2, '0');
	let day = today.getDate().toString().padStart(2, '0');
	
	return `${year}-${month}-${day}`
}

function getProductPage(prodNo){
	popWin = window.open("/product/getProduct?menu=pop&prodNo="+prodNo, "popWin", 
						"left=300, top=200, width=800, height=600, marginwidth=0, marginheight=10, scrollbars=no, scrolling=no, menubar=no, resizable=no");
}

function fncAddAndUpdatePurchase() {
	
	let okFlag = true;
	
	// �޴� ���, �޴� ��� ����ó, ������� �ʼ�
	
	// �޴� ���
	let receiverName = $("input[name='receiverName']").val();
	let dlvyAddr = $("input[name='dlvyAddr']").val();
	let dlvyDate = $("input[name='dlvyDate'").val();
	
	let text = "";
	
	// �޴� ���
	if (receiverName == "") {
		text = ((text == "")? text : text + "\n")+ "�޴� ����� �Է����ּ���."
		okFlag = false;
	}
	
	// �޴� ��� ����ó
	var value = "";	
	if( $("input[name='phone2']").val() != ""  &&  $("input[name='phone3']").val() != "") {
		
		const numPattern = /^\d+$/;
	
		if (!numPattern.test($("input[name='phone2']").val()) || !numPattern.test($("input[name='phone3']").val())) {
			text = ((text == "")? text : text + "\n")+ "����ó�� ���ڸ� �����մϴ�.";
			okFlag = false;
		} else {
			var value = $("#phone1 option:selected").val() + "-" 
					+ $("input[name='phone2']").val() + "-" 
					+ $("input[name='phone3']").val();
		
			$("input:hidden[name='receiverPhone']").val( value );
			
			okFlag = true;
		}
		
	} else {
		text = ((text == "")? text : text + "\n")+ "�޴� ��� ����ó�� �Է����ּ���."
		okFlag = false;
	}
	
	// �����
	if (dlvyAddr == "") {
		text = ((text == "")? text : text + "\n")+ "������� �Է����ּ���."
		okFlag = false;
	}
	
	// ��������
	if (dlvyDate < getToday()) {
		text = ((text == "")? text : text + "\n")+ "���������� �ùٸ��� �ʽ��ϴ�.";
		$("input[name='dlvyDate'").val(getToday());
		okFlag = false;
	}
	
	
	if (okFlag) {
		$("form").submit();
	} else {
		alert(text);
	}
	
}

$(function() {
	
	$("form").attr("method", "POST");
	
	if ($("input[name='dlvyDate'").val() == "") {
		$("input[name='dlvyDate'").val(getToday());
	}
	
	$("#getProduct").on('click', function() {
		let prodNo = $(this).data("prodno");
		
		getProductPage(prodNo);
	});
	
	priceFormat();
	
	$("button").on('click', function() {
		var text = $(this).text().replace(/\s/g, "");
		var prodNo = $("#prodNo").text().replace(/\s/g, "");
		
		console.log(text);
		
		switch(text) {
			case "����":
				$("form").attr("action", "/purchase/updatePurchase");
				fncAddAndUpdatePurchase();
				break;
			
			case "����":
				$("form").attr("action", "/purchase/addPurchase");
				fncAddAndUpdatePurchase();
				break;
				
			case "����":
				history.back();
				break;
		}
		
	});
	
	// ��ǰ �� ���� ���ڼ� ����
	$("#dlvyRequest").on('input', function() {
		
		const maxChar = 100;
		
		if ($("#dlvyRequest").val().length > maxChar) {
			$("#dlvyRequest").text().substring(0, maxChar);
			alert("��� ��û������ "+maxChar+"�ڱ��� �Է� �����մϴ�.");
		}
		
	});
	
});