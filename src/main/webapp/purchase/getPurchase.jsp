<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>

<html>

	<head>

		<meta charset="EUC-KR">
		<title>Model2MVCShop-getPurchase</title>
		
		<%@ include file="/common/import.jsp" %>
		
		<script type="text/javascript" src="/javascript/jsp/getPurchase.js"></script>

	</head>

	<body>
	
		<jsp:include page="/layout/toolbar.jsp" />
		
		<c:set var="product" value="${ purchase.purchaseProd }"></c:set>
		
		<div class="container">
		
			<div class="page-header">
	       		<h3 class=" text-info">����������ȸ</h3>
	    	</div>
	    	
	    	<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
				<div class="col-xs-8 col-md-4" id="prodNo">${ product.prodNo }</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>��ǰ�� (<a id="getProduct" data-prodno=${ product.prodNo }>��ǰ�󼼺���</a>)</strong></div>
				<div class="col-xs-8 col-md-4">${ product.prodName }</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>��ǰ�̹���</strong></div>
				<div class="col-xs-8 col-md-4">
					<c:if test="${!empty product.fileName }">
						<img src = "/images/uploadFiles/${product.fileName }" width="300" height="300"/>
					</c:if>
				</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>������ ���̵�</strong></div>
				<div class="col-xs-8 col-md-4">${ purchase.buyer.userId }</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>���Ź��</strong></div>
				<div class="col-xs-8 col-md-4">${(!empty purchase.paymentOption && purchase.paymentOption=='1')? "���ݱ���" : "�ſ뱸��" }</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>�����ݾ�</strong></div>
				<div class="col-xs-8 col-md-4" id="productPrice"><span>${ product.price }</span> ��</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>�޴� ���</strong></div>
				<div class="col-xs-8 col-md-4">${ purchase.receiverName }</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>�޴� ��� ����ó</strong></div>
				<div class="col-xs-8 col-md-4">${ purchase.receiverPhone }</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>�����</strong></div>
				<div class="col-xs-8 col-md-4">${ purchase.dlvyAddr }</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>��� ��û����</strong></div>
				<div class="col-xs-8 col-md-4">${ purchase.dlvyRequest }</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>������</strong></div>
				<div class="col-xs-8 col-md-4">${ purchase.orderDate }</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>��� �����</strong></div>
				<div class="col-xs-8 col-md-4">${ purchase.dlvyDate }</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-md-12 text-right ">
		  		
		  			<c:if test="${ purchase.tranCode < 3 }">
		  				<button type="button" class="btn btn-primary" data-tranno="${ purchase.tranNo }">����</button>
		  			</c:if>
		  			
		  			<button type="button" class="btn btn-primary">${ (user.role == 'user') ? "���Ÿ��" : "����" }</button>
		  			
		  		</div>
			</div>
			
			<hr/>
		
		</div>
	
	</body>

</html>