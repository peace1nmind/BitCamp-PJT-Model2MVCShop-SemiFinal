<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>

<html>

	<head>

		<meta charset="EUC-KR">
		<title>Model2MVCShop-${ fnc }Product</title>
		
		<%@ include file="/common/import.jsp" %>
		
		<script type="text/javascript" src="/javascript/jsp/addAndUpdateProduct.js"></script>

	</head>

	<body>
	
		<jsp:include page="/layout/toolbar.jsp" />
		
		<div class="container">
			
			<form>
		
			<input type="hidden" name="fnc" value="${ fnc }">
			
			<div class="page-header">
	       		<h3 class=" text-info">${ (fnc == 'add')? "상품등록" : "상품수정" }</h3>
	    	</div>
	    	
	    	<c:if test="${ fnc == 'update' }">
		    	<div class="row">
			  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
					<div class="col-xs-8 col-md-4" id="prodNo">
						${ product.prodNo }
						<input type="hidden" name="prodNo" value="${(empty product.prodNo)? 0 : product.prodNo }" />
					</div>
				</div>
				
				<hr/>
				
			</c:if>
			
			<div class="form-group">
				<div class="row">
			  		<div class="col-xs-4 col-md-2 ">
			  			<label for="prodName">상품명</label>
			  		</div>
					<div class="col-xs-8 col-md-4">
						<input type="text" name="prodName" class="form-control" value="${ product.prodName }" id="prodName" placeholder="상품명을 입력해주세요." >
					</div>
				</div>
			</div>
			
			<hr/>
			
			<div class="form-group">
			<div class="row">
		  		<div class="col-xs-4 col-md-2 ">
		  			<label for="file">상품이미지</label>
		  		</div>
				<div class="col-xs-8 col-md-4">
					<c:if test="${fnc == 'update' && !empty product.fileName }">
						<p class="help-block">기존 이미지</p>					
						<img src = "/images/uploadFiles/${product.fileName }" width="300" height="300"/>
						<p>&nbsp;</p>
					</c:if>
					
					<input type="file" name="file" id="file" accept="image/*">
					<p class="help-block">이미지 파일을 올려주세요</p>
				</div>
			</div>
			</div>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 ">&nbsp;</div>
		  		<div class="col-xs-8 col-md-4">
					
				</div>
			</div>
			
			<hr/>
			
			<div class="form-group">
			<div class="row">
		  		<div class="col-xs-4 col-md-2 ">
		  			<label for="prodDetail">상품상세정보</label>
		  		</div>
				<div class="col-xs-8 col-md-4">
					<textarea name="prodDetail" class="form-control" id="prodDetail" rows="3" placeholder="상품 상세정보를 입력해주세요." style="resize: none;">${ product.prodDetail }</textarea>
					<span class="help-block">* 최대 200자</span>
				</div>
			</div>
			</div>
			
			<hr/>
			
			<div class="form-group">
			<div class="row">
		  		<div class="col-xs-4 col-md-2">
		  			<label for="manuDate">제조일자</label>
		  		</div>
				<div class="col-xs-8 col-md-4">
					<input type="date" name="manuDate" value="${ product.manuDate }" id="manuDate" class="form-control" >
				</div>
			</div>
			</div>
			
			<hr/>
			
			<div class="form-group">
			<div class="row">
		  		<div class="col-xs-4 col-md-2 ">
		  			<label for="price">가격</label>
		  		</div>
				<div class="col-xs-8 col-md-4">
					<div class="input-group">
						<input type="text" name="price" value="${ product.price }" id="price" class="form-control" placeholder="상품 가격을 입력해주세요.">
						<span class="input-group-addon">원</span>
					</div>
				</div>
			</div>
			</div>
			
			<hr/>
			
			<c:if test="${ fnc == 'update' }">
				
				<div class="row">
			  		<div class="col-xs-4 col-md-2 "><strong>등록일자</strong></div>
					<div class="col-xs-8 col-md-4">${ product.regDate}</div>
				</div>
				
				<hr/>
			</c:if>
			
			<div class="row">
		  		<div class="col-md-12 text-right ">
		  			
		  			<button type="button" class="btn btn-primary">초기화</button>
	  				<button type="button" class="btn btn-primary">${ (fnc == 'add')? "등록" : "수정" }</button>
	  				<button type="button" class="btn btn-primary">이전</button>

		  		</div>
			</div>
			
			<hr/>
			
		</form>
		
		</div>
	
	</body>

</html>