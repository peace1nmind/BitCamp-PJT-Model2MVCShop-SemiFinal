/* /layout/toobar.jsp */

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
					"�����̷���ȸ":"/purchase/listPurcahse",
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
			} else {
				$(self.location).attr("href", link);
			}
		} else {
			alert("Undefined Request");
		}
		
	});
	
});