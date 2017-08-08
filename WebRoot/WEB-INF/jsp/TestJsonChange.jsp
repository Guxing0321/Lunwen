<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test Json Changes</title>
<!-- DataTables CSS -->
<link
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 导入js文件 -->
	
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap3-typeahead.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.js"></script>


<script type="text/javascript">

$(document).ready(function(){
	$('#product_search').typeahead({
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
	
	

</script>


</head>
<body>



<!-- 	<input id="product_search" type="text" data-provide="typeahead" /> -->
	
 
    <div class="input-group">
      <span class="input-group-btn">
        <button class="btn btn-default" type="button">Go!</button>
      </span>
      <input id="product_search" type="text" class="form-control" data-provide="typeahead"  placeholder="Search for...">
    </div>
 




</body>
</html>