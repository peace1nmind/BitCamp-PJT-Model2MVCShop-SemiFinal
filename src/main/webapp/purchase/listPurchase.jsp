<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>

<html>

	<head>

		<meta charset="EUC-KR">
		<title>Model2MVCShop-listPurchase</title>
		
		<%@ include file="/common/import.jsp" %>
		
		<script type="text/javascript" src="/javascript/jsp/listPurchase.js"></script>
		
		<style type="text/css">
			.panel-body {font-weight: bold;}
			a#prodName {color: #000000;}
		</style>

	</head>

	<body>
		
		<jsp:include page="/layout/toolbar.jsp" />
		
		<div class="container">
		
			<form>
			
			<input type="hidden" name="page" value="${ search.page }">
			<input type="hidden" name="historyPage" value="${ historySearch.page }">
			
			<div class="row">
			
				<div class="col-sm-3" style="padding-top : 100px;">
					
					<!-- 상세 검색 -->
					<div class="form-group">
					
						<div class="panel panel-primary">
					
							<div class="panel-heading">
								상세 검색
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
								구매일
							</div>
							
							<div class="list-group">
								
								<li class="list-group-item">
									<div class="form-group">
										<input type="date" name="startDate" value="${ search.startDate }" class="form-control" >
										<div style="text-align: center;">
											<span>~</span>
										</div>
										<input type="date" name="endDate" value="${ search.endDate }" class="form-control" >
									</div>
								</li>
								
							</div>
							
							<div class="panel-body">
								상품 정렬
							</div>
							
							<div class="list-group">
								
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
						<h3>${ user.userName } 님의 구매목록</h3>
						<p class="text-primary">
			    			전체  ${ paging.total } 건수, 현재 ${ paging.currentPage}  페이지
			    		</p>
					</div>
					
					<div class="row" id="purchaseList">
					<!-- 구매이력 리스트 시작 -->
					<table class="table">
						<tr class="active">
							<th>No.</th>
							<th style="width: 200px;">상품명</th>
							<th>가격</th>
							<th>구매일자</th>
							<th>배송희망일</th>
							<th>배송현황</th>
							<th>정보수정</th>
						</tr>
						
						<c:forEach items="${map.list}" var="purchase" varStatus="status">
							<c:set var="product" value="${ purchase.purchaseProd }" />
							
							<tr>
								<th>${ status.count }</th>
								<td><a id="prodName" data-prodno="${ product.prodNo }">${ product.prodName }</a></td>
								<td id="productPrice"><span>${ product.price }</span> 원</td>
								<td>${ purchase.orderDate }</td>
								<td>${ purchase.dlvyDate }</td>
								<td>${ tranCodeMap[purchase.tranCode] }</td>
								<td>
										
									<%-- 정보수정 : 배송완료전이면 배송지 수정하게끔 **4=배송완료 --%>
									<c:if test="${ purchase.tranCode == 2 }">>
										<a class="updatePurchase" data-tranno="${ purchase.tranNo }">배송정보 수정</a>
									</c:if>
	
								</td>
							</tr>
					    </c:forEach>
					    
					    <%-- 페이징1 --%>
					    <tr>
					    	<td colspan="7">
					    		<jsp:include page="../common/pagingNavigator_new.jsp">
									<jsp:param value="fncGetPurchaseList" name="fnc"/>
									<jsp:param value="paging" name="paging"/>
								</jsp:include>
					    	</td>
					    </tr>
					    
			    	</table>
					</div>
					
					<div class="page-header text-info">
						<h3>구매완료 목록</h3>
						<p class="text-primary">
			    			전체  ${ historyPaging.total } 건수, 현재 ${ historyPaging.currentPage}  페이지
			    		</p>
					</div>
					
					<div class="row" id="purchaseHistoryList">
					<!-- 구매완료 이력 리스트 -->
					<table class="table">
						<%-- 리스트 설정 --%>
						<tr class="active">
							<th>No.</th>
							<th style="width: 200px;">상품명</th>
							<th>받는 사람</th>
							<th>구매일자</th>
							<th>배송희망일</th>
							<th>배송현황</th>
							<th>구매확정</th>
						</tr>
						
						<c:forEach items="${historyMap.list}" var="purchase" varStatus="status">
							<c:set var="product" value="${ purchase.purchaseProd }" />
							
							<tr>
								<th>${ status.count }</th>
								<td><a id="prodName" data-prodno="${ product.prodNo }">${ product.prodName }</a></td>
								<td>${ purchase.receiverName }</td>
								<td>${ purchase.orderDate }</td>
								<td>${ purchase.dlvyDate }</td>
								<td>${ tranCodeMap[purchase.tranCode] }</td>
								<td>
									<c:if test="${purchase.tranCode=='4' }">
										<a class="updateTranCode" data-tranno="${purchase.tranNo }" data-trancode="5">구매확정</a>
									</c:if>
								</td>
							</tr>
					    </c:forEach>
						
						<%-- 페이징2 --%>
					    <tr>
					    	<td colspan="7">
					    		<jsp:include page="../common/pagingNavigator_new.jsp">
									<jsp:param value="fncGetPurchaseHistoryList" name="fnc"/>
									<jsp:param value="historyPaging" name="paging"/>
								</jsp:include>
					    	</td>
					    </tr>
					    
					</table>
					</div>
					
				</div>
				
			</div>
			
			</form>
			
		</div>
		
	</body>

</html>