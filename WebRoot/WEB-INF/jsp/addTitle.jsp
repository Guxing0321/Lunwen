<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap CSS -->
<link
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
	<!-- bootstrap datepicker -->
<link
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap-datepicker.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath }/bootstrap/css/animate.min.css"
	rel="stylesheet">
	
<link href="${pageContext.request.contextPath }/bootstrap/css/demo.css"
	rel="stylesheet">
	
<!-- 导入js文件 -->
<!-- jquery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.11.0.min.js"></script>
<!-- 自动提示的js插件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap3-typeahead.js"></script>
<!-- bootstrap的js文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.js"></script>
<!-- datapicker的js文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap-datepicker.js"></script>
<!-- datapicker的中文插件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap-datepicker.zh-CN.min.js"></script>




<title>添加论文信息</title>

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
  
</script> 

</head>
<body>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-8">
					<div class="card">
						<div class="header">
							<h4 class="title">Add Title</h4>
						</div>
						<br />
						<div class="content">
							<form action="${pageContext.request.contextPath }/lunwen/addTitleIntoSql.action" 
							method="post" enctype="multipart/form-data">

								<!-- DOI信息 -->
								<div class="row">
									<div class="col-md-12">
										<div class="form-group form-group-sm">
											<label>DOI信息*</label> <input type="text" class="form-control"
												name="doi" placeholder="必填" required="required"></input>
										</div>
									</div>
								</div>

								<!-- 论文题目 -->
								<div class="row">
									<div class="col-md-12">
										<div class="form-group form-group-sm">
											<label>论文题目*</label> <input type="text" class="form-control"
												name="lwname" placeholder="必填" required="required"></input>
										</div>
									</div>
								</div>

								<!-- 作者， 发表时间 -->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group form-group-sm">
											<label>作者*</label> <input type="text" class="form-control"
												name="author" placeholder="必填" required="required"></input>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group form-group-sm">
											<label>发表时间*</label> <input type="text" class="form-control datepicker"
											   name="publishtime" required="required"></input>
										</div>
									</div>
								</div>

                                 <!-- 发表期刊，期刊物级别，期刊卷号 -->
								<div class="row">
									<div class="col-md-5">
										<div class="form-group form-group-sm">
											<label>发表期刊.</label> <input type="text" name="mname" class="form-control"></input>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group form-group-sm">
											<label>期刊物级别</label> <input type="text" name="mtype" class="form-control" />
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group form-group-sm">
											<label for="exampleInputEmail1">期刊卷号</label> <input
												type="text" name="mcodenum" class="form-control">
										</div>
									</div>
								</div>
     
                               <!-- 是否署名南京信息工程大学  ,工作单位-->
								<div class="row">
									<!-- <div class="col-md-5">
										<div class="form-group form-group-sm">
											<label>是否署名南信大</label><br> 
											 <label
												class="checkbox-inline"> <input type="radio"
												name="isnamenuist" value="是" checked>是
											</label> 
											<label class="checkbox-inline"> <input type="radio"
												name="isnamenuist" value="否">否
										    </label>
											 
										</div>
										</div> -->
										<div class="col-md-7">
										<div class="form-group form-group-sm">
											<label>工作单位</label> <input type="text" name="workplace" class="form-control"></input>
										</div>
									</div>
								</div>
								
								
							       <!-- 上传文件-->
								<div class="row">
									<div class="col-md-5">
										<div class="form-group form-group-sm">
											<label>上传你的论文(格式需求  .pdf)</label>
											 <input type="file" name="file" /> 
											 
										</div>
										
									</div>
								</div>	
								
								
								
                              <!--  
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>City</label> <input type="text" class="form-control"
												placeholder="City" value="Mike">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Country</label> <input type="text"
												class="form-control" placeholder="Country" value="Andrew">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Postal Code</label> <input type="number"
												class="form-control" placeholder="ZIP Code">
										</div>
									</div>
								</div> -->


                              <!-- 被引用的论文 -->
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
										<div class="x_content">
											<label>被引用的论文*</label>
											<textarea name="refertitle" id="referTitle" rows="5" class="form-control"
												 required="required"></textarea>
										</div>
									</div>
								</div>
                           </div>
								<div class="form-group form-group-sm">
									<div
										class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3 pull-right">
										<button class="btn btn-primary" type="button">Cancel</button>
										<button class="btn btn-primary" type="reset">Reset</button>
										<button type="submit" class="btn btn-success">Submit</button>
									</div>
								</div>
								<div class="clearfix"></div>
								<div class="ln_solid"></div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>

</html>