<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/javascript/paging.js"></script>

<c:set var="pagingName" value="${ param.paging }" />

<c:if test="${ pagingName == 'historyPaging' }">
	<c:set var="paging" value="${ historyPaging }"/>
</c:if>

<table id="${ pagingName }">

<tr>
<td>
<div class="container text-center">
		 
	 <nav>
	  <!-- ũ������ :  pagination-lg pagination-sm-->
	  <ul class="pagination">
	    
	    <!--  <<== ���� nav -->  
	    <li ${(paging.left)? "":"style='visibility:hidden'"}>
	    	<a id="firstPage">
	    		��
	    	</a>
	    </li>
	    
	    <li ${(paging.left)? "":"style='visibility:hidden'" }>
	    	<a id="prevPage" data-page="${ paging.start - 1 }">
	    		����
	    	</a>
	    </li>
	    
	    <!--  �߾�  -->
		<c:forEach var="i" begin="${ paging.start }" end="${ paging.end }" varStatus="status" >
			
			<c:if test="${ paging.currentPage == i }">
				<!--  ���� page ����ų��� : active -->
			    <li class="active">
			    	<a id="goPage" data-page="${ i }">
			    		${ i }
			    	</a>
			    </li>
			</c:if>	
			
			<c:if test="${ paging.currentPage != i}">	
				<li>
					<a id="goPage" data-page="${ i }">
						${ i }
					</a>
				</li>
			</c:if>
			
		</c:forEach>
	    
	    <!--  ���� nav==>> -->
	    <li ${(paging.right)? "":"style='visibility:hidden'" }>
	    	<a id="nextPage" data-page="${ paging.end + 1 }">
	    		����
	    	</a>
	    </li>
	    
	    <li ${(paging.right)? "":"style='visibility:hidden'"}>
	    	<a id="lastPage" data-page=${ paging.totalPage }>
	    		��
	    	</a>
	    </li>
	    
	  </ul>
	</nav>
		
</div>
</td>
</tr>
</table>