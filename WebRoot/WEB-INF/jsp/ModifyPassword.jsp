<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TimeManagement System</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.default.css" type="text/css" /> 	
 <script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/resources/easyui/easyui-lang-en.js"></script>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath }/resources/easyui/default/easyui.css" />
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath }/resources/easyui/icon.css" />
		
<script type="text/javascript">
	$(function(){
		var flag= $("#flag");
		alert(flag);
		if(flag){
			alert("Password modification success");
		}else (flag){
			alert("Password modification failed");
		}
	});
</script>

<script type="text/javascript">
	$(function (){
		$("#submit").bind('click',function(){
			var password = document.getElementById("password").value;
			var oldpassword = $("#oldpassword").val();
			var newpassword = $("#newpassword").val();
			var compassword = $("#compassword").val();
			if(oldpassword != password){
				$("#span1").html("Please enter the login password");
 			return false;
			}else{
	 			$("#span1").html("");
	 		} 
			if(oldpassword == "" || oldpassword == null ){
	 			$("#span1").html("Input can not be empty！");
	 			return false;
	 		}else{
	 			$("#span1").html("");
	 		} 
			if(newpassword == "" || newpassword == null ){
	 			$("#span2").html("Input can not be empty！");
	 			return false;
	 		}else{
	 			$("#span2").html("");
	 		} 
			if(compassword == "" || compassword == null ){
	 			$("#span3").html("Input can not be empty！");
	 			return false;
	 		}else{
	 			$("#span3").html("");
	 		} 
			if(newpassword != compassword){
				$("#span3").html("Newpassword Must be consistent！");
				return false;
 			}else{
	 			$("#span3").html("");
 			}
	});
		$('#subform').form('reset');//form表單重置
});

	
</script>

</head>
<style>
.body{
 	float: center;
    width:740px;
    margin-left: 220px;
    padding-top: 5px;
    text-align: right;
    font-size: 14px;
}
.ui-label {
    float: center;
    width: 410px;
    margin-left: -220px;
    padding-top: 5px;
    text-align: right;
    font-size: 14px;
}

.ui-input {
    width: 190px;
    padding: 8px 9px;
    line-height: 18px;
    border: 1.5px solid #ddd;
    border-color: #009FCC;
    font-size: 12px;
}

.ui-form-item {
    padding: 3px 5px 20px 100px;
    zoom: 1;
    text-align:center; 
}

.ui-button-lorange {
    line-height: 36px;
    height: 36px;
    min-width: 85px;
    border-color: #009FCC;
 	border: 1px solid #468cf5;
    background-color: #468cf5;

}

.top{
 	width:100%; 
 	height:100px;
    text-align:center;
	font-size:22px
}
 
</style>
<body>

<form action="${pageContext.request.contextPath }/changePassword.action" method="post" id="subform" target="_top">
 <!--        <input name="_tb_token_" value="eeMj3c4cXIi6eqcSA9mx" type="hidden">
    <input name="action" value="password_action" type="hidden">
    <input name="event_submit_do_modify_password" value="notNull" type="hidden"> -->
   <div class="contenttitle2">
	  <h2>Modify Password</h2>
   </div>
    <div id="pass-form">
        <div class="ui-form-item"align="center">
            <label class="ui-label">Current login password：</label>
            <input class="ui-input"  type="password"name="oldpassword" id="oldpassword"/>
            <input type="hidden" id="password"  value="${userLogin.password}"/> 
              <input type="hidden" id="email" name="email"  value="${userLogin.email}"/>   
            <div></div> 
            <span id="span1" style="color:red;"></span> 
        </div>
        <div class="ui-form-item"align="center">
            <label class="ui-label">Modify login password：</label>
            <input  class="ui-input" type="password"name="newpassword" id="newpassword"/>
             <div></div>  
            <span id="span2" style="color:red;"></span>              
        </div>
        <div class="ui-form-item"align="center">
            <label class="ui-label">Confirm login password：</label>
            <input class="ui-input"type="password"name="compassword" id="compassword"/> 
             <div>
              <span id="span3" style="color:red;"></span>     
        </div>
    </div>
        <div class=".ui-button-lorange"align="center">
            <input value="SUBMIT" class="ui-button ui-button-lorange" type="submit" id="submit"/>
            <input type="hidden" id="flag" name="flag"  value="${flag}"/> 
            <input value="RESET" class="ui-button ui-button-lorange" type="reset" id="reset"> 
        </div>
        </div>
</form>     
</body>
</html>