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
	
	// 받는 사람, 받는 사람 연락처, 배송지는 필수
	
	// 받는 사람
	let receiverName = $("input[name='receiverName']").val();
	let dlvyAddr = $("input[name='dlvyAddr']").val();
	let dlvyDate = $("input[name='dlvyDate'").val();
	
	let text = "";
	
	// 받는 사람
	if (receiverName == "") {
		text = ((text == "")? text : text + "\n")+ "받는 사람을 입력해주세요."
		okFlag = false;
	}
	
	// 받는 사람 연락처
	var value = "";	
	if( $("input[name='phone2']").val() != ""  &&  $("input[name='phone3']").val() != "") {
		
		const numPattern = /^\d+$/;
	
		if (!numPattern.test($("input[name='phone2']").val()) || !numPattern.test($("input[name='phone3']").val())) {
			text = ((text == "")? text : text + "\n")+ "연락처는 숫자만 가능합니다.";
			okFlag = false;
		} else {
			var value = $("#phone1 option:selected").val() + "-" 
					+ $("input[name='phone2']").val() + "-" 
					+ $("input[name='phone3']").val();
		
			$("input:hidden[name='receiverPhone']").val( value );
			
			okFlag = true;
		}
		
	} else {
		text = ((text == "")? text : text + "\n")+ "받는 사람 연락처를 입력해주세요."
		okFlag = false;
	}
	
	// 배송지
	if (dlvyAddr == "") {
		text = ((text == "")? text : text + "\n")+ "배송지를 입력해주세요."
		okFlag = false;
	}
	
	// 배송희망일
	if (dlvyDate < getToday()) {
		text = ((text == "")? text : text + "\n")+ "배송희망일이 올바르지 않습니다.";
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
			case "수정":
				$("form").attr("action", "/purchase/updatePurchase");
				fncAddAndUpdatePurchase();
				break;
			
			case "구매":
				$("form").attr("action", "/purchase/addPurchase");
				fncAddAndUpdatePurchase();
				break;
				
			case "이전":
				history.back();
				break;
		}
		
	});
	
	// 상품 상세 정보 글자수 제한
	$("#dlvyRequest").on('input', function() {
		
		const maxChar = 100;
		
		if ($("#dlvyRequest").val().length > maxChar) {
			$("#dlvyRequest").text().substring(0, maxChar);
			alert("배송 요청사항은 "+maxChar+"자까지 입력 가능합니다.");
		}
		
	});
	
});