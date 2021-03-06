<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/resources/init/init.jsp"/>
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet">
</head>
<body>


<!-- 컨테이너 시작 -->
<div class="container">
	<jsp:include page="/WEB-INF/resources/init/header.jsp"/>
	<!-- 본문 시작 -->
	<div style="width: 100%">
		
	
		<!-- article 시작 -->
		<article>
	
			<!-- 의약품 검색 시작-->
			<div>
				<form class="form-inline" action="${pageContext.request.contextPath }/pill/list" method="GET" style="margin-bottom: 20px">
					<select class="form-control" name="option">
						<option selected>약품명</option>
						<option>효능/효과</option>
						<option>회사</option>
						<option>성분(영문/한글)</option>
					</select>
					
					<input class="form-control" type="text" name="keyword" placeholder="검색어 입력">
					<button class="btn btn-default" type="submit">검색</button>
				</form>
			</div>
			<!-- 의약품 검색 끝-->
			
			<%-- 
			<!-- 랭킹 테스트 중 -->
			<div class="_main_ranking">
				<div>
					<ul class="_main_ranking_effects">
						<li onclick="alert('hi');">두통</li>
						<li>해열</li>
						<li>소화</li>
						<li>비타민</li>
					</ul>
				</div>
				
				<div class="_main_ranking_contents">
					<div class="_main_ranking_content">
						<div class="_main_ranking_rank">
							
						</div>
						<img class="_main_ranking_content_img" src="${pageContext.request.contextPath }/resources/img/1.png" alt="test" >
						<h4 class="_main_ranking_content_name">약이름 </h4>
						<div class="_main_ranking_content_rating">
							<img src="${pageContext.request.contextPath }/resources/img/pill/rating/none.png" alt="rating_state">
							<p>66%</p>
						</div>
					</div>
					
					<div class="_main_ranking_content">
						<div class="_main_ranking_rank">
							
						</div>
						<img class="_main_ranking_content_img" src="${pageContext.request.contextPath }/resources/img/1.png" alt="test" >
						<h4 class="_main_ranking_content_name">약이름 </h4>
						<div class="_main_ranking_content_rating">
							<img src="${pageContext.request.contextPath }/resources/img/pill/rating/none.png" alt="rating_state">
							<p>66%</p>
						</div>
					</div>
					<div class="_main_ranking_content">
						<div class="_main_ranking_rank">
							
						</div>
						<img class="_main_ranking_content_img" src="${pageContext.request.contextPath }/resources/img/1.png" alt="test" >
						<h4 class="_main_ranking_content_name">약이름 </h4>
						<div class="_main_ranking_content_rating">
							<img src="${pageContext.request.contextPath }/resources/img/pill/rating/none.png" alt="rating_state">
							<p>66%</p>
						</div>
					</div>
					<div class="_main_ranking_content">
						<div class="_main_ranking_rank">
							
						</div>
						<img class="_main_ranking_content_img" src="${pageContext.request.contextPath }/resources/img/1.png" alt="test" >
						<h4 class="_main_ranking_content_name">약이름 </h4>
						<div class="_main_ranking_content_rating">
							<img src="${pageContext.request.contextPath }/resources/img/pill/rating/none.png" alt="rating_state">
							<p>66%</p>
						</div>
					</div>
					
				</div>
			</div>
			
			<script type="text/javascript">
				const ul = document.querySelector("._main_ranking_effects");
				const lis = ul.querySelectorAll("li");
				
				lis.forEach(function(li) {
					li.addEventListener("click", function() {
						const value = li.textContent
						alert(value);
					})
				})
				
				
			
			</script>
			 --%>
			
			
			
			
			<!-- original -->
			<!-- 약 효과 랭킹 -->
			<div class="_main_ranking">
				<div>
					<ul class="nav nav-tabs">
						<li class="active"><a href="#두통" data-toggle="tab">두통</a></li>
						<li><a href="#해열" data-toggle="tab">해열</a></li>
						<li><a href="#소화" data-toggle="tab">소화</a></li>
						<li><a href="#비타민" data-toggle="tab">비타민</a></li>
					</ul>
				</div>
				
				<!-- 썸네일 틀 시작 -->      
				<div class="tab-content" style="margin-top: 10px">
					<div class="tab-pane fade active in" id="두통">
						<c:forEach var="l" items="${rank['두통'] }">
							<!-- 반복되는 썸네일 -->
