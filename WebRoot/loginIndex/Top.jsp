<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>TimeManagement System</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.default.css" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
  function logout(){
	  if(confirm('Are you sure you want to quit?')){
		  window.parent.location.href = "${pageContext.request.contextPath}/logout.action";
	  }
  }


</script>	
</head>
<body>
<div class="bodywrapper">
		<div class="topheader">
			<div class="left">
				<h1 class="logo">
					NUIST.<span>TitleManagement</span>
				</h1>
				<span class="slogan">System</span>

<!-- 				<div class="search">
					<form action="" method="post">
						<input type="text" name="keyword" id="keyword"
							value="Enter keyword(s)" />
						<button class="submitbutton"></button>
					</form>
				</div> -->
				<!--search-->
				<br clear="all" />

			</div>
			<!--left-->

			<div class="right">
				<!--<div class="notification">
                <a class="count" href="notifications.html"><span>9</span></a>
        	</div>
			-->
				<div class="userinfo">
					<span>${empInfo.empName} </span>
					<a onclick="javascript:logout()" target="_"><font style="color:#fb9337 ">Log Down</font></a>
				</div>
			</div>
			<!--right-->
		</div>
	</div>
	<!--bodywrapper-->
<div class="header">
</div>
<!--header-->

</body>
</html>