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
					
					<!-- �� �˻� -->
					<div class="form-group">
					
						<div class="panel panel-primary">
					
							<div class="panel-heading">
								�� �˻�
							</div>
							
							<div class="panel-body">
								��ǰ ���� üũ
							</div>
							
							<div class="list-group">
							
								<li class="list-group-item">
									<div>
										<label>
											<input type="checkbox" name="tranCode" value="1" ${ search.tranCode.contains("1")? "checked" : "" } >&ensp;<span>�Ǹ���</span>
										</label>
									</div>
										<label>
											<input type="checkbox" name="tranCode" value="2" ${ search.tranCode.contains("2")? "checked" : "" }>&ensp;<span>���ſϷ�</span>
										</label>
									<div>
										<label>
											<input type="checkbox" name="tranCode" value="3" ${ search.tranCode.contains("3")? "checked" : "" }>&ensp;<span>�����</span>
										</label>
									</div>
										<label>
											<input type="checkbox" name="tranCode" value="4" ${ search.tranCode.contains("4")? "checked" : "" }>&ensp;<span>��ۿϷ�</span>
										</label>
									<div>
									<label>
										<input type="checkbox" name="tranCode" value="5" ${ search.tranCode.contains("5")? "checked" : "" }>&ensp;<span>�ǸſϷ�</span></div>
									</label>
								</li>
							
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
						<h3>�Ǹ� ��ǰ ����</h3>
						<p class="text-primary">
			    			��ü  ${ paging.total } �Ǽ�, ���� ${ paging.currentPage}  ������
			    		</p>
					</div>
					
					<div class="row" id="productList">
					<!-- ��ǰ ����Ʈ ���� -->
					<c:forEach items="${map.list}" var="product" varStatus="status">
					
						<div class="col-sm-3">
						
							<div class="thumbnail">
						    	<img class="img-rounded" src="/images/uploadFiles/${ product.fileName }" style="width: 172px; height: 180px;">
						    	<div class="caption">
							        <h4>${ product.prodName }</h4>
							        <p><span class="label label-${colorMap[product.proTranCode] }">${ tranCodeMap[product.proTranCode] }</span></p>
							        <p id="productPrice"><span>${ product.price }</span> ��</p>
							        <p>
							        	<button type="button" class="btn btn-primary btn-sm" 
							        		data-href="${ (product.proTranCode == '1')? 'getProduct?menu=search&' : 'getPurchase?'}" data-prodno="${ product.prodNo }">
							        		${ (product.proTranCode == "1")? "��ǰ����" : "��������" }
						        		</button>
						        		&ensp;
						        		<c:if test="${ product.proTranCode == '2' }">
							        		<button type="button" class="btn btn-primary btn-sm" 
							        			data-href="/purchase/updateTranCode?tranCode=3&prodNo=${ product.prodNo }" data-prodno="${ product.prodNo }">
								        		��۽���
							        		</button>
						        		</c:if>
						        		
						        		<c:if test="${ product.proTranCode == '3' }">
							        		<button type="button" class="btn btn-primary btn-sm" 
							        			data-href="/purchase/updateTranCode?tranCode=4&" data-prodno="${ product.prodNo }">
								        		��ۿϷ�
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