<div class="col-md-3">
	<div class="thumbnail">
		<a href="${pageContext.request.contextPath }/pill/view/${l.p_idx}?page=1">
			<c:if test="${!empty l.imgPath }">
					<img src="${pageContext.request.contextPath }/resources/img/pill/img/${l.imgPath}" alt="${l.imgPath}" width="200px">
			</c:if>
			<c:if test="${empty l.imgPath }">
					<img src="${pageContext.request.contextPath }/resources/init/img/1.png" alt="이미지없음" width="200px">
			</c:if>
		</a>
		<div class="caption">
			<div class="_main_pill_name">
				<a href="${pageContext.request.contextPath }/pill/view/${l.p_idx}?page=1">
					${l.name }
				</a>
			</div>
			<!-- rating -->
			<div id="rating" class="_main_pill_ratings">
		        <c:if test="${l.rating >= 50}">
		        	<img alt="" src="${pageContext.request.contextPath }/resources/img/pill/rating/good.png" width="40"><span>${l.rating } %</span>
	        	</c:if>
		        <c:if test="${l.total != 0 && l.rating < 50 && l.rating != -1}">
		        	<img alt="" src="${pageContext.request.contextPath }/resources/img/pill/rating/bad.png" width="40"><span>${l.rating } %</span>
	        	</c:if>
	        	<c:if test="${l.total == 0 || l.rating == -1}">
		        	<img alt="" src="${pageContext.request.contextPath }/resources/img/pill/rating/none.png" width="40"><span>평가없음</span>
	        	</c:if>
			</div>
			<!-- rating 끝 -->
		</div>
	</div>
</div>
<!-- 반복되는 썸네일 끝 -->
						</c:forEach>
						
					</div>
					  
					<div class="tab-pane fade" id="해열">
						<c:forEach var="l" items="${rank['해열'] }">
							<!-- 반복되는 썸네일 -->
<div class="col-md-3">
	<div class="thumbnail">
		<a href="${pageContext.request.contextPath }/pill/view/${l.p_idx}?page=1">
			<c:if test="${!empty l.imgPath }">
					<img src="${pageContext.request.contextPath }/resources/img/pill/img/${l.imgPath}" alt="${l.imgPath}" width="200px">
			</c:if>
			<c:if test="${empty l.imgPath }">
					<img src="${pageContext.request.contextPath }/resources/init/img/1.png" alt="이미지없음" width="200px">
			</c:if>
		</a>
		<div class="caption">
			<div class="_main_pill_name">
				<a href="${pageContext.request.contextPath }/pill/view/${l.p_idx}?page=1">
					${l.name }
				</a>
			</div>
			<!-- rating -->
			<div id="rating" class="_main_pill_ratings">
		        <c:if test="${l.rating >= 50}">
		        	<img alt="" src="${pageContext.request.contextPath }/resources/img/pill/rating/good.png" width="40"><span>${l.rating } %</span>
	        	</c:if>
		        <c:if test="${l.total != 0 && l.rating < 50 && l.rating != -1}">
		        	<img alt="" src="${pageContext.request.contextPath }/resources/img/pill/rating/bad.png" width="40"><span>${l.rating } %</span>
	        	</c:if>
	        	<c:if test="${l.total == 0 || l.rating == -1}">
		        	<img alt="" src="${pageContext.request.contextPath }/resources/img/pill/rating/none.png" width="40"><span>평가없음</span>
	        	</c:if>
			</div>
			<!-- rating 끝 -->
		</div>
	</div>
</div>
<!-- 반복되는 썸네일 끝 -->
						</c:forEach>
					</div>
					
					<div class="tab-pane fade" id="소화">
						<c:forEach var="l" items="${rank['소화'] }">
							<!-- 반복되는 썸네일 -->
