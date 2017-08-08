<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Insert title here</title>
<style type="text/css">
        .lightbox{
            position: fixed;
            top: 0px;
            left: 0px;
            height: 100%;
            width: 100%;
            z-index: 7;
            opacity: 0.3;
            display: block;
            background-color: rgb(0, 0, 0);
            display: none;
        }
        .pop,iframe{
            position: absolute;
            left: 50%;
            top:0;
            width: 893px;
            height: 100%;
            margin-left: -446.5px;
            z-index: 9;
        }
    </style>
    <script src="${pageContext.request.contextPath }/js/pdf/pdf.js" type="text/javascript"></script>
    <script type="text/javascript">
        function showPdf(isShow) {
            var state = "";
            if (isShow) {
                state = "block";
            } else {
                state = "none";
            }
            var pop = document.getElementById("pop");
            pop.style.display = state;
            var lightbox = document.getElementById("lightbox");
            lightbox.style.display = state;
        }
        function close() {
            showPdf(false);
        }
    </script>
</head>

<body>
   <ul>
	<li><a href="${fileUrl}" target="pdfContainer" onclick="showPdf(true)">0001_pdf</a></li>   
    </ul>
    <div class="lightbox" id="lightbox"></div>
    <div id="pop" class="pop" style="display: none;">
        <a href="javascript:close()" style="
            position: absolute;
            right: -90px;
            display: inline-block;
            width: 80px;
            height: 30px;
        " id="close">关闭</a>
        <iframe src="" frameborder="0" id="pdfContainer" name="pdfContainer"></iframe>
    </div>

</body>
</html>