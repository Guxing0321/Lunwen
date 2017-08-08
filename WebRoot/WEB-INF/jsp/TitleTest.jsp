<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test Title Js</title>

<!-- Bootstrap CSS -->
<link
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/bootstrap/css/nprogress.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/bootstrap/css/font-awesome.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap-progressbar-3.3.4.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/bootstrap/css/daterangepicker.css"
	rel="stylesheet">

	

	



<!-- 导入js文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/fastclick.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/Chart.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/nprogress.js"></script>
 <!-- jQuery Sparklines -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/jquery.sparkline.min.js"></script>
<!-- flot -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/flot/jquery.flot.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/flot/jquery.flot.pie.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/flot/jquery.flot.resize.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/flot/jquery.flot.stack.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/flot/jquery.flot.time.js"></script>

<!-- Flot plugins -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/flot/jquery.flot.orderBars.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/flot/jquery.flot.spline.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/flot/curvedLines.js"></script>



</head>
<body>

	<!-- Button trigger modal -->
	<button class="btn btn-primary btn-lg" data-toggle="modal"
		data-target="#myModal">Launch demo modal</button>
		
		
		<div class="main_container">
		 <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="dashboard_graph x_panel">
                  <div class="row x_title">
                    <div class="col-md-6">
                      <h3>Network Activities <small>Graph title sub-title</small></h3>
                    </div>
                    <div class="col-md-6">
                      <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                        <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                      </div>
                    </div>
                  </div>
                  <div class="x_content">
                    <div class="demo-container" style="height:250px">
                      <div id="chart_plot_03" class="demo-placeholder"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
		
		</div>
		

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					<table class="table">
						<tr>
							<th>ID</th>
							<th>客户名称</th>
							<th>客户来源</th>
							<th>客户所属行业</th>
							<th>客户级别</th>
							<th>固定电话</th>
							<th>手机</th>
							<th>操作</th>
						</tr>
						

					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


</body>
</html>