<div class="col-md-3">
	<div class="thumbnail">
		<a href="${pageContext.request.contextPath }/pill/view/${l.p_idx}?page=1">
			<c:if test="${!empty l.imgPath }">
					<img src="${pageContext.request.contextPath }/resources/img/pill/img/${l.imgPath}" alt="${l.imgPath}" width="200px">
			</c:if>
			<c:if test="${empty l.imgPath }">
					<img src="${pageContext.request.contextPath }/resources/init/img/1.png" alt="이미지없음" width="200px">
			</c:if>
		</a>
		<div class="caption">
			<div class="_main_pill_name">
				<a href="${pageContext.request.contextPath }/pill/view/${l.p_idx}?page=1">
					${l.name }
				</a>
			</div>
			<!-- rating -->
			<div id="rating" class="_main_pill_ratings">
		        <c:if test="${l.rating >= 50}">
		        	<img alt="" src="${pageContext.request.contextPath }/resources/img/pill/rating/good.png" width="40"><span>${l.rating } %</span>
	        	</c:if>
		        <c:if test="${l.total != 0 && l.rating < 50 && l.rating != -1}">
		        	<img alt="" src="${pageContext.request.contextPath }/resources/img/pill/rating/bad.png" width="40"><span>${l.rating } %</span>
	        	</c:if>
	        	<c:if test="${l.total == 0 || l.rating == -1}">
		        	<img alt="" src="${pageContext.request.contextPath }/resources/img/pill/rating/none.png" width="40"><span>평가없음</span>
	        	</c:if>
			</div>
			<!-- rating 끝 -->
		</div>
	</div>
</div>
<!-- 반복되는 썸네일 끝 -->
						</c:forEach>
					</div>
					
					<div class="tab-pane fade" id="비타민">
						<c:forEach var="l" items="${rank['비타민'] }">
							<!-- 반복되는 썸네일 -->
<div class="col-md-3">
	<div class="thumbnail">
		<a href="${pageContext.request.contextPath }/pill/view/${l.p_idx}?page=1">
			<c:if test="${!empty l.imgPath }">
					<img src="${pageContext.request.contextPath }/resources/img/pill/img/${l.imgPath}" alt="${l.imgPath}" width="200px">
			</c:if>
			<c:if test="${empty l.imgPath }">
					<img src="${pageContext.request.contextPath }/resources/init/img/1.png" alt="이미지없음" width="200px">
			</c:if>
		</a>
		<div class="caption">
			<div class="_main_pill_name">
				<a href="${pageContext.request.contextPath }/pill/view/${l.p_idx}?page=1">
					${l.name }
				</a>
			</div>
			<!-- rating -->
			<div id="rating" class="_main_pill_ratings">
		        <c:if test="${l.rating >= 50}">
		        	<img alt="" src="${pageContext.request.contextPath }/resources/img/pill/rating/good.png" width="40"><span>${l.rating } %</span>
	        	</c:if>
		        <c:if test="${l.total != 0 && l.rating < 50 && l.rating != -1}">
		        	<img alt="" src="${pageContext.request.contextPath }/resources/img/pill/rating/bad.png" width="40"><span>${l.rating } %</span>
	        	</c:if>
	        	<c:if test="${l.total == 0 || l.rating == -1}">
		        	<img alt="" src="${pageContext.request.contextPath }/resources/img/pill/rating/none.png" width="40"><span>평가없음</span>
	        	</c:if>
			</div>
			<!-- rating 끝 -->
		</div>
	</div>
