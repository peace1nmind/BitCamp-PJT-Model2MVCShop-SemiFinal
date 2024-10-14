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
		
		<%-- 三 토클 버튼 --%>
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
				 		<span>상품 구매</span>
				 		<span class="caret"></span>
				 	</a>
				 	
				 	<ul class="dropdown-menu">
				 		<li><a>상품 검색</a></li>
				 		<li><a>최근 본 상품</a></li>
				 		<c:if test="${user.role == 'user' }">
				 			<li class="divider"></li>
				 			<li><a>구매 이력 조회</a>
				 		</c:if>
				 	</ul>
				</li>
				
				<c:if test="${!empty user }">	
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
							<span>회원 관리</span>
							<span class="caret"></span>
						</a>
						
						<ul class="dropdown-menu">
							<li><a>개인정보 조회</a></li>
							<c:if test="${user.role == 'admin' }">
								<li><a>회원정보 조회</a></li>
							</c:if>
						</ul>
					</li>
					 
					<c:if test="${user.role == 'admin' }">
				 		<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
								<span>판매상품 관리</span>
								<span class="caret"></span>
							</a>
							
							<ul class="dropdown-menu">
								<li><a>판매상품 등록</a></li>
								<li><a>판매상품 관리</a></li>
							</ul>
						</li>
					</c:if>
				</c:if>
			</ul>
			
			
			<!-- toolbar 오른쪽 -->
			<ul class="nav navbar-nav navbar-right">
			
				<c:choose>
					<c:when test="${empty user }">
						<li><a>회원가입</a></li>
						<li><a>로그인</a></li>
					</c:when>
					
					<c:when test="${!empty user }">
						<li><a>로그아웃</a></li>
					</c:when>
				</c:choose>
				
			</ul>
		</div>
			
	</div>

</div>



