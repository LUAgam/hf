<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>

	<head>
	<link rel="shortcut icon" href="../asset/xjzsys.ico"/>
		<meta charset="utf-8">
		<title>大学生职位后台管理登录</title>
		<link rel="stylesheet" href="../asset/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="../asset/css/managerlogin.css" />
	</head>

	<body style="background-image:url(../asset/img/mainBg0.jpg);background-size: 100%;"><!--class="beg-login-bg"-->
		<div class="beg-login-box">
			<header>
				<h1>大学生职位后台管理</h1>
			</header>
			<div class="beg-login-main">
					<div class="layui-form-item">
						<label class="beg-login-icon">
                        <i class="layui-icon">&#xe612;</i>
                    </label>
						<input type="text" id='username' name="userName" placeholder="这里输入登录名" class="layui-input">
					</div>
					<div class="layui-form-item">
						<label class="beg-login-icon">
                        <i class="layui-icon">&#xe642;</i>
                    </label>
						<input type="password" id='password' name="password" placeholder="这里输入密码" class="layui-input">
					</div>
					<div class="layui-form-item">
						<div class="beg-pull-left beg-login-remember">
							<label>记住帐号？</label>
							<input type="checkbox" name="rememberMe" value="true" lay-skin="switch" checked title="记住帐号">
						</div>
						<div class="beg-pull-right">
							<button id='login' class="layui-btn layui-btn-primary" lay-submit lay-filter="login">
                            <i class="layui-icon">&#xe650;</i> 登录
                        </button>
						</div>
						<div class="beg-clear"></div>
					</div>
			</div>
			<footer>
				<p>chengzhiyuan www.onlyczy.com学职位</p>
			</footer>
		</div>
		<script type="text/javascript" src="../asset/js/jquery-2.1.4.min.js"></script>
		<script src="../asset/layer/layer.js" type="text/javascript" charset="utf-8"></script>
		<script>
		//layer.msg('用户名或密码错误');
			$(function(){
				$('#login').click(function(){
					var username = $('#username').val();
					var password = $('#password').val();
					
					$.ajax({
						url:'../user/managerlogin',
						type:'post',
						data:{
							'username':username,
							'password':password,
						},
						success:function(data){
							if(data.msg == 1){
								window.location.href = '${pageContext.request.contextPath}/page/manager';
							}else{
								layer.msg('用户名或密码错误');
							}
						},
					});
					
					
					
				})
				
				
			})
		
		
		</script>
	</body>

</html>