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
			.prodName {width: 15%;}
			.no {width: 2%;}
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
								������
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
								��ǰ ����
							</div>
							
							<div class="list-group">
								
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
						<h3>${ user.userName } ���� ���Ÿ��</h3>
						<p class="text-primary">
			    			��ü  ${ paging.total } �Ǽ�, ���� ${ paging.currentPage}  ������
			    		</p>
					</div>
					
					<div class="row" id="purchaseList">
					<!-- �����̷� ����Ʈ ���� -->
					<table class="table">
						<tr class="active">
							<th class="no">No.</th>
							<th class="prodName">��ǰ��</th>
							<th>����</th>
							<th>��������</th>
							<th>��������</th>
							<th>�����Ȳ</th>
							<th>&nbsp;</th>
						</tr>
						
						<c:forEach items="${map.list}" var="purchase" varStatus="status">
							<c:set var="product" value="${ purchase.purchaseProd }" />
							
							<tr>
								<th>${ status.count }</th>
								<td><a id="prodName" data-prodno="${ product.prodNo }">${ product.prodName }</a></td>
								<td id="productPrice"><span>${ product.price }</span> ��</td>
								<td>${ purchase.orderDate }</td>
								<td>${ purchase.dlvyDate }</td>
								<td>${ tranCodeMap[purchase.tranCode] }</td>
								<td>
										
									<%-- �������� : ��ۿϷ����̸� ����� �����ϰԲ� **4=��ۿϷ� --%>
									
									<a class="getPurchase" data-tranno="${ purchase.tranNo }">������� Ȯ��</a>
									
	
								</td>
							</tr>
					    </c:forEach>
					    
					    <%-- ����¡1 --%>
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
						<h3>���ſϷ� ���</h3>
						<p class="text-primary">
			    			��ü  ${ historyPaging.total } �Ǽ�, ���� ${ historyPaging.currentPage}  ������
			    		</p>
					</div>
					
					<div class="row" id="purchaseHistoryList">
					<!-- ���ſϷ� �̷� ����Ʈ -->
					<table class="table">
						<%-- ����Ʈ ���� --%>
						<tr class="active">
							<th class="no">No.</th>
							<th class="prodName">��ǰ��</th>
							<th>����</th>
							<th>�޴� ���</th>
							<th>��������</th>
							<th>��������</th>
							<th>�����Ȳ</th>
						</tr>
						
						<c:forEach items="${historyMap.list}" var="purchase" varStatus="status">
							<c:set var="product" value="${ purchase.purchaseProd }" />
							
							<tr>
								<th>${ status.count }</th>
								<td><a id="prodName" data-tranno="${ purchase.tranNo }">${ product.prodName }</a></td>
								<td id="productPrice"><span>${ product.price }</span> ��</td>
								<td>${ purchase.receiverName }</td>
								<td>${ purchase.orderDate }</td>
								<td>${ purchase.dlvyDate }</td>
								<td>
									<c:choose>
										<c:when test="${purchase.tranCode=='4' }">
											<a class="updateTranCode" data-tranno="${purchase.tranNo }" data-trancode="5">����Ȯ��</a>
										</c:when>
										
										<c:otherwise>
											${ tranCodeMap[purchase.tranCode] }
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
					    </c:forEach>
						
						<%-- ����¡2 --%>
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