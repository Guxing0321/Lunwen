<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>TimeManagement System</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.10.1.min.js"></script>
<style type="text/css">
.menu_list{width:268px;margin:0 auto;}
.menu_head{
	height: 47px;
	line-height: 47px;
	padding-left: 38px;
	font-size: 14px;
	color: #525252;
	cursor: pointer;
	border-left: 1px solid #e1e1e1;
	border-right: 1px solid #e1e1e1;
	border-bottom: 1px solid #e1e1e1;
	border-top: 1px solid #F1F1F1;
	position: relative;
	margin: 0px;
	font-weight: bold;
	background: #f1f1f1 url(images/pro_left.png) center right no-repeat;
}
.menu_list .current{color:#fb9337;background:#f1f1f1 url(images/pro_down.png) center right no-repeat;}
.menu_body{
	line-height: 38px;
	border-left: 1px solid #e1e1e1;
	backguound: #fff;
	border-right: 1px solid #e1e1e1;
}
.menu_body a{display:block;height:38px;line-height:38px;padding-left:38px;color:#777777;background:#fff;text-decoration:none;border-bottom:1px solid #e1e1e1;}
.menu_body a:hover{text-decoration:none;}
</style>
<script>
$(document).ready(function(){
	$("#firstpane .menu_body:eq(0)").show();
	$("#firstpane h3.menu_head").click(function(){
		$(this).addClass("current").next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
		$(this).siblings().removeClass("current");
	});
	$("#secondpane .menu_body:eq(0)").show();
	$("#secondpane h3.menu_head").mouseover(function(){
		$(this).addClass("current").next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
		$(this).siblings().removeClass("current");
	});
});
</script>

<style type="text/css">

.container2 div a {
	display: block;
	color: grey;
}

.container2 div a:hover {
	color: #fb9337;
	background-color: grey;
}

.current {
	color: #fb9337;
	background: grey;
}

</style>
<script language="javascript" type="text/javascript">
	var $c = function(array) {
		var nArray = [];
		for (var i = 0; i < array.length; i++)
			nArray.push(array[i]);
		return nArray;
	};
	Array.prototype.each = function(func) {
		for (var i = 0, l = this.length; i < l; i++) {
			func(this[i], i);
		}
		;
	};
	document.getElementsByClassName = function(cn) {
		var hasClass = function(w, Name) {
			var hasClass = false;
			w.className.split(' ').each(function(s) {
				if (s == Name)
					hasClass = true;
			});
			return hasClass;
		};
		var elems = document.getElementsByTagName("*") || document.all;
		var elemList = [];
		$c(elems).each(function(e) {
			if (hasClass(e, cn)) {
				elemList.push(e);
			}
		})
		return $c(elemList);
	};
	function change_bg(obj) {
		var a = document.getElementsByClassName("container2")[0]
				.getElementsByTagName("a");
		for (var i = 0; i < a.length; i++) {
			a[i].className = "";
		}
		obj.className = "current";
	}
</script>

</head>
<body>
	<!-- begin -->
	<div class = "container2">
		<div id="firstpane" class="menu_list">
			<h3 class="menu_head current">Time Management</h3>
			<div style="display: block" class="menu_body">
				<a onclick="change_bg(this)" class = "current" href="${pageContext.request.contextPath}/main.action" target="Main">Home Page</a>
				<a onclick="change_bg(this)" href="${pageContext.request.contextPath}/application.action" target="Main">Request For Vacation</a>
				<a onclick="change_bg(this)" href="${pageContext.request.contextPath}/findMyLeave.action " target="Main">My Vacation Record</a>
				<a onclick="change_bg(this)" href="${pageContext.request.contextPath}/searchothers.action"  target="Main">Colleague's Vacation Record</a>
				<a onclick="change_bg(this)" href="${pageContext.request.contextPath}/mainHolidays.action"  target="Main">National Legal Holidays</a>
				<a onclick="change_bg(this)" href="${pageContext.request.contextPath}/manager.action" target="Main">Leave management</a>
			</div>
			<h3 class="menu_head">Personal Center</h3>
			<div style="display: none" class="menu_body">
				<a onclick="change_bg(this)" href="${pageContext.request.contextPath}/information.action" target="Main">Personal Data</a>
				<a onclick="change_bg(this)" href="${pageContext.request.contextPath}/modifypassword.action" target="Main">Modify Password</a>
			</div>
		</div>
	</div>
</body>
</html>