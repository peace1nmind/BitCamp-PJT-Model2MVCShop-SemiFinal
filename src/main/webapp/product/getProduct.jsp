<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>

<html>

	<head>

		<meta charset="EUC-KR">
		<title>Model2MVCShop-getProduct</title>
		
		<%@ include file="/common/import.jsp" %>
		
		<script type="text/javascript" src="/javascript/jsp/getProduct.js"></script>

	</head>

	<body>
		
		<c:if test="${ menu != 'pop' }">
			<jsp:include page="/layout/toolbar.jsp" />
		</c:if>
		
		<div class="container">
		
			<div class="page-header">
	       		<h3 class=" text-info">��ǰ����ȸ</h3>
	    	</div>
	    	
	    	<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
				<div class="col-xs-8 col-md-4" id="prodNo">${ product.prodNo }</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>��ǰ��</strong></div>
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
		  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
				<div class="col-xs-8 col-md-4">${ product.prodDetail }</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
				<div class="col-xs-8 col-md-4"><span id="productManuDate">${ product.manuDate }</span></div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
				<div class="col-xs-8 col-md-4" id="productPrice"><span>${ product.price }</span> ��</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>�������</strong></div>
				<div class="col-xs-8 col-md-4">${ product.regDate}</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-md-12 text-right ">
		  			
		  			<c:if test="${ menu == 'search' }">
		  			
		  				<c:choose>
		  					
		  					<c:when test="${ user.role == 'admin' }">
		  						<button type="button" class="btn btn-primary">����</button>
		  					</c:when>
		  					
		  					<c:when test="${ user.role != 'admin' && product.proTranCode == '1' }">
		  						<button type="button" class="btn btn-primary">����</button>
		  					</c:when>
		  					
		  				</c:choose>
		  				
		  				<button type="button" class="btn btn-primary">����</button>
		  			
		  			</c:if>
		  			
		  			<c:if test="${ menu == 'manage' }">
		  				
		  				<c:choose>
		  				
		  					<c:when test="${ fnc == 'add' }">
		  						<button type="button" class="btn btn-primary">���</button>
		  					</c:when>
		  					
		  					<c:when test="${ fnc == 'update' }">
		  						<button type="button" class="btn btn-primary">����</button>
		  					</c:when>
		  				
		  				</c:choose>
		  				
		  				<button type="button" class="btn btn-primary">Ȯ��</button>
		  				
		  			</c:if>
		  			
		  		</div>
			</div>
		
		</div>
	
	</body>

</html>