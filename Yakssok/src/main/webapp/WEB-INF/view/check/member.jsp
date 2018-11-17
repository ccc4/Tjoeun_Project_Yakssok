<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	function show(str) {
		alert(str);
		home();
	}
	
	function home() {
		location.href="${pageContext.request.contextPath}/";
	}
</script>

<c:if test="${join == 1 }">
	<script type="text/javascript">
		/* alert("회원가입완료!\n회원가입한 아이디로 로그인해주세요.");
		location.href= "${pageContext.request.contextPath}/"; */
		show('회원가입완료!\n회원가입한 아이디로 로그인해주세요.');
	</script>
</c:if>
<c:if test="${join == 0 }">
	<script type="text/javascript">
		/*alert("회원가입실패");
		location.href= "${pageContext.request.contextPath}/";*/
		show('회원가입실패');
	</script>
</c:if>

<c:if test="${login == 1 }">
	<script type="text/javascript">
		/* show('로그인성공'); */
		home();
	</script>
</c:if>
<c:if test="${login == 0 }">
	<script type="text/javascript">
		show("로그인실패");
	</script>
</c:if>

<c:if test="${modify == 1 }">
	<script type="text/javascript">
		alert("정보수정 성공");
		location.href= "${pageContext.request.contextPath}/";
	</script>
</c:if>
<c:if test="${modify == 0 }">
	<script type="text/javascript">
		alert("정보수정 실패");
		location.href= "${pageContext.request.contextPath}/";
	</script>
</c:if>

<c:if test="${logout == 1 }">
	<script type="text/javascript">
		/* alert("로그아웃 성공");
		location.href= "${pageContext.request.contextPath}/"; */
		home();
	</script>
</c:if>
<c:if test="${logout == 0 }">
	<script type="text/javascript">
		show("로그아웃실패");
	</script>
</c:if>

</body>
</html>