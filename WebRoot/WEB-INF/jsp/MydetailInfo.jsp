<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test Title Js</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.default.css"
	type="text/css" />
<!-- Bootstrap CSS -->
<link
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- 导入js文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.js"></script>




</head>
<body>

	<div class="contenttitle2">
		<h2>Mydetail Info</h2>
	</div>
	<br />
	<br />

	<!-- 论文信息查看table-->
	<div class="container">
		<table style="width: 550px;"
			class="table table-striped table-hover table-bordered">

			<tbody>
				<tr>
					<th width="30%">姓名</th>
					<td width="70%"><label id="1edit_doi">${userLogin.name }</label></td>
				</tr>
				<tr>
					<th width="30%">邮箱</th>
					<td width="70%"><label id="1edit_titleName">${userLogin.email }</label></td>
				</tr>
				<tr>
					<th width="30%">得分</th>
					<td width="70%"><label id="1edit_author">${userLogin.score }</label></td>

				</tr>

				<tr>
					<th width="30%">已提交的论文</th>
					<td width="70%"><label id="1edit_publishTime">${allTitleCount }</label></td>
				</tr>
				<tr>
					<th width="30%">已通过审核的论文</th>
					<td width="70%"><label id="1edit_publishTime">${checkCount }</label></td>
				</tr>
				<tr>
					<th width="30%">未审核通过的论文</th>
					<td width="70%"><label id="1edit_mName">${uncheckCount }</label></td>
				</tr>


			</tbody>
		</table>
	</div>


</body>
</html>