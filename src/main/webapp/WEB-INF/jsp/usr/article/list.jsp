<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- <style>
	.tb {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	background-color: rgb(211, 232, 240);
	width: 400px;
}
</style> -->

<section class="mt-3 text-xl px-4">
	<input type="hidden" name="id" value="${article.id }" />
	<div class="mx-auto overflow-x-auto">
		<div class="badge badge-outline">${articlesCount }개</div>
		<div class="mt-3 mb-3">
		<form action="">
			<input type="hidden" name="boardId" value="${param.boardId }" />
			<select class = "text-base" name = "searchKeywordTypeCode">
		<%-- 	<select data-value="${param.searchKeywordTypeCode }" class="select select-bordered select-sm w-full max-w-xs"
					name="searchKeywordTypeCode"> --%>
				<option value = "title" ${searchKeywordTypeCode.equals("title") ? 'selected="selected"' : '' }>제목</option>
				<option value = "body"${searchKeywordTypeCode.equals("body") ? 'selected="selected"' : '' }>내용</option>
				<option value = "extra__writer"${searchKeywordTypeCode.equals("extra__writer") ? 'selected="selected"' : '' }>작성자</option>
			</select>
			<input value = "${param.searchKeyword }" type="text" placeholder="검색어를 입력하세요" class="input input-bordered w-full max-w-xs" name="searchKeyword"/>
			<button class="btn btn-outline" type="submit" >검색</button>
		</div>
		
		<table class="table-box-1 table" border="1">
			<colgroup>
				<col style="width: 10%" />
				<col style="width: 20%" />
				<col style="width: 60%" />
				<col style="width: 10%" />
			</colgroup>
		
			<thead>
				<tr>
					<th>번호</th>
					<th>날짜</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회</th>
					<th>좋아요</th>
				</tr>
			</thead>
			<tbody>
				
				<c:if test="${articles.size() == 0 }">
					<tr>
						<td colspan="6">게시글 없어</td>
					</tr>
				</c:if>
			
				<c:forEach var="article" items="${articles }">
					<tr class="hover">
						<td>${article.id }</td>
						<td>${article.regDate.substring(0,10) }</td>
						<td><a href="detail?id=${article.id }">${article.title }</a></td>
						<td>${article.extra__writer }</td>
						<td>${article.hit }</td>
						<td>${article.good }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
		<div class="pagination flex justify-center mt-3">
		<c:set var="paginationLen" value="3" />
		<c:set var="startPage" value="${page -  paginationLen  >= 1 ? page - paginationLen : 1}" />
		<c:set var="endPage" value="${page +  paginationLen  <= pagesCount ? page + paginationLen : pagesCount}" />

		<c:set var="baseUri" value="?boardId=${boardId }" />
		<c:set var="baseUri" value="${baseUri }&searchKeywordTypeCode=${searchKeywordTypeCode}" />
		<c:set var="baseUri" value="${baseUri }&searchKeyword=${searchKeyword}" />
		
		<c:if test="${startPage > 1 }">
			<a class="btn btn-sm" href="${baseUri }&page=1">1</a>
			<button class="btn btn-sm btn-disabled">...</button>
		</c:if>

		<c:forEach begin="${startPage }" end="${endPage }" var="i">
			<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }" href="${baseUri }&page=${i }">${i }</a>
		</c:forEach>

		<c:if test="${endPage < pagesCount }">
			<button class="btn btn-sm btn-disabled">...</button>
			<a class="btn btn-sm" href="${baseUri }&page=${pagesCount }">${pagesCount }</a>
		</c:if>

	</div>

	</form>
</section>



<%@ include file="../common/foot.jspf"%>