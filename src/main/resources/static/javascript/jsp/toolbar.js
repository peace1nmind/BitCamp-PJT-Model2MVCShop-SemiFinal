/* /layout/toobar.jsp */
function historyPage(){
	popWin = window.open("/product/history", "popWin", 
						"left=300, top=200, width=400, height=400, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
}

$(function() {
	
	$(".navbar a").on('click', function() {
		var text = $(this).text().replace(/\s/g, "");
		
		let list = {"ȸ������":"/user/addUser", 
					"�α���":"/user/login",
					"�α׾ƿ�":"/user/logout",
					"ȸ������":`/user/getUser?userId=user.userId`,
					"����������ȸ":`/user/getUser?userId=userId`,
					"ȸ��������ȸ":"/user/listUser",
					"��ǰ����":"/product/listProduct",
					"��ǰ�˻�":"/product/listProduct",
					"�ֱٺ���ǰ":"/product/history",
					"�����̷���ȸ":"/purchase/listPurchase",
					"�ǸŻ�ǰ���":"/product/addProduct",
					"�ǸŻ�ǰ����":"/product/manageProduct",
					"Model2MVCShop":"/"
					};
					
		let link = list[text];
		
		if (link != undefined) {
			if (text=="�α׾ƿ�") {
				if(confirm("�α׾ƿ��Ͻðڽ��ϱ�?")) {
					$(self.location).attr("href", link);
				}
			} else if (text=="�ֱٺ���ǰ") {
				historyPage();
			} else {
				$(self.location).attr("href", link);
			}
		} else {
			alert("Undefined Request");
		}
		
	});
	
});