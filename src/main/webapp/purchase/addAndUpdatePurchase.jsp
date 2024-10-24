<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>

<html>

	<head>

		<meta charset="EUC-KR">
		<title>Model2MVCShop-${ fnc }Purchase</title>
		
		<%@ include file="/common/import.jsp" %>
		
		<script type="text/javascript" src="/javascript/jsp/addAndUpdatePurchase.js"></script>

	</head>

	<body>
	
		<jsp:include page="/layout/toolbar.jsp" />
		
		<c:if test="${ fnc == 'update' }">
			<c:set var="product" value="${ purchase.purchaseProd }"></c:set>
		</c:if>
		
		<form>
		
		<input type="hidden" name="prodNo" value="${ product.prodNo }">
		
		<c:if test="${ fnc == 'update' }">
			<input type="hidden" name="tranNo" value="${ purchase.tranNo }">
		</c:if>
		
		<div class="container">
		
			<div class="page-header">
	       		<h3 class=" text-info">
	       			<c:if test="${ fnc == 'add' }">
	       				상품구매
	       			</c:if>
	       			<c:if test="${ fnc == 'update' }">
	       				구매정보 수정
	       			</c:if>
	       		</h3>
	    	</div>
	    	
	    	<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
				<div class="col-xs-8 col-md-4" id="prodNo">${ product.prodNo }</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>상품명 (<a id="getProduct" data-prodno=${ product.prodNo }>상품상세보기</a>)</strong></div>
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
		  		<div class="col-xs-4 col-md-2 "><strong>구매자 아이디</strong></div>
				<div class="col-xs-8 col-md-4">
					<c:if test="${ fnc == 'add' }">
						${ user.userId }
						<input type="hidden" name="buyerId" value="${ user.userId }" />
					</c:if>
					<c:if test="${ fnc == 'update' }">
						${ purchase.buyer.userId }
						<input type="hidden" name="buyerId" value="${purchase.buyer.userId }">
					</c:if>
				</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><label for="paymentOption">구매방법</label></div>
				<div class="col-xs-8 col-md-4">
					<select name="paymentOption" class="form-control" id="paymentOption">
						<option value="1" ${ (fnc == 'add')? "selected" : ((purchase.paymentOption == 1)? "selected" : "") }>현금구매</option>
						<option value="2" ${ (fnc == 'update' && purchase.paymentOption == 2)? "selected" : "" }>신용구매</option>
					</select>
				</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>결제금액</strong></div>
				<div class="col-xs-8 col-md-4" id="productPrice"><span>${ product.price }</span> 원</div>
			</div>
			
			<hr/>
			
			<div class="row">
				
		  		<div class="col-xs-4 col-md-2 "><label for="receiverName">받는 사람 *</label></div>

				<div class="col-xs-8 col-md-4">
						<input type="text" id="receiverName" name="receiverName" value="${(fnc == 'add')? user.userId :  purchase.receiverName }" class="form-control">
				</div>
	
				
			</div>
			
			<hr/>
			
			<div class="row">
			    <div class="col-xs-4 col-md-2">
			        <label for="receiverPhone">받는 사람 연락처 *</label>
			    </div>
			    
			    <div class="col-sm-2">
			        <select class="form-control" name="phone1" id="phone1">
			            <option value="010">010</option>
			            <option value="011">011</option>
			            <option value="016">016</option>
			            <option value="018">018</option>
			            <option value="019">019</option>
			        </select>
			    </div>
			
			    <div class="col-sm-2">
			        <input type="tel" class="form-control" id="phone2" name="phone2" placeholder="번호" pattern="[0-9]{4}" value="${(fnc=='add') ? user.phone2 : purchase.buyer.phone2}" required>
			    </div>
			
			    <div class="col-sm-2">
			            <input type="tel" class="form-control" id="phone3" name="phone3" placeholder="번호" pattern="[0-9]{4}" value="${(fnc=='add') ? user.phone3 : purchase.buyer.phone3}" required>

			    </div>

				
			    <input type="hidden" name="receiverPhone"/>
			</div>

			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><label for="dlvyAddr">배송지 *</label></div>
				<div class="col-xs-8 col-md-4">
		            <input 	type="text" id="dlvyAddr" name="dlvyAddr" value="${(fnc=='add')? user.addr :purchase.dlvyAddr }" class="form-control" placeholder="배송지를 입력해주세요.">
				</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><label for="dlvyRequest">배송 요청사항</label></div>
				<div class="col-xs-8 col-md-4">
					<textarea name="dlvyRequest" class="form-control" id="dlvyRequest" rows="3" placeholder="배송 요청사항을 입력해주세요" style="resize: none;">${ purchase.dlvyRequest }</textarea>
					<span class="help-block">* 최대 100자</span>
				</div>
			</div>
			
			<hr/>
			
			<c:if test="${ fnc == 'update' }">
				<div class="row">
			  		<div class="col-xs-4 col-md-2 "><strong>구매일</strong></div>
					<div class="col-xs-8 col-md-4">${ purchase.orderDate }</div>
				</div>
				
				<hr/>
			</c:if>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>배송 희망일</strong></div>
				<div class="col-xs-8 col-md-4">
					<input type="date" name="dlvyDate" value="${ purchase.dlvyDate }" id="dlvyDate" class="form-control" >	
				</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-md-12 text-right ">
		  		
		  			<c:if test="${ product.proTranCode == 1 }">
		  				<button type="button" class="btn btn-primary" data-prodno="${ product.prodNo }">구매</button>
		  			</c:if>
		  		
		  			<c:if test="${ purchase.tranCode < 3 }">
		  				<button type="button" class="btn btn-primary" data-tranno="${ purchase.tranNo }">수정</button>
		  			</c:if>
		  		
		  			<button type="button" class="btn btn-primary">이전</button>
		  			
		  		</div>
			</div>
			
			<hr/>
		
		</div>
		</form>
	
	</body>

</html>