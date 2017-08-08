<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>TimeManagement System</title>
</head>
<frameset rows="115,*" frameborder="no" border="0" framespacing="0">
	 <frame src="${pageContext.request.contextPath}/Top.jsp"  />	
		 <frameset  cols="270,*" frameborder="no" border="0" framespacing="0"  >
		      <frame src="${pageContext.request.contextPath}/managerlogin.jsp" marginwidth="0" marginheight="0"/>
	          <frame src="${pageContext.request.contextPath}/main.action" name="Main" scrolling="auto"/>		
         </frameset>
</frameset>
</html>