	function checkbtns1() {
	
		var checks = $("#check1").val();
		if (checks.length <= 0) {
			$("#error1").html("不可为空").css("color", "red").css("fontSize", "12px");
			return false;
		}
		$("#error1").html("");
		return true;
	
	}
	function checkbtns2() {
	
		var checks = $("#check2").val();
		if (checks.length <= 0) {
			$("#error2").html("不可为空").css("color", "red").css("fontSize", "12px");
			return false;
		}
		$("#error2").html("");
		return true;
	
	}
	function checkbtns3() {
	
		var checks = $("#check3").val();
		if (checks.length <= 0) {
			$("#error3").html("不可为空").css("color", "red").css("fontSize", "12px");
			return false;
		}
		$("#error3").html("");
		return true;
	
	}
	function checkbtns4() {
		var subdate = $("#check4").val();
		var reg = /^((((19|20)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((19|20)\d{2})-(0?[469]|11)-(0?[1-9]|[12]\d|30))|(((19|20)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|((((19|20)([13579][26]|[2468][048]|0[48]))|(2000))-0?2-(0?[1-9]|[12]\d)))$/;
		if (!reg.test(subdate)) {
			$("#error4").css("color", "red").css("display", "inline").html("日期不合法")
					.css("fontSize", "12px");
			return false;
		}
		$("#error4").css("color", "#00BB00").css("display", "inline").html("日期合法")
				.css("fontSize", "12px");
		return true;
	}
	
	function checkbtns5() {
		var subdate = $("#check5").val();
		var reg = /^((((19|20)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((19|20)\d{2})-(0?[469]|11)-(0?[1-9]|[12]\d|30))|(((19|20)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|((((19|20)([13579][26]|[2468][048]|0[48]))|(2000))-0?2-(0?[1-9]|[12]\d)))$/;
		if (!reg.test(subdate)) {
			$("#error5").css("color", "red").css("display", "inline").html("日期不合法")
					.css("fontSize", "12px");
			return false;
		}
		$("#error5").css("color", "#00BB00").css("display", "inline").html("日期合法")
				.css("fontSize", "12px");
		return true;
	}
	
	function checkbtns6() {
		var checks = $("#check6").val();
		if (checks.length <= 0) {
			$("#error6").html("不可为空").css("color", "red").css("fontSize", "12px");
			return false;
		}
		$("#error6").html("");
		return true;
	}
	
/*	function checkdate() {
		var star =  $("#check4").val();
		var end = $("#check5").val();
		 if(star.length > 0 && end.length > 0){   
             var startDateTemp = star.split(" ");   
             var endDateTemp = end.split(" ");   
             var arrStartDate = startDateTemp[0].split("-");   
             var arrEndDate = endDateTemp[0].split("-");   
              var allStartDate = new Date(arrStartDate[0],arrStartDate[1],arrStartDate[2]);   
              var allEndDate = new Date(arrEndDate[0],arrEndDate[1],arrEndDate[2]);   
              if(allStartDate.getTime()>allEndDate.getTime()){   
            	  alert("开始日期不能大于结束日期");   
                  return false;   
              }   
	          }   
	          return true;   
		
	}*/
	
	function checkbtn() {
		if (checkbtns1() & checkbtns2() & checkbtns3() & checkbtns4() & checkbtns5() & checkbtns6()  ) {
			return true;
		}
		return false;
	
	}
	
	$(function() {
	
		$("#check1").blur(checkbtns1);
	
		$("#check1").focus(function() {
			$("#error1").html("");
		});
	
		$("#check2").blur(checkbtns2);
	
		$("#check2").focus(function() {
			$("#error2").html("");
		});
	
		$("#check3").blur(checkbtns3);
	
		$("#check3").focus(function() {
			$("#error3").html("");
		});
	
		$("#check4").blur(checkbtns4);
	
		$("#check4").focus(function() {
			$("#error4").html("");
		});
		$("#check5").blur(checkbtns5);
	
		$("#check5").focus(function() {
			$("#error5").html("");
		});
	
		$("#check6").blur(checkbtns6);
	
		$("#check6").focus(function() {
			$("#error6").html("");
		});
	});