<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>曲线图</title>

<script src="${pageContext.request.contextPath }/js/jquery-1.11.1.js"></script>
<script src="${pageContext.request.contextPath }/js/chart/Chart.min.js"></script>


  <script>  
     var data = {
				labels : ["January","February","March","April","May","June","July"],
				
				datasets : [
					{
						lineItemName : "test1",
						fillColor : "rgba(220,220,220,0.5)",
						strokeColor : "rgba(220,220,220,1)",
						pointColor : "rgba(220,220,220,1)",
						pointStrokeColor : "#fff",
						data : [65,59,90,81,56,55,40]
					},
					
					{
						lineItemName : "test2",
						fillColor : "rgba(151,187,205,0.5)",
						strokeColor : "rgba(151,187,205,1)",
						pointColor : "rgba(151,187,205,1)",
						pointStrokeColor : "#fff",
						data : [28,48,40,19,96,27,100]
					}
				]
			};
			
			
			var chartLine = null;
			window.onload = function(){				
				var ctx = document.getElementById("myChart").getContext("2d");
				
				chartLine = new Chart(ctx).Line(data);
				
				initEvent(chartLine, clickCall);
			}
			
			function clickCall(evt) {
				var point = chartLine.getPointSingleAtEvent(evt);
				
				if ( point !== null )
					alert( point.label + ": " + point.lineItemName + " ____ " + point.value);
			}
			
			function initEvent(chart, handler) {
				var method = handler;
				var eventType = "click";
				var node = chart.chart.canvas;
								
				if (node.addEventListener) {
					node.addEventListener(eventType, method);
				} else if (node.attachEvent) {
					node.attachEvent("on" + eventType, method);
				} else {
					node["on" + eventType] = method;
				}
			}
		</script>

</head>
<body>
 <header>
 一季度的报表
 </header>
  <canvas id="myChart" width="800" height="400"></canvas>
    



</body>
</html>