</div>
<!-- 반복되는 썸네일 끝 -->
						</c:forEach>
					</div>
					
				
				</div>
				<!-- 썸네일 틀 끝 -->
			</div>
			<!-- 약 효과 랭킹 끝-->
	 
	 
	 
	 
	 
	 
			<!-- 게시판 미리보기 -->
			<div>
				<!-- 공지사항 시작-->
				<div style="width: 32%; float: left; margin-right: 1.5%">
					<a href="${pageContext.request.contextPath}/board/notice"><h4>공지사항</h4></a>
					<table class="table table-hover table-condensed" style="table-layout:fixed; word-break:break-all;">
						<thead>
							<tr>
								<th width="35px" style="background-color: black; color: white; text-align: center;">번호</th>
								<th width="150px" style="background-color: black; color: white; text-align: center;">제목</th>
								<th width="50px" style="background-color: black; color: white; text-align: center;">날짜</th>
							</tr>
						</thead>
						<tbody>
							<!-- 이거 쓰면 한국시간으로 제대로 나옴 -->
							<fmt:timeZone value="KST">
								<fmt:formatDate value="<%=new java.util.Date() %>" pattern="MM-dd" var="toDay"/>
								<c:forEach var="bn" items="${bNotice }">
								<tr>
									<td>${bn.b_idx }</td>
									<td class="title"><a href="${pageContext.request.contextPath}/board/notice/view/${bn.b_idx}">${bn.title }</a></td>
									<td>
										<fmt:formatDate value="${bn.writeDate }" pattern="MM-dd" var="date"/>
										<fmt:formatDate value="${bn.writeDate }" pattern="HH:mm" var="time"/>
										<c:choose>
											<c:when test="${date == toDay }">
												<c:out value="${time }"></c:out>
											</c:when>
											<c:otherwise>
												<c:out value="${date }"></c:out>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								</c:forEach>
							</fmt:timeZone>
						</tbody>
					</table>
				</div>
				<!-- 공지사항 끝-->
				<!-- 공유게시판 시작  -->
				<div style="width: 32%; float: left; margin-right: 1.5%">
					<a href="${pageContext.request.contextPath}/board/share"><h4>팁&정보공유</h4></a>
					<table class="table table-hover table-condensed" style="table-layout:fixed; word-break:break-all;">
						<thead>
							<tr>
								<th width="35px" style="background-color: black; color: white; text-align: center;">번호</th>
								<th width="150px" style="background-color: black; color: white; text-align: center;">제목</th>
								<th width="50px" style="background-color: black; color: white; text-align: center;">날짜</th>
							</tr>
						</thead>
						<tbody>
							<!-- 이거 쓰면 한국시간으로 제대로 나옴 -->
							<fmt:timeZone value="KST">
								<fmt:formatDate value="<%=new java.util.Date() %>" pattern="MM-dd" var="toDay"/>
								<c:forEach var="bs" items="${bShare }">
								<tr>
									<td>${bs.b_idx }</td>
									<td class="title"><a href="${pageContext.request.contextPath}/board/share/view/${bs.b_idx}">${bs.title }</a></td>
									<td>
										<fmt:formatDate value="${bs.writeDate }" pattern="MM-dd" var="date"/>
										<fmt:formatDate value="${bs.writeDate }" pattern="HH:mm" var="time"/>
										<c:choose>
											<c:when test="${date == toDay }">
												<c:out value="${time }"></c:out>
											</c:when>
											<c:otherwise>
												<c:out value="${date }"></c:out>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								</c:forEach>
							</fmt:timeZone>
						</tbody>
					</table>
				</div>
				<!--공유게시판 끝-->
				<!-- 자유게시판 시작  -->
				<div style="width: 32%; float: left;">
					<a href="${pageContext.request.contextPath}/board/free"><h4>자유게시판</h4></a>
					<table class="table table-hover table-condensed" style="table-layout:fixed; word-break:break-all;">
						<thead>
							<tr>
								<th width="35px" style="background-color: black; color: white; text-align: center;">번호</th>
								<th width="150px" style="background-color: black; color: white; text-align: center;">제목</th>
								<th width="50px" style="background-color: black; color: white; text-align: center;">날짜</th>
							</tr>
						</thead>
						<tbody>
							<!-- 이거 쓰면 한국시간으로 제대로 나옴 -->
							<fmt:timeZone value="KST">
								<fmt:formatDate value="<%=new java.util.Date() %>" pattern="MM-dd" var="toDay"/>
								<c:forEach var="bf" items="${bFree }">
								<tr>
									<td>${bf.b_idx }</td>
									<td class="title"><a href="${pageContext.request.contextPath}/board/free/view/${bf.b_idx}">${bf.title }</a></td>
									<td>
										<fmt:formatDate value="${bf.writeDate }" pattern="MM-dd" var="date"/>
										<fmt:formatDate value="${bf.writeDate }" pattern="HH:mm" var="time"/>
										<c:choose>
											<c:when test="${date == toDay }">
												<c:out value="${time }"></c:out>
											</c:when>
											<c:otherwise>
												<c:out value="${date }"></c:out>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								</c:forEach>
							</fmt:timeZone>
						</tbody>
					</table>
				</div>
				
				
				<!--자유게시판 끝-->
			</div>
			<!-- 게시판 미리보기 끝-->
		</article>
		<!-- article 끝 -->
	</div>
	<!-- 본문 끝 -->
	
	
	<jsp:include page="/WEB-INF/resources/init/footer.jsp"/>
</div>
<!-- 컨테이너 끝 -->


<!-- 부트스트랩 탭 가능하게 해주는 js -->
<script type="text/javascript">
$(function(){
    $('ul.nav-tabs a').click(function (e) {
      e.preventDefault()
      $(this).tab('show')
    })
})
</script>
</body>
</html>