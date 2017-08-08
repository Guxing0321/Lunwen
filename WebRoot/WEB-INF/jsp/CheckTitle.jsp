<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>审核论文</title>

<!-- Bootstrap CSS -->
<link
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<!-- 导入datapicker的样式 -->
<link
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap-datepicker.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<!-- 导入js文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap3-typeahead.js"></script>
<!-- 导入datepicker的js文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap-datepicker.js"></script>
<!-- 引入datepicker的中文文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap-datepicker.zh-CN.min.js"></script>
<!-- bootstrap的js文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.js"></script>


<script type="text/javascript">
//bootstrap - datepicker日期插件
$(function () {
    $(".datepicker").datepicker({
        language: "zh-CN",
        autoclose: true,//选中之后自动隐藏日期选择框
        clearBtn: true,//清除按钮
        todayBtn: true,//今日按钮
        format: "yyyy-mm-dd"//日期格式，详见 http://bootstrap-datepicker.readthedocs.org/en/release/options.html#format
    });
});

//通过ajax将数据从数据库中取出来
function editCustomer(id) {
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath }/luwenCheck/detail.action",
		data:{"id":id},
		success:function(data) {
			$("#edit_lwId").val(data.lunwen.lwid);
			$("#edit_email").val(data.lunwen.email);
			$("#edit_doi").text(data.lunwen.doi);
			$("#edit_titleName").text(data.lunwen.lwname);
			$("#edit_publishTime").text(data.lunwen.publishtime);
			$("#edit_author").text(data.lunwen.author);
			$("#edit_mName").text(data.lunwen.mname);
			$("#edit_mType").text(data.lunwen.mtype);
			$("#edit_mCodenum").text(data.lunwen.mcodenum);
			$("#edit_workplace").text(data.lunwen.workplace);
			$("#edit_referTitle").text(data.lunwen.refertitle);
			$("#edit_pdfLink").attr("href",data.url);
			
		}
	});
}




//根据id审核论文的信息
function updateCustomer() {
			$.post("${pageContext.request.contextPath }/luwenCheck/checkTitle.action",$("#check_lunwen_form").serialize(),function(data){
				alert("该论文已审核成功！");
				window.location.reload();
			});
		}


</script>
<script type="text/javascript">
// 论文呢doi提示
$(document).ready(function(){
	$('#doi').typeahead({
	source: function (query, process) {
	$.ajax({
	url: '${pageContext.request.contextPath }/Json/DoijsonChange.action',
	type: 'POST',
	dataType: 'JSON',
	data: query,
	success: function(data) {
	console.log(data);
	process(data);
	}
	});
	}
	});
});


// 论文的名字提示
$(document).ready(function(){
	$('#lwname').typeahead({
	source: function (query, process) {
	$.ajax({
	url: '${pageContext.request.contextPath }/Json/lwNamejsonChange.action',
	type: 'POST',
	dataType: 'JSON',
	data: query,
	success: function(data) {
	console.log(data);
	process(data);
	}
	});
	}
	});
});


//工作地点提示
$(document).ready(function(){
	$('#workplace').typeahead({
	source: function (query, process) {
	$.ajax({
	url: '${pageContext.request.contextPath }/Json/workplaceJsonChange.action',
	type: 'POST',
	dataType: 'JSON',
	data: query,
	success: function(data) {
	console.log(data);
	process(data);
	}
	});
	}
	});
});

</script>

</head>
<body>
<div>
<h3 ><font color="orange">  审核论文</font></h3>

