<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>大学生职位平台登陆</title>
		<link rel="shortcut icon" href="../asset/xjzsys.ico"/>
		<link rel="stylesheet" type="text/css" href="../asset/css/webpage.css" />
		<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="../asset/css/register.css" />
		<link rel="stylesheet" type="text/css" href="../asset/layui/css/layui.css" />
		<!--<link rel="stylesheet" type="text/css" href="layer/skin/default/layer.css"/>-->
		<link rel="stylesheet" type="text/css" href="../asset/layer/skin/default/layer.css"/>
		<link rel="stylesheet" type="text/css" href="../asset/css/login.css"/>
		<script src="../asset/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/bootstrap-czy/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/layer/layer.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="http://open.51094.com/user/myscript/158f42754629cd.html"></script>
	</head>

	<body style="width: 1440px">
		<div class="webpage_top">
			<div class="webpage_top_center">
				<div class="webpage_top_center_left">
					城市
				</div>
				<div id="webpage_top_center_right" class="webpage_top_center_right">
					<a href="${pageContext.request.contextPath}/page/webpage">首页</font></a>
					<a href="#">申请合作</a>
					<a href="#">推广</a>
					<span id="" style="margin-left: -10px;margin-right: 10px;">|</span>
					<a href="#">登录</a>
				</div>
			</div>
		</div>
		<div class="webpage_center">
			<div class="webpage_center_search">
				<div class="webpage_center_search_left">
					<img style="width: 200px;height: 80px;" src="../asset/img/logo.png" />
				</div>
				<div id="webpage_center_search_center" style="margin-top:0px;" class="webpage_center_search_center">
					<ul>
						<li><span style="font-family: '微软雅黑';font-size: 1.5em;color: rgb(225,104,30);">用户登录</span></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="login_center">
			<div class="login_center_left">
				<img style="width: 100%;height: 400px" alt="" src="../asset/img/login_left.jpg">
			</div>
			<div class="login_center_right" id="login_center_right">
				<div class="login_center_right_top" id="login_center_right_top">
					<ul style="float: left;">
						<li><a id="login_type_lt">职位用户</a></li>
						<li><a id="login_type_bs">企业用户</a></li>
					</ul>
				</div>
				<div class="login_center_right_login">
					<div class="login_center_right_login_center">
					<span style="font-family: '微软雅黑';font-size: 1.1em;">
						手机号/邮箱:
					</span>
					 <input type="text" id="username" name="title" required  lay-verify="required" placeholder="请输入手机号/邮箱" autocomplete="off" class="layui-input">
						<div style="margin-top: 10px;">
							<span style="font-family: '微软雅黑';font-size: 1.1em;" >
							密码:
						</span>
						</div>
					 <input type="password" id="password"  name="title" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
					<div style="height: 10px;margin-top: 10px;"><span id="loginerror" style="margin-top: 100px;"></span> </div>
					<button  id="btn_login" style="width: 200px;background-color:rgb(252,150,5);margin-top: 20px;" class="layui-btn">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</button>
					<div style="margin-top: 10px;;">
						<a style="color: rgb(32,113,282);" href="../user/register">免费注册</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span id='thirdlogin'><span style="color: orange;">快速登陆：</span><span id="hzy_fast_login"></span></span>
					</div>
					
					</div>
					
				</div>
				
			</div>
		</div>
		<div class="register_center_foot">
			
		</div>
		
		
	</body>
	<script type="text/javascript">
		$(function(){
			var typetemp = 2;
			$('#thirdlogin').hide();
			$("#login_type_bs").css({
					"border-bottom":"4px solid rgb(252,150,5)",
					"background-color":"rgb(249,249,249)",
					"color":"rgb(252,150,5)"
			});
			
			$("#login_type_lt").click(function(){
				$("#login_type_bs").css({
					"border-bottom":"4px solid rgb(209,206,207)",
					"background-color":"rgb(238,238,238)",
					"color":"black"
				});
				$('#thirdlogin').show();
				$("#login_type_lt").css({
					"border-bottom":"4px solid rgb(252,150,5)",
					"background-color":"rgb(249,249,249)",
					"color":"rgb(252,150,5)"
				});
				typetemp = 1;
			})
			$("#login_type_bs").click(function(){
				$("#login_type_lt").css({
					"border-bottom":"4px solid rgb(209,206,207)",
					"background-color":"rgb(238,238,238)",
					"color":"black"
				});
				$('#thirdlogin').hide();
				$("#login_type_bs").css({
					"border-bottom":"4px solid rgb(252,150,5)",
					"background-color":"rgb(249,249,249)",
					"color":"rgb(252,150,5)"
				});
				typetemp = 2;
			})
			
			$("#btn_login").click(function(){
				var username = $("#username").val();
				var password = $("#password").val();
				if((username == '') && (password == '')){
					$("#loginerror").html("<font color='red'>请输入正确的信息,多谢配合</font>");
				}else{
					
					if(typetemp == 1){
						$.ajax({
	                        url:"../user/login",
	                        type:'post',
	                        data: {
	    						"username" : username,
	    						"password" : password,
	    						"state" : typetemp,
	    					},
	                        success:function(data){
	                        	var temp = data.msg;
	                        	if(temp == 1){
	                           	 window.location.href = "${pageContext.request.contextPath}/page/webpage"; 
	                           	}else{
	                        		$("#loginerror").html("<font color='red'>用户名或密码错误</font>");
	                        	}
	                           	
	                        	
	                        }

	                    }); 
						
					}
					if(typetemp == 2){
						
						$.ajax({
	                        url:"../user/login",
	                        type:'post',
	                        data: {
	    						"username" : username,
	    						"password" : password,
	    						"state" : typetemp,
	    					},
	                        success:function(data){
	                        	var temp = data.msg;
	                        	if(temp == 1){
	                        	 window.location.href = "${pageContext.request.contextPath}/page/webpage"; 
	                        	}else{
	                        		$("#loginerror").html("<font color='red'>用户名或密码错误</font>");
	                        	}
	                        	
	                        	
	                        }

	                    }); 
						
					}
					
					
				}
				
				
			})
			
			
			
			
			
			
			
		})
	</script>

</html>