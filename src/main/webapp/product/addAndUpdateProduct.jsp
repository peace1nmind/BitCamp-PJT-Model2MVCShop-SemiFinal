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
	       		<h3 class=" text-info">${ (fnc == 'add')? "��ǰ���" : "��ǰ����" }</h3>
	    	</div>
	    	
	    	<c:if test="${ fnc == 'update' }">
		    	<div class="row">
			  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
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
			  			<label for="prodName">��ǰ��</label>
			  		</div>
					<div class="col-xs-8 col-md-4">
						<input type="text" name="prodName" class="form-control" value="${ product.prodName }" id="prodName" placeholder="��ǰ���� �Է����ּ���." >
					</div>
				</div>
			</div>
			
			<hr/>
			
			<div class="form-group">
			<div class="row">
		  		<div class="col-xs-4 col-md-2 ">
		  			<label for="file">��ǰ�̹���</label>
		  		</div>
				<div class="col-xs-8 col-md-4">
					<c:if test="${fnc == 'update' && !empty product.fileName }">
						<p class="help-block">���� �̹���</p>					
						<img src = "/images/uploadFiles/${product.fileName }" width="300" height="300"/>
						<p>&nbsp;</p>
					</c:if>
					
					<input type="file" name="file" id="file" accept="image/*">
					<p class="help-block">�̹��� ������ �÷��ּ���</p>
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
		  			<label for="prodDetail">��ǰ������</label>
		  		</div>
				<div class="col-xs-8 col-md-4">
					<textarea name="prodDetail" class="form-control" id="prodDetail" rows="3" placeholder="��ǰ �������� �Է����ּ���." style="resize: none;">${ product.prodDetail }</textarea>
					<span class="help-block">* �ִ� 200��</span>
				</div>
			</div>
			</div>
			
			<hr/>
			
			<div class="form-group">
			<div class="row">
		  		<div class="col-xs-4 col-md-2">
		  			<label for="manuDate">��������</label>
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
		  			<label for="price">����</label>
		  		</div>
				<div class="col-xs-8 col-md-4">
					<div class="input-group">
						<input type="text" name="price" value="${ product.price }" id="price" class="form-control" placeholder="��ǰ ������ �Է����ּ���.">
						<span class="input-group-addon">��</span>
					</div>
				</div>
			</div>
			</div>
			
			<hr/>
			
			<c:if test="${ fnc == 'update' }">
				
				<div class="row">
			  		<div class="col-xs-4 col-md-2 "><strong>�������</strong></div>
					<div class="col-xs-8 col-md-4">${ product.regDate}</div>
				</div>
				
				<hr/>
			</c:if>
			
			<div class="row">
		  		<div class="col-md-12 text-right ">
		  			
		  			<button type="button" class="btn btn-primary">�ʱ�ȭ</button>
	  				<button type="button" class="btn btn-primary">${ (fnc == 'add')? "���" : "����" }</button>
	  				<button type="button" class="btn btn-primary">����</button>

		  		</div>
			</div>
			
			<hr/>
			
		</form>
		
		</div>
	
	</body>

</html>