</div>
	<br />
	

	<!-- /.row -->
	<!-- <div class="panel panel-default"> -->
	<div class="panel-body ">
		<form class="form-inline"
			action="${pageContext.request.contextPath }/luwenCheck/uncheckedLunwen.action"
			method="get">
			<!-- 论文的名字 -->
			<div class="form-group form-group-sm">
				<label for="customerName">论文名字</label> <input type="text"
					class="form-control" id="lwname" value="${lwname }" data-provide="typeahead" name="lwname">
			</div>
			<!-- 工作地点 -->
			<div class="form-group form-group-sm">
				<label for="customerName">工作地点</label> <input type="text"
					class="form-control" id="workplace" data-provide="typeahead" value="${workplace }"
					name="workplace">
			</div>
			<!-- 工作地点 -->
			<div class="form-group form-group-sm">
				<label for="customerName">DOI</label> <input type="text"
					class="form-control" id="doi" value="${doi }" data-provide="typeahead" name="doi">
			</div>
			<%-- <div class="form-group form-group-sm">
						<label for="customerFrom">客户来源</label> <select
							class="form-control" id="customerFrom" placeholder="客户来源"
							name="custSource">
							<option value="">--请选择--</option>
							<c:forEach items="${fromType}" var="item">
								<option value="${item.dict_id}"
									<c:if test="${item.dict_id == custSource}"> selected</c:if>>${item.dict_item_name }</option>
							</c:forEach>
						</select>
					</div> --%>

			<%-- <div class="form-group form-group-sm">
				<label for="custLevel">是否署名南信大</label> <select class="form-control"
					id="isnamenuist" name="isnamenuist">
					<option value="">--请选择--</option>
					<c:forEach items="${isNameNuistList}" var="isNameItem">
						<option value="${isNameItem}"
							<c:if test="${isNameItem == isnamenuist}"> selected</c:if>>${isNameItem }</option>
					</c:forEach>
				</select>
			</div> --%>
			<button type="submit" class="btn btn-primary">查询</button>

		</form>

	</div>
	<!-- 	</div> -->




	<!-- table 的展示信息 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">论文信息列表</div>
				<!-- /.panel-heading -->
				<table class="table table-hover table-condensed table-responsive">
					<thead>
						<tr>
							<th>ID</th>
							<th>论文题目</th>
							<th>作者</th>
							<th>DOI号</th>
							<th>工作单位</th>
							<th>发表时间</th>
							<th>状态</th>
							<th>积分</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.rows}" var="title">
							<tr>
								<td>${title.lwid}</td>
								<td>${title.lwname}</td>
								<td>${title.author}</td>
								<td>${title.doi}</td>
								<td>${title.workplace}</td>
								<td>${title.publishtime }</td>
								<td>${title.status}</td>
								<td>${title.thistitlescore}</td>
								<td><a href="#" class="btn btn-primary btn-xs"
									data-toggle="modal" data-target="#customerEditDialog"
									onclick="editCustomer(${title.lwid})">审核</a> <a href="#"
									class="btn btn-danger btn-xs"
									onclick="deleteCustomer(${title.lwid})">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-md-12 text-right">
					<itcast:page
						url="${pageContext.request.contextPath }/luwenCheck/uncheckedLunwen.action" />
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>



	<!-- 论文信息编辑对话框 -->
	<div class="modal fade" id="customerEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">审核论文信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="check_lunwen_form">

						<div class="row hidden">
							<div class="col-md-10">
								<div class="form-group form-group-sm">
									<label>&nbsp;&nbsp;&nbsp;论文id</label> <input type="text"
										class="form-control" id="edit_lwId" name="lwid"></input>
								</div>
							</div>
						</div>
						
						
						<div class="row hidden">
							<div class="col-md-10">
								<div class="form-group form-group-sm">
									<label>&nbsp;&nbsp;&nbsp;论文email</label> <input type="text"
										class="form-control" id="edit_email" name="email"></input>
								</div>
							</div>
						</div>

						<div class="container">
							<table style="width: 550px;"
								class="table table-striped table-hover table-bordered">

								<tbody>
									<tr>
										<th width="30%">DOI信息</th>
										<td width="70%"><label id="edit_doi"></label></td>
									</tr>
									<tr>
										<th width="30%">论文题目</th>
										<td width="70%"><label id="edit_titleName"></label></td>
									</tr>
									<tr>
										<th width="30%">作者</th>
										<td width="70%"><label id="edit_author"></label></td>

									</tr>
									<tr>
										<th width="30%">发表时间</th>
										<td width="70%"><label id="edit_publishTime"></label></td>
									</tr>
									<tr>
										<th width="30%">发表期刊</th>
										<td width="70%"><label id="edit_mName"></label></td>
									</tr>
									<tr>
										<th width="30%">期刊物级别</th>
										<td width="70%"><label id="edit_mType"></label></td>
									</tr>
									<tr>
										<th width="30%">期刊卷号</th>
										<td width="70%"><label id="edit_mCodenum"></label></td>
									</tr>
									<tr>
										<th width="30%">工作单位</th>
										<td width="70%"><label id="edit_workplace"></label></td>
									</tr>
									<tr>
										<th width="30%">引用论文</th>
										<td width="70%" colspan="3"><label id="edit_referTitle"></label></td>
									</tr>
									<tr>
										<th width="30%">论文原文（pdf）：</th>
										<td width="70%"><a id="edit_pdfLink" target="_Blank">查看论文</a></td>
									</tr>

								</tbody>
							</table>
						</div>


						<!-- 管理员审核论文-->
						<div class="row">

							<div class="col-md-4">
								<div class="form-group form-group-sm">
									<label>&nbsp;&nbsp;&nbsp;是否署名南信大</label><br> <label
										class="checkbox-inline"> <input type="radio"
										name="isnamenuist" value="是" checked>是
									</label> <label class="checkbox-inline"> <input type="radio"
										name="isnamenuist" value="否">否
									</label>

								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group form-group-sm">
									<label>&nbsp;&nbsp;&nbsp;DOI号是否有效</label><br> <label
										class="checkbox-inline"> <input type="radio"
										name="doiIsWork" value="是" checked>是
									</label> <label class="checkbox-inline"> <input type="radio"
										name="doiIsWork" value="否">否
									</label>
								</div>
							</div>

							<div class="col-md-4">
								<div class="form-group form-group-sm">
									<label>&nbsp;&nbsp;&nbsp;是否通过</label><br> <label
										class="checkbox-inline"> <input type="radio"
										name="status" value="通过" checked>通过
									</label> <label class="checkbox-inline"> <input type="radio"
										name="status" value="不通过">不通过
									</label>
								</div>
							</div>

						</div>

						<!-- 论文审核的备注 -->
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<div class="x_content">
										<label>&nbsp;&nbsp;&nbsp;审核意见</label>&nbsp;&nbsp;&nbsp;
										<textarea name="beizhu" id="edit_beizhu" rows="3"
											class="form-control"></textarea>
									</div>
								</div>
							</div>
						</div>




					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateCustomer()">保存修改</button>
				</div>
			</div>
		</div>
	</div>





</body>
</html>