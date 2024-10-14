<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<div class="container text-center" id="paging">
		 
	 <nav>
	  <!-- 크기조절 :  pagination-lg pagination-sm-->
	  <ul class="pagination" >
	    
	    <!--  <<== 좌측 nav -->  
	    <li ${(paging.left)? "":"style='visibility:hidden'"}>
	    	<a id="firstPage">
	    		<span>◀</span>
	    	</a>
	    </li>
	    
	    <li ${(paging.left)? "":"style='visibility:hidden'" }>
	    	<a id="prevPage" data-page="${ paging.start - 1 }">
	    		<span>이전</span>
	    	</a>
	    </li>
	    
	    <!--  중앙  -->
		<c:forEach var="i" begin="${ paging.start }" end="${ paging.end }" varStatus="status">
			
			<c:if test="${ paging.currentPage == i }">
				<!--  현재 page 가르킬경우 : active -->
			    <li class="active">
			    	<a id="goPage" data-page="${ i }">${ i }
			    		<span class="sr-only">(current)</span>
			    	</a>
			    </li>
			</c:if>	
			
			<c:if test="${ paging.currentPage != i}">	
				<li>
					<a id="goPage" data-page="${ i }">
						<span>${ i }</span>
					</a>
				</li>
			</c:if>
			
		</c:forEach>
	    
	    <!--  우측 nav==>> -->
	    <li ${(paging.right)? "":"style='visibility:hidden'" }>
	    	<a id="nextPage" data-page="${ paging.end + 1 }">
	    		<span>다음</span>
	    	</a>
	    </li>
	    
	    <li ${(paging.right)? "":"style='visibility:hidden'"}>
	    	<a id="lastPage" data-page=${ paging.totalPage }>
	    		<span>▶</span>
	    	</a>
	    </li>
	    
	  </ul>
	</nav>
		
</div>