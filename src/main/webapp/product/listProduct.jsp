<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>

<html>

	<head>

		<meta charset="EUC-KR">
		<title>Model2MVCShop-listProduct</title>
		
		<%@ include file="/common/import.jsp" %>
		
		<script type="text/javascript" src="/javascript_b/listProduct.js"></script>
		
		<style type="text/css">
			.panel-body {font-weight: bold;}
		</style>

	</head>

	<body>
		
		<jsp:include page="/layout/toolbar.jsp" />
		
		<div class="container">
		
			<form>
			
			<input type="hidden" name="menu" value="${menu }">
			<input type="hidden" name="orderBy" value="${search.orderBy }">
			<input type="hidden" name="desc" value="${search.desc }">
			
			<div class="row">
			
				<div class="col-sm-3">
					
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
									~
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
										    <input type="radio" name="orderByPrice" value="asc">
										   	가격 오름차순
										  </label>
										  <label>
										    <input type="radio" name="orderByPrice" value="desc">
										   	가격 내림차순
										  </label>
										</div>
									</div>
									
								</li>
								
								<li class="list-group-item">
								
									<div class="form-group">
										<div class="radio">
										  <label>
										    <input type="radio" name="orderByProdName" value="asc">
										   	상품명 오름차순
										  </label>
										  <label>
										    <input type="radio" name="orderByProdName" value="desc">
										   	상품명 내림차순
										  </label>
										</div>
									</div>

								</li>
								
							</div>
							
							<button type="submit" class="btn btn-default btn-block">검색</button>
							
						</div>
						
					</div>
				
				</div>
				
				<div class="col-sm-9">
					
					<div class="page-header text-info">
						<h3>${ title }</h3>
						<p class="text-primary">
			    			전체  ${ paging.total } 건수, 현재 ${ paging.currentPage}  페이지
			    		</p>
					</div>
					
					
					<!-- 상품 리스트 시작 -->
					<c:forEach items="${map.list}" var="product" varStatus="status">
					
						<div class="col-sm-3">
						
							<div class="thumbnail">
						    	<img src="/images/uploadFiles/${ product.fileName }" alt="${ product.prodName }" width="172" height="180">
						    	<div class="caption">
							        <h4>${ product.prodName }</h4>
							        <p>${ product.prodDetail }</p>
							        <p><a href="#" class="btn btn-primary" role="button">Button</a></p>
						      	</div>
						    </div>
						    
					    </div>
				    
				    </c:forEach>

				</div>
				
			</div>
			
			</form>
			
		</div>
		
	</body>

</html>