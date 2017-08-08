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

<title>Title List</title>

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
		url:"${pageContext.request.contextPath }/lunwen/detail.action",
		data:{"id":id},
		success:function(data) {
			$("#edit_lwId").val(data.lunwen.lwid);
			$("#edit_doi").val(data.lunwen.doi);
			$("#edit_titleName").val(data.lunwen.lwname);
			$("#edit_publishTime").val(data.lunwen.publishtime);
			$("#edit_author").val(data.lunwen.author);
			$("#edit_mName").val(data.lunwen.mname);
			$("#edit_mType").val(data.lunwen.mtype);
			$("#edit_mCodenum").val(data.lunwen.mcodenum);
			$("#edit_workplace").val(data.lunwen.workplace);
			$("#edit_referTitle").val(data.lunwen.refertitle);
			$("#edit_email").val(data.lunwen.email);
			$("#edit_pdfLink").attr("href",data.url);
			
		}
	});
}

//根据id删除信息的方法
function deleteCustomer(id) {
	if(confirm('确实要删除该客户吗?')) {
		$.post("${pageContext.request.contextPath }/lunwen/deleteLuwnenById.action",{"id":id},function(data){
			alert("客户删除更新成功！");
			window.location.reload();
		});
	}
}


//根据id修改用户信息
function updateCustomer() {
			$.post("${pageContext.request.contextPath }/lunwen/update.action",$("#edit_lunwen_form").serialize(),function(data){
				alert("客户信息更新成功！");
				window.location.reload();
			});
		}





//通过id查询我们想要查看的信息
//通过ajax将数据从数据库中取出来
function selectTitleById(id) {
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath }/luwenCheck/detail.action",
		data:{"id":id},
		success:function(data) {
			$("#1edit_lwId").val(data.lunwen.lwid);
			$("#1edit_email").val(data.lunwen.email);
			$("#1edit_doi").text(data.lunwen.doi);
			$("#1edit_titleName").text(data.lunwen.lwname);
			$("#1edit_publishTime").text(data.lunwen.publishtime);
			$("#1edit_author").text(data.lunwen.author);
			$("#1edit_mName").text(data.lunwen.mname);
			$("#1edit_mType").text(data.lunwen.mtype);
			$("#1edit_mCodenum").text(data.lunwen.mcodenum);
			$("#1edit_workplace").text(data.lunwen.workplace);
			$("#1edit_referTitle").text(data.lunwen.refertitle);
			$("#1edit_beizhu").text(data.lunwen.beizhu);
			$("#1edit_pdfLink").attr("href",data.url);
			
		}
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
<h3 ><font color="orange">  我的论文</font></h3>

