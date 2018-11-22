<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/resources/init/init.jsp"/>
</head>
<body>

<!-- 컨테이너 시작 -->
<div class="container">
	<jsp:include page="/WEB-INF/resources/init/header.jsp"/>
	<jsp:include page="/WEB-INF/resources/init/login.jsp"/>

	<!-- 의약품 -->
	<div style="float: left; width: 100%;">
		<!-- 검색폼 -->
		<form class="form-inline" action="${pageContext.request.contextPath }/pill/list" method="GET" style="margin-bottom: 20px">
			<select class="form-control" name="type">
				<option selected>약품명</option>
				<option>효능/효과</option>
				<option>회사</option>
				<option>성분(영문/한글)</option>
			</select>
			
			<input class="form-control" type="text" name="keyword" placeholder="검색어 입력">
			<button class="btn btn-default" type="submit">검색</button>
		</form>
		<!-- 검색폼 끝 -->
		
		<c:if test="${empty p }">
			<span>데이터가 존재하지 않습니다.</span>
		</c:if>
		<c:if test="${!empty p }">
			<!-- 의약품 목록 시작 -->
			<div>
				<c:forEach var="l" items="${p.list }" varStatus="status">
					<c:if test="${status.count % 4 == 1}">
						<div class="row">
					</c:if>
					
					<!-- 반복되는 썸네일 -->
					<div class="col-md-3">
						<div class="thumbnail">
							<c:if test="${!empty l.imgPath }">
								<img src="${pageContext.request.contextPath }/resources/pill/img/${l.imgPath}" alt="${l.imgPath}" width="200" style="margin: 0">
							</c:if>
							<c:if test="${empty l.imgPath }">
								<img src="${pageContext.request.contextPath }/resources/init/img/1.png" alt="이미지없음" width="200" style="margin: 0">
							</c:if>
							<div class="caption">
								<div>
									<span class="h5">${l.name }</span>
								</div>
								<div>
							        <span>
								        <c:if test="${l.rating == -1}">
								        	<button class="btn btn-primary" type="button">
								        		Good&nbsp;<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
								        	</button> 
								        	<button class="btn btn-danger" type="button">
								        		Bad&nbsp;<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span>
								        	</button> 
								        </c:if>
								        <c:if test="${l.rating != -1}">
								        	<span>${l.rating } %</span>
								        </c:if>
							        </span>
								</div>
								<div>
									<span>제조사/유통사 : ${l.company_name }</span>
								</div>
								<div>효과 : 
									<button type="button" class="btn btn-default" data-toggle="popover" title="효능/효과" data-content="${l.effect_main }">
										<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
									</button>
								</div>
								<c:forEach var="lp" items="${l.p_ingredients }">
									<div>
										<span>${lp.eng } | ${lp.kor } | ${lp.content }</span>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- 반복되는 썸네일 끝 -->
					  
					<c:if test="${status.count % 4 == 0 || status.last}">
						</div>
					</c:if>
				</c:forEach>
			</div>	
			<!-- 의약품 목록 끝 -->
			
			<!-- 페이징 시작 -->
			<nav style="text-align: center;">
				<ul class="pagination pagination-sm">
					<c:if test="${p.page != 1 }">
						<c:if test="${empty p.type }">
							<li><a href="${pageContext.request.contextPath }/pill/list">처음</a></li>
						</c:if>
						<c:if test="${!empty p.type }">
							<li><a href="${pageContext.request.contextPath }/pill/list?type=${p.type}&keyword=${p.keyword}">처음</a></li>
						</c:if>
					</c:if>
					<c:if test="${p.page == 1 }">
						<li class="disabled"><a href="#">처음</a></li>
					</c:if>
					
					<c:if test="${p.startPage != 1 }">
						<c:if test="${empty p.type }">
							<li><a href="${pageContext.request.contextPath }/pill/list?page=${p.startPage - 1}">이전</a></li>
						</c:if>
						<c:if test="${!empty p.type }">
							<li><a href="${pageContext.request.contextPath }/pill/list?type=${p.type}&keyword=${p.keyword}&page=${p.startPage - 1}">이전</a></li>
						</c:if>
					</c:if>
					<c:if test="${p.startPage == 1 }">
						<li class="disabled"><a href="#">이전</a></li>
					</c:if>
					
					<c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
						<c:if test="${i == p.page }">
							<li class="active"><a href="#"><b>${i }</b></a></li>
						</c:if>
						<c:if test="${i != p.page }">
							<c:if test="${empty p.type }">
								<li><a href="${pageContext.request.contextPath }/pill/list?page=${i}">${i }</a></li>
							</c:if>
							<c:if test="${!empty p.type }">
								<li><a href="${pageContext.request.contextPath }/pill/list?type=${p.type}&keyword=${p.keyword}&page=${i}">${i }</a></li>
							</c:if>
						</c:if>
					</c:forEach>
					
					<c:if test="${p.endPage != p.totalPage }">
						<c:if test="${empty p.type }">
							<li><a href="${pageContext.request.contextPath }/pill/list?page=${p.endPage + 1}">다음</a></li>
						</c:if>
						<c:if test="${!empty p.type }">
							<li><a href="${pageContext.request.contextPath }/pill/list?type=${p.type}&keyword=${p.keyword}&page=${p.endPage + 1}">다음</a></li>
						</c:if>
					</c:if>
					<c:if test="${p.endPage == p.totalPage }">
						<li class="disabled"><a href="#">다음</a></li>
					</c:if>
					
					<c:if test="${p.page != p.totalPage }">
						<c:if test="${empty p.type }">
							<li><a href="${pageContext.request.contextPath }/pill/list?page=${p.totalPage}">끝</a></li>
						</c:if>
						<c:if test="${!empty p.type }">
							<li><a href="${pageContext.request.contextPath }/pill/list?type=${p.type}&keyword=${p.keyword}&page=${p.totalPage}">끝</a></li>
						</c:if>
					</c:if>
					<c:if test="${p.page == p.totalPage }">
						<li class="disabled"><a href="#">끝</a></li>
					</c:if>
				</ul>
			</nav>
			<!-- 페이징 끝 -->
		</c:if>
	</div>
	<!-- 의약품 끝 -->
</div>
<!-- 컨테이너 끝 -->



<!-- <script type="text/javascript">
	function search() {
		var type = $("select[name=type]");
		var target = $("input[name=target]");
		if(target.val() == '' || target.val() == null) {
			alert('검색어를 입력해주세요.');
			target.focus();
			return false;
		}
		location.href="${pageContext.request.contextPath}/pill/list/" + type + "?search=" + target;
	}
</script> -->
</body>
</html>