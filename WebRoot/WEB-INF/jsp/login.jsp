<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login登陆页面</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/supersized.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!-- 导入导航栏图标 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/top/favicon.ico" />
<!-- Javascript -->
<script src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/supersized.3.2.7.min.js"></script>
<script src="${pageContext.request.contextPath}/js/supersized-init.js"></script>
<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
<script type="text/javascript">
	function checkiput() {
		var ccnum = document.getElementById("email");
		var cpassword = document.getElementById("password");
		if (username.value == "" || username == null) {
			alert("卡号不能为空！");
			return false;
		}
		if (cpassword.value == "" || password == null) {
			alert("卡号密码不能为空！");
			return false;
		}
	}
</script>


</head>
<body>
	<div class="page-container">
		<h1>Welcome To Visit The NUIST Paper System</h1>
		<form
			action="${pageContext.request.contextPath }/userLogin.action"
			method="post">
			<input type="text" name="email" id="email" class="email"
				placeholder="Email"> <input type="password" name="password"
				id="password" class="password" placeholder="Password">
			<button type="submit">LAND</button>
			<div class="error">
				<span>+</span>
			</div>
		</form>
		<div class="connect"></div>
	</div>
</body>
</html>