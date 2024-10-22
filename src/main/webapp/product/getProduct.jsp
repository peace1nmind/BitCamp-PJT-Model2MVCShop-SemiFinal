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
	
		<jsp:include page="/layout/toolbar.jsp" />
		
		<div class="container">
		
			<div class="page-header">
	       		<h3 class=" text-info">상품상세조회</h3>
	    	</div>
	    	
	    	<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
				<div class="col-xs-8 col-md-4" id="prodNo">${ product.prodNo }</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>상품명</strong></div>
				<div class="col-xs-8 col-md-4">${ product.prodName }</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>상품이미지</strong></div>
				<div class="col-xs-8 col-md-4">
					<c:if test="${!empty product.fileName }">
						<img src = "/images/uploadFiles/${product.fileName }" width="300" height="300"/>
					</c:if>
				</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>상품상세정보</strong></div>
				<div class="col-xs-8 col-md-4">${ product.prodDetail }</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
				<div class="col-xs-8 col-md-4"><span id="productManuDate">${ product.manuDate }</span></div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>가격</strong></div>
				<div class="col-xs-8 col-md-4"><span id="price">${ product.price }</span> 원</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>등록일자</strong></div>
				<div class="col-xs-8 col-md-4">${ product.regDate}</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-md-12 text-right ">
		  			
		  			<c:if test="${ menu == 'search' }">
		  			
		  				<c:choose>
		  					
		  					<c:when test="${ user.role == 'admin' }">
		  						<button type="button" class="btn btn-primary">수정</button>
		  					</c:when>
		  					
		  					<c:when test="${ user.role == 'user' && product.proTranCode == '1' }">
		  						<button type="button" class="btn btn-primary">구매</button>
		  					</c:when>
		  					
		  				</c:choose>
		  				
		  				<button type="button" class="btn btn-primary">이전</button>
		  			
		  			</c:if>
		  			
		  			<c:if test="${ menu == 'manage' }">
		  			
		  				<button type="button" class="btn btn-primary">확인</button>
		  				<button type="button" class="btn btn-primary">추가등록</button>
		  				
		  			</c:if>
		  			
		  		</div>
			</div>
		
		</div>
	
	</body>

</html>