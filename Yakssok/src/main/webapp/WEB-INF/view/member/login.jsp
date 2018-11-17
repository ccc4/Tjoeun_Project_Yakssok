<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
</head>

<body>

<c:if test="${not islogin }">
	<form action="${pageContext.request.contextPath}/member/login" method="post">
		<table>
			<caption>LOGIN</caption>
			<tr>
				<td>ID:</td>
				<td><input type="text" name="id" placeholder="아이디를 입력해주세요"></td>
			</tr>
			<tr>
				<td>PW:</td>
				<td><input type="password" name="pw" placeholder="비밀번호를 입력해주세요"></td>
			</tr>

		<tr>
			<td><input type="submit" value="로그인"></td>
			<td> <form action="${pageContext.request.contextPath}/member/join" method="post">
			<input type="button" value="회원가입"></form>
		</tr>
	</table>
	
	</form>
	<a href="${pageContext.request.contextPath}/member/findid">ID찾기</a>
	<a href="${pageContext.request.contextPath}/member/findpw">비밀번호 찾기</a>

</c:if>
<!-- 
<c:if test="${islogin == true }">
<script type="text/javascript">
location.href="/"
</script>
${loginMember.nickname}님 환영합니다<br/>
<a href="${pageContext.request.contextPath}/logout">[로그아웃하기]</a>
</c:if>
 -->
</body>
</html>