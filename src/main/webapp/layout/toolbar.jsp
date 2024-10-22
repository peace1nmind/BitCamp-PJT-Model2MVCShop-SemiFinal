<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/common/import.jsp" %>

<script type="text/javascript">
	var userId = ${(user == null)? null : JSON.stringify(user)};
</script>

<script type="text/javascript" src="/javascript/jsp/toolbar.js"></script>

    
<div class="navbar navbar-default navbar-fixed-top">

	<div class="container">
		
		<%-- Home --%>
		<a class="navbar-brand">Model2 MVC Shop</a>
		
		<%-- ߲ ��Ŭ ��ư --%>
		<div class="navbar-header">
			
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		    	<span class="sr-only">Toggle navigation</span>
		    	<span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
			</button>
			
		</div>
		
		<!-- toolbar Navigation -->
		
		<div class="collapse navbar-collapse" id="target" 
			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
			
			<ul class="nav navbar-nav">
			
				<li class="dropdown">
				 	<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
				 		<span>��ǰ ����</span>
				 		<span class="caret"></span>
				 	</a>
				 	
				 	<ul class="dropdown-menu">
				 		<li><a>��ǰ �˻�</a></li>
				 		<li><a>�ֱ� �� ��ǰ</a></li>
				 		<c:if test="${user.role == 'user' }">
				 			<li class="divider"></li>
				 			<li><a>���� �̷� ��ȸ</a>
				 		</c:if>
				 	</ul>
				</li>
				
				<c:if test="${!empty user }">	
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
							<span>ȸ�� ����</span>
							<span class="caret"></span>
						</a>
						
						<ul class="dropdown-menu">
							<li><a>�������� ��ȸ</a></li>
							<c:if test="${user.role == 'admin' }">
								<li><a>ȸ������ ��ȸ</a></li>
							</c:if>
						</ul>
					</li>
					 
					<c:if test="${user.role == 'admin' }">
				 		<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
								<span>�ǸŻ�ǰ ����</span>
								<span class="caret"></span>
							</a>
							
							<ul class="dropdown-menu">
								<li><a>�ǸŻ�ǰ ���</a></li>
								<li><a>�ǸŻ�ǰ ����</a></li>
							</ul>
						</li>
					</c:if>
				</c:if>
			</ul>
			
			
			<!-- toolbar ������ -->
			<ul class="nav navbar-nav navbar-right">
			
				<c:choose>
					<c:when test="${empty user }">
						<li><a>ȸ������</a></li>
						<li><a>�α���</a></li>
					</c:when>
					
					<c:when test="${!empty user }">
						<li><a>�α׾ƿ�</a></li>
					</c:when>
				</c:choose>
				
			</ul>
		</div>
			
	</div>

</div>



