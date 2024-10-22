<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>

<html>

	<head>

		<meta charset="EUC-KR">
		<title>Model2MVCShop-listProduct</title>
		
		<%@ include file="/common/import.jsp" %>
		
		<script type="text/javascript" src="/javascript/jsp/listProduct.js"></script>
		
		<style type="text/css">
			.panel-body {font-weight: bold;}
		</style>

	</head>

	<body>
		
		<jsp:include page="/layout/toolbar.jsp" />
		
		<div class="container">
		
			<form>
			
			<input type="hidden" name="page" value="${ search.page }">
			
			<div class="row">
			
				<div class="col-sm-3" style="padding-top : 100px;">
					
					<!-- �� �˻� -->
					<div class="form-group">
					
						<div class="panel panel-primary">
					
							<div class="panel-heading">
								�� �˻�
							</div>
							
							<div class="panel-body">
								��ǰ ���� �˻�
							</div>
							
							<div class="list-group">
							
								<li class="list-group-item">
								
									<select class="form-control" name="searchCondition">
										<option value="0" ${(!empty search.searchCondition && search.searchCondition=='0')? "selected":""}>
											��ǰ��ȣ
										</option>
										<option value="1" ${(!empty search.searchCondition && search.searchCondition=='1')? "selected":""}>
											��ǰ��
										</option>
										<option value="2" ${(!empty search.searchCondition && search.searchCondition=='2')? "selected":""}>
											��ǰ����
										</option>
									</select>
									
									<input type="text" class="form-control" name="searchKeyword" placeholder="�˻�� �Է����ּ���" value="${search.searchKeyword}">
								</li>
								
							</div>
							
							<div class="panel-body">
								��ǰ ���� �˻�
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
								��ǰ ����
							</div>
							
							<div class="list-group">
								
								<%-- Search.java Field ���� �ʿ� --%>
								<li class="list-group-item">
									<div class="form-group">
										<div class="radio">
										  <label>
										    <input type="radio" name="orderByPrice" value="price asc" 
										    	${ (search.orderByPrice == "price asc") ? "checked" : "" }>
										   	���� ��������
										  </label>
										  <br/>
										  <label>
										    <input type="radio" name="orderByPrice" value="price desc" 
										    	${ (search.orderByPrice == "price desc") ? "checked" : "" }>
										   	���� ��������
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
										   	��ǰ�� ��������
										  </label>
										  <br/>
										  <label>
										    <input type="radio" name="orderByProdName" value="prod_name desc" 
										    	${ (search.orderByProdName == "prod_name desc") ? "checked" : "" }>
										   	��ǰ�� ��������
										  </label>
										</div>
									</div>

								</li>
								
							</div>
							<button type="button" class="btn btn-default btn-block" id="reset">����</button>
							<button type="button" class="btn btn-default btn-block" id="search">�˻�</button>
							
						</div>
						
					</div>
				
				</div>
				
				<div class="col-sm-9">
					
					<div class="page-header text-info">
						<h3>${ title }</h3>
						<p class="text-primary">
			    			��ü  ${ paging.total } �Ǽ�, ���� ${ paging.currentPage}  ������
			    		</p>
					</div>
					
					<div class="row" id="productList">
					<!-- ��ǰ ����Ʈ ���� -->
					<c:forEach items="${map.list}" var="product" varStatus="status">
					
						<div class="col-sm-3">
						
							<div class="thumbnail">
						    	<img src="/images/uploadFiles/${ product.fileName }" style="width: 172px; height: 180px;">
						    	<div class="caption">
							        <h4>${ product.prodName }</h4>
							        <p><span id="productPrice">${ product.price }</span> ��</p>
							        <p>
							        	<button type="button" class="btn btn-primary btn-sm" 
							        		data-href="getProduct?menu=search&" data-prodno="${ product.prodNo }">
							        		��ǰ����
						        		</button>
						        		&ensp;
						        		<button type="button" class="btn btn-primary btn-sm" 
						        			data-href="addPurchase?" data-prodno="${ product.prodNo }" 
						        			${ (user.role == 'user' && product.proTranCode == '1')? "" : "disabled" }>
							        		&ensp;&ensp;����&ensp;&ensp;
						        		</button>
									</p>
						      	</div>
						    </div>
						    
					    </div>
				    
				    </c:forEach>
					</div>
				</div>
				
			</div>
			
<%-- 			<%@ include file="../common/pagingNavigator_new.jsp" %> --%>
			<jsp:include page="../common/pagingNavigator_new.jsp">
				<jsp:param value="fncGetProductList" name="fnc"/>
			</jsp:include>
			
			</form>
			
		</div>
		
	</body>

</html>