</div>
	<br />
	<!-- /.row -->
	<!-- <div class="panel panel-default"> -->
	<div class="panel-body ">
		<form class="form-inline"
			action="${pageContext.request.contextPath }/lunwen/selectTitle.action"
			method="get">
			<!-- 论文的名字 -->
			<div class="form-group form-group-sm">
				<label for="customerName">论文名字</label> <input type="text"
					class="form-control" id="lwname" data-provide="typeahead"
					value="${lwname }" name="lwname">
			</div>
			<!-- 工作地点 -->
			<div class="form-group form-group-sm">
				<label for="customerName">工作地点</label> <input type="text"
					class="form-control" id="workplace" data-provide="typeahead" value="${workplace }"
					name="workplace">
			</div>
			<!-- DOI信息 -->
			<div class="form-group form-group-sm">
				<label for="customerName">DOI</label> <input type="text"
					class="form-control" id="doi" data-provide="typeahead" value="${doi }" name="doi">
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

			<div class="form-group form-group-sm">
				<label for="custLevel">论文状态</label> <select class="form-control"
					id="status" name="status">
					<option value="">--请选择--</option>
					<c:forEach items="${statusList}" var="status">
						<option value="${status}"
							<c:if test="${status == statusinLunwen}"> selected</c:if>>${status }</option>
					</c:forEach>
				</select>
			</div>
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
								<td>
									<!-- 根据状态来区分我们的按钮 --> <c:if
										test="${title.status =='未审核' || title.status =='不通过'}">
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
											data-target="#customerEditDialog"
											onclick="editCustomer(${title.lwid})">修改</a>
										<a href="#" class="btn btn-danger btn-xs"
											onclick="deleteCustomer(${title.lwid})">删除</a>
									</c:if> <c:if test="${title.status =='通过'}">
										<a href="#" class="btn btn-info btn-xs" data-toggle="modal"
											data-target="#titleTable"
											onclick="selectTitleById(${title.lwid})">查看</a>

									</c:if>


								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-md-12 text-right">
					<itcast:page
						url="${pageContext.request.contextPath }/lunwen/selectTitle.action" />
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
					<h4 class="modal-title" id="myModalLabel">编辑论文信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_lunwen_form">

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
						<!-- DOI信息 -->
						<div class="row">
							<div class="col-md-10">
								<div class="form-group form-group-sm">
									<label>&nbsp;&nbsp;&nbsp;DOI信息</label> <input type="text"
										class="form-control" id="edit_doi" name="doi" placeholder="必填"
										required="required"></input>
								</div>
							</div>
						</div>

						<!-- 论文题目 -->
						<div class="row">
							<div class="col-md-10">
								<div class="form-group form-group-sm">
									<label>&nbsp;&nbsp;&nbsp;论文题目</label> <input type="text"
										class="form-control" id="edit_titleName" name="lwname"></input>
								</div>
							</div>
						</div>

						<!-- 作者， 发表时间 -->
						<div class="row">
							<div class="col-md-4">
								<div class="form-group form-group-sm">
									<label>&nbsp;&nbsp;&nbsp;作者</label> <input type="text"
										class="form-control" id="edit_author" name="author"></input>
								</div>
							</div>
							<div class="col-md-5">
								<div class="form-group form-group-sm">
									<label>&nbsp;&nbsp;&nbsp;发表时间</label> <input type="text"
										class="form-control datepicker" id="edit_publishTime"
										name="publishtime" required="required"></input>
								</div>
							</div>
						</div>

						<!-- 发表期刊，期刊物级别，期刊卷号 -->
						<div class="row">
							<div class="col-md-5">
								<div class="form-group form-group-sm">
									<label>&nbsp;&nbsp;&nbsp;发表期刊.</label> <input type="text"
										id="edit_mName" name="mname" class="form-control"></input>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group form-group-sm">
									<label>&nbsp;&nbsp;&nbsp;期刊物级别</label> <input type="text"
										id="edit_mType" name="mtype" class="form-control" />
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group form-group-sm">
									<label for="exampleInputEmail1">&nbsp;&nbsp;&nbsp;期刊卷号</label>
									<input type="text" id="edit_mCodenum" name="mcodenum"
										class="form-control">
								</div>
							</div>
						</div>

						<!-- 是否署名南京信息工程大学  ,工作单位-->
						<div class="row">
						<!-- 	<div class="col-md-5">
								<div class="form-group form-group-sm">
									<label>&nbsp;&nbsp;&nbsp;是否署名南信大</label><br> <label
										class="checkbox-inline"> <input type="radio"
										name="isnamenuist" value="是" checked>是
									</label> <label class="checkbox-inline"> <input type="radio"
										name="isnamenuist" value="否">否
									</label>

								</div>
							</div> -->
							<div class="col-md-7">
								<div class="form-group form-group-sm">
									<label>&nbsp;&nbsp;&nbsp;工作单位</label> <input type="text"
										id="edit_workplace" name="workplace" class="form-control"></input>
								</div>



							</div>
						</div>


						<!-- 上传文件-->
						<div class="row">
							<div class="col-md-5">
								<div class="form-group form-group-sm">
									<label>查看论文:</label> <a id="edit_pdfLink" target="_Blank">111</a>

								</div>

							</div>
						</div>



						<!-- 
                              <!-- 被引用的论文 -->
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<div class="x_content">
										<label>&nbsp;&nbsp;&nbsp;被引用的论文</label>&nbsp;&nbsp;&nbsp;
										<textarea name="refertitle" id="edit_referTitle" rows="5"
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



	<!-- 论文信息查看table-->
	<div class="modal fade" id="titleTable" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
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
										class="form-control" id="1edit_lwId" name="lwid"></input>
								</div>
							</div>
						</div>


						<div class="row hidden">
							<div class="col-md-10">
								<div class="form-group form-group-sm">
									<label>&nbsp;&nbsp;&nbsp;论文email</label> <input type="text"
										class="form-control" id="1edit_email" name="email"></input>
								</div>
							</div>
						</div>

						<div class="container">
							<table style="width: 550px;"
								class="table table-striped table-hover table-bordered">

								<tbody>
									<tr>
										<th width="30%">DOI信息</th>
										<td width="70%"><label id="1edit_doi"></label></td>
									</tr>
									<tr>
										<th width="30%">论文题目</th>
										<td width="70%"><label id="1edit_titleName"></label></td>
									</tr>
									<tr>
										<th width="30%">作者</th>
										<td width="70%"><label id="1edit_author"></label></td>

									</tr>
									<tr>
										<th width="30%">发表时间</th>
										<td width="70%"><label id="1edit_publishTime"></label></td>
									</tr>
									<tr>
										<th width="30%">发表期刊</th>
										<td width="70%"><label id="1edit_mName"></label></td>
									</tr>
									<tr>
										<th width="30%">期刊物级别</th>
										<td width="70%"><label id="1edit_mType"></label></td>
									</tr>
									<tr>
										<th width="30%">期刊卷号</th>
										<td width="70%"><label id="1edit_mCodenum"></label></td>
									</tr>
									<tr>
										<th width="30%">工作单位</th>
										<td width="70%"><label id="1edit_workplace"></label></td>
									</tr>
									<tr>
										<th width="30%">引用论文</th>
										<td width="70%" colspan="3"><label id="1edit_referTitle"></label></td>
									</tr>
									<tr>
										<th width="30%">论文原文（pdf）：</th>
										<td width="70%"><a id="1edit_pdfLink" target="_Blank">查看论文</a></td>
									</tr>
									<tr>
										<th width="30%">审核备注</th>
										<td width="70%" colspan="3"><label id="1edit_beizhu"></label></td>
									</tr>

								</tbody>
							</table>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>

				</div>
			</div>
		</div>
	</div>




</body>
</html>