<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>

<html>

	<head>

		<meta charset="EUC-KR">
		<title>Model2MVCShop-manageProduct</title>
		
		<%@ include file="/common/import.jsp" %>
		
		<script type="text/javascript" src="/javascript/jsp/manageProduct.js"></script>
		
		<style type="text/css">
			.panel-body {font-weight: bold;}
			.list-group-item label {font-weight: normal;}
		</style>

	</head>

	<body>
		
		<jsp:include page="/layout/toolbar.jsp" />
		
		<div class="container">
		
			<form>
			
			<input type="hidden" name="page" value="${ search.page }">
			
			<div class="row">
			
				<div class="col-sm-3" style="padding-top : 100px;">
					
					<!-- 상세 검색 -->
					<div class="form-group">
					
						<div class="panel panel-primary">
					
							<div class="panel-heading">
								상세 검색
							</div>
							
							<div class="panel-body">
								상품 상태 체크
							</div>
							
							<div class="list-group">
							
								<li class="list-group-item">
									<div>
										<label>
											<input type="checkbox" name="tranCode" value="1" ${ search.tranCode.contains("1")? "checked" : "" } >&ensp;<span>판매중</span>
										</label>
									</div>
										<label>
											<input type="checkbox" name="tranCode" value="2" ${ search.tranCode.contains("2")? "checked" : "" }>&ensp;<span>구매완료</span>
										</label>
									<div>
										<label>
											<input type="checkbox" name="tranCode" value="3" ${ search.tranCode.contains("3")? "checked" : "" }>&ensp;<span>배송중</span>
										</label>
									</div>
										<label>
											<input type="checkbox" name="tranCode" value="4" ${ search.tranCode.contains("4")? "checked" : "" }>&ensp;<span>배송완료</span>
										</label>
									<div>
									<label>
										<input type="checkbox" name="tranCode" value="5" ${ search.tranCode.contains("5")? "checked" : "" }>&ensp;<span>판매완료</span></div>
									</label>
								</li>
							
							</div>
							
							<div class="panel-body">
								상품 정보 검색
							</div>
							
							<div class="list-group">
							
								<li class="list-group-item">
								
									<select class="form-control" name="searchCondition">
										<option value="0" ${(!empty search.searchCondition && search.searchCondition=='0')? "selected":""}>
											상품번호
										</option>
										<option value="1" ${(!empty search.searchCondition && search.searchCondition=='1')? "selected":""}>
											상품명
										</option>
										<option value="2" ${(!empty search.searchCondition && search.searchCondition=='2')? "selected":""}>
											상품설명
										</option>
									</select>
									
									<input type="text" class="form-control" name="searchKeyword" placeholder="검색어를 입력해주세요" value="${search.searchKeyword}">
								</li>
								
							</div>
							
							<div class="panel-body">
								상품 가격 검색
							</div>
							
							<div class="list-group">
								
								<li class="list-group-item">
									
									<%-- NumberFormat Validation --%>
									<input type="text" name="searchPriceBigger" value="${search.searchPriceBigger}" 
										class="form-control" />
									<div style="text-align: center;">
										<span>~</span>
									</div>
									<input type="text" name="searchPriceLess" value="${search.searchPriceLess}" 
										class="form-control"  />
		  
								</li>
								
							</div>
							
							<div class="panel-body">
								상품 정렬
							</div>
							
							<div class="list-group">
								
								<%-- Search.java Field 변경 필요 --%>
								<li class="list-group-item">
									<div class="form-group">
										<div class="radio">
										  <label>
										    <input type="radio" name="orderByPrice" value="price asc" 
										    	${ (search.orderByPrice == "price asc") ? "checked" : "" }>
										   	가격 오름차순
										  </label>
										  <br/>
										  <label>
										    <input type="radio" name="orderByPrice" value="price desc" 
										    	${ (search.orderByPrice == "price desc") ? "checked" : "" }>
										   	가격 내림차순
										  </label>
										</div>
									</div>
									
								</li>
								
								<li class="list-group-item">
								
									<div class="form-group">
										<div class="radio">
										  <label>
										    <input type="radio" name="orderByProdName" value="prod_name asc" 
										    	${ (search.orderByProdName == "prod_name asc") ? "checked" : "" }>
										   	상품명 오름차순
										  </label>
										  <br/>
										  <label>
										    <input type="radio" name="orderByProdName" value="prod_name desc" 
										    	${ (search.orderByProdName == "prod_name desc") ? "checked" : "" }>
										   	상품명 내림차순
										  </label>
										</div>
									</div>

								</li>
								
							</div>
							<button type="button" class="btn btn-default btn-block" id="reset">리셋</button>
							<button type="button" class="btn btn-default btn-block" id="search">검색</button>
							
						</div>
						
					</div>
				
				</div>
				
				
				<div class="col-sm-9">
					
					<div class="page-header text-info">
						<h3>판매 상품 관리</h3>
						<p class="text-primary">
			    			전체  ${ paging.total } 건수, 현재 ${ paging.currentPage}  페이지
			    		</p>
					</div>
					
					<div class="row" id="productList">
					<!-- 상품 리스트 시작 -->
					<c:forEach items="${map.list}" var="product" varStatus="status">
					
						<div class="col-sm-3">
						
							<div class="thumbnail">
						    	<img class="img-rounded" src="/images/uploadFiles/${ product.fileName }" style="width: 172px; height: 180px;">
						    	<div class="caption">
							        <h4>${ product.prodName }</h4>
							        <p><span class="label label-${colorMap[product.proTranCode] }">${ tranCodeMap[product.proTranCode] }</span></p>
							        <p id="productPrice"><span>${ product.price }</span> 원</p>
							        <p>
							        	<button type="button" class="btn btn-primary btn-sm" 
							        		data-href="${ (product.proTranCode == '1')? 'getProduct?menu=search&' : 'getPurchase?'}" data-prodno="${ product.prodNo }">
							        		${ (product.proTranCode == "1")? "상품정보" : "구매정보" }
						        		</button>
						        		&ensp;
						        		<c:if test="${ product.proTranCode == '2' }">
							        		<button type="button" class="btn btn-primary btn-sm" 
							        			data-href="/purchase/updateTranCode?tranCode=3&prodNo=${ product.prodNo }" data-prodno="${ product.prodNo }">
								        		배송시작
							        		</button>
						        		</c:if>
						        		
						        		<c:if test="${ product.proTranCode == '3' }">
							        		<button type="button" class="btn btn-primary btn-sm" 
							        			data-href="/purchase/updateTranCode?tranCode=4&" data-prodno="${ product.prodNo }">
								        		배송완료
							        		</button>
						        		</c:if>
						        	</p>
						      	</div>
						    </div>
						    
					    </div>
				    
				    </c:forEach>
					</div>
					
					
					
				</div>
						
				<jsp:include page="../common/pagingNavigator_new.jsp">
						<jsp:param value="fncGetManageProductList" name="fnc"/>
						<jsp:param value="paging" name="paging"/>
				</jsp:include>

			</div>
			
			</form>
			
		</div>
		
	</body>

</html>