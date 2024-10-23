// /product/addProductView

function productCheck(fnc){
	
	//Form 유효성 검증
 	var name = $("input[name='prodName']").val();
	var detail = $("#prodDetail").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
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
	
	// 버튼 함수
	$("button").on('click', function() {
		var text = $(this).text().replace(/\s/g, "");
		
		switch(text) {
			case "등록":
				productCheck(fnc);
				break;
			
			case "수정":
				productCheck(fnc);
				break;
			
			case "초기화":
				resetData();
				break;
				
			case "이전":
				history.back();
				break;
		}
	});
	
	// 상품 상세 정보 글자수 제한
	$("#prodDetail").on('input', function() {
		
		const maxChar = 200;
		
		if ($("#prodDetail").val().length > maxChar) {
			$("#prodDetail").text().substring(0, maxChar);
			alert("상세 정보는 최대 "+maxChar+"자까지 입력 가능합니다.");
		}
		
	});
	
});
