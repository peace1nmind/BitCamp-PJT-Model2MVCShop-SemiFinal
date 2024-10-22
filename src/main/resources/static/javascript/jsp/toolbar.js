/* /layout/toobar.jsp */

$(function() {
	
	$(".navbar a").on('click', function() {
		var text = $(this).text().replace(/\s/g, "");
		
		let list = {"회원가입":"/user/addUser", 
					"로그인":"/user/login",
					"로그아웃":"/user/logout",
					"회원관리":`/user/getUser?userId=user.userId`,
					"개인정보조회":`/user/getUser?userId=userId`,
					"회원정보조회":"/user/listUser",
					"상품구매":"/product/listProduct",
					"상품검색":"/product/listProduct",
					"최근본상품":"/product/history",
					"구매이력조회":"/purchase/listPurcahse",
					"판매상품등록":"/product/addProduct",
					"판매상품관리":"/product/manageProduct",
					"Model2MVCShop":"/"
					};
					
		let link = list[text];
		
		if (link != undefined) {
			if (text=="로그아웃") {
				if(confirm("로그아웃하시겠습니까?")) {
					$(self.location).attr("href", link);
				}
			} else {
				$(self.location).attr("href", link);
			}
		} else {
			alert("Undefined Request");
		}
		
	});
	
});