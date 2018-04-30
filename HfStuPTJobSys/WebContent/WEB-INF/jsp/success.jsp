<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
 <script type="text/javascript" src="../asset/js/jquery-1.7.2.js"></script>
 <script type="text/javascript">
 	$(document).ready(function(){
 		
 		$('#btn1').click(function(){
 		
	 		$.ajax({
	 			type: 'post',
				url: '../../HfStuPTJobSys/user/abb',
				data: {
					"username" : 'aaa',
					"password": 'bbb'
				},
				success: function(data){
					alert(data.username);
					
				}
	 		});
 		});
 		
 	});
 </script>


<body>
	Success!!!
	aaaaaaaaaaaaaa${ptjob.business.name}
	
	
	<button id="btn1">onclick</button>
	
</body>
</html>