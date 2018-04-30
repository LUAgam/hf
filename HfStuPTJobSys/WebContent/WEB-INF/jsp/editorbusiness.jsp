<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>编辑企业信息</title>
</head>
<link rel="shortcut icon" href="../asset/xjzsys.ico" />
<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="../asset/css/webpage.css" />
<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../asset/css/paging.css" />
<link rel="stylesheet" type="text/css" href="../asset/css/jquery.slideBox.css" />
<link rel="stylesheet" type="text/css" href="../asset/css/edituser.css" />

<script src="../asset/js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../asset/js/query.js" type="text/javascript" charset="utf-8"></script>
<script src="../asset/js/paging.js" type="text/javascript" charset="utf-8"></script>
<script src="../asset/layer/layer.js" type="text/javascript" charset="utf-8"></script>
<script src="../asset/bootstrap-czy/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
<script src="../asset/js/jquery.slideBox.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../asset/js/jquery.cityselect.js" type="text/javascript" charset="utf-8"></script>
<script src="../asset/js/ajaxfileupload.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
a {
	font-family: "微软雅黑";
}

#webpage_center_main_left_id a {
	font-family: "微软雅黑";
	font-size: 1.1em;
}

.css_quxiaoshoucang {
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
}

#cancel_collect a:hover {
	color: white;
}

#table01 td {
	
}
</style>


<body style="width: 1440px">
	<div class="left_login" id="left_login" style="height: 280px; z-index: 9999;">
		<ul>
			<li><span class="glyphicon glyphicon-user"><span style="font-family: '微软雅黑'; color: gray;">管理中心</span></span></li>
			<li><a style="font-family: '微软雅黑'; color: rgb(243, 152, 0);" href="${pageContext.request.contextPath }/page/jobrelease">发布职位</a></li>
			<li><a style="font-family: '微软雅黑'; color: rgb(243, 152, 0);" href="${pageContext.request.contextPath }/jobverify/myrelease">我的发布</a></li>
			<li><a style="font-family: '微软雅黑'; color: rgb(243, 152, 0);" href="${pageContext.request.contextPath }/page/editorbusiness">设置中心</a></li>
			<%-- <li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/increment/increment">增值服务</a></li> --%>
			<%-- <li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/accountrecord/recharge">我的钱包</a></li> --%>
			<li><a style="font-family: '微软雅黑'; color: rgb(243, 152, 0);" href="${pageContext.request.contextPath }/user/quit">退出</a></li>
		</ul>
	</div>
	<div class="webpage_top">
		<div class="webpage_top_center">
			<div class="webpage_top_center_left">
				<span style="font-family: '微软雅黑'; font-size: 1.1em; color: red;">合肥</span> <span><a href="" style="font-family: '微软雅黑'; color: gray;">[切换城市]</a></span>
			</div>
			<div id="webpage_top_center_right" class="webpage_top_center_right">
				<a href="${pageContext.request.contextPath}/page/webpage" style="">首页</a> <a href="#" style="">申请合作</a> <a href="#" style="">推广</a> <span id="" style="margin-left: -10px; margin-right: 10px;">|</span>
				<c:if test="${user.state != null}">

					<c:if test="${user.ptuser != null}">
						<c:if test="${user.ptuser.name != null}">
							<a href="#" style="color: 'rgb(243,46,0)';">${user.ptuser.name}</a>
						</c:if>
						<c:if test="${user.ptuser.name == null}">
							<a href="#" style="color: 'rgb(243,46,0)';">尊敬的用户</a>
						</c:if>
					</c:if>
					<c:if test="${user.business != null}">
						<c:if test="${user.business.name != null}">
							<a href="#" style="color: 'rgb(243,46,0)';">${user.business.name}</a>
						</c:if>
						<c:if test="${user.business.name == null}">
							<a href="#" style="color: 'rgb(243,46,0)';">尊敬的商家</a>
						</c:if>
					</c:if>
					<a href="${pageContext.request.contextPath}/user/quit" style="">退出</a>
				</c:if>
				<c:if test="${user.state == null}">
					<a href="${pageContext.request.contextPath }/page/login" style="">登录</a>
				</c:if>
			</div>
		</div>
	</div>

	<div class="webpage_center">
		<div class="webpage_center_search">
			<div class="webpage_center_search_left">
				<img style="width: 200px; height: 80px;" src="../asset/img/logo.png" />
			</div>
			<div id="webpage_center_search_center" style="margin-top: 0px; margin-left: -10px" class="webpage_center_search_center">
				<ul>
					<li><span style="font-family: '微软雅黑'; font-size: 1.5em; color: rgb(225, 104, 30);">编辑信息</span></li>
				</ul>
			</div>
			<!-- <div class="webpage_center_search_center">
					<div class="col-sm-9" style="margin-left: 40px;">
						<input type="text" class="form-control" placeholder="请输入搜索的内容" aria-describedby="basic-addon2">
					</div>
					<button type="button" style="width: 60px;margin-left: -15px;" class="btn btn-warning col-sm-2">&nbsp;搜索&nbsp;</button>
				</div>
				<div id="webpage_center_search_right" class="webpage_center_search_right">
					<button type="button" class="btn btn-danger" style="background-color: rgb(253,113,28);">
						<span class="glyphicon glyphicon-pencil"></span>
						<span style="font-size: 1.2em;">编辑简历</span></button>
				</div> -->
		</div>

		<div class="webpage_center_main" style="border: 0px solid black; margin-top: 60px; height: 0px;">
			<div class="editor_main_left_">
				<div class="editor_main_left_top">
					<div style="float: left; height: 28px; width: 30%; border-bottom: 3px solid rgb(175, 175, 175);"></div>
					<div style="float: left; width: 40%; line-height: 56px; text-align: center; color: #000000;">账号设置</div>
					<div style="float: right; height: 28px; width: 30%; border-bottom: 3px solid rgb(175, 175, 175);"></div>
				</div>
				<div class="editor_main_left_li">
					<li><a href="#" id="modify_a1" style="background-color: rgb(253, 129, 0); color: white;"><span class="glyphicon glyphicon-pencil"></span> 修改资料</a></li>
					<li><a href="#" id="modify_a2" style="background-color: rgb(243, 243, 243);"><span class="glyphicon glyphicon-picture"></span> 修改头像</a></li>
					<li><a href="#" id="modify_a3"><span class="glyphicon glyphicon-lock"></span> 修改密码</a></li>
					<li><a href="#" id="modify_a4" style="background-color: rgb(243, 243, 243);"><span class="glyphicon glyphicon-pencil"></span> 修改资料</a></li>
				</div>



			</div>
			<div class="editor_main_right_">
				<!------------------------------------11111111111-------------------------------->
				<div id="modify_ptusermsg">
					<form id="modifybusiness" action="../business/modifybusinessmsg" method="post" enctype="multipart/form-data">
					<div class="editor_main_right_top_">
						<div class="editor_main_right_top_main">
							<div class="editor_main_right_top_main_text">
								<div class="editor_main_right_top_main_left">
									&nbsp;&nbsp;修改公司信息<font color="#D91600">(注:公司信息齐全有利于招聘)</font>
								</div>
								<div class="editor_main_right_top_main_right">

									<button id="btn_yulan" type="button" class="btn btn-warning btn-xs">&nbsp;&nbsp;&nbsp;&nbsp;预 览&nbsp;&nbsp;&nbsp;&nbsp;</button>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<button id="btn_submit1" type="submit" class="btn btn-info btn-xs">&nbsp;&nbsp;&nbsp;&nbsp;提 交&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</div>
							</div>
						</div>
					</div>
						<div class="editor_main_right_top_main_text_text" id="input_msg">
							<div class="editor_main_right_top_main_input">
								姓名：<input id="business_name" name="name" style="margin-left: 28px;" type="text" value="${business.name}" />
							</div>
							<div class="editor_main_right_top_main_input">
								公司性质：<input id="business_nature" name="nature" style="margin-left: 0px;" type="text" value="${business.nature}" />
							</div>
							<div class="editor_main_right_top_main_input">
								所属行业：<input id="business_industry" name="industry" style="margin-left: 0px;" type="text" value="${business.industry}" />
							</div>
							<div class="editor_main_right_top_main_input">
								公司规模：<input id="business_scale" name="scale" style="margin-left: 0px;" type="text" value="${business.scale}" />
							</div>
							<div class="editor_main_right_top_main_input">
								邮箱：<input id="business_email" name="email" style="margin-left: 28px;" type="text" value="${business.email}" />
							</div>
							<div class="editor_main_right_top_main_input">
								联系人：<input id="business_contacts" name="contacts" style="margin-left: 14px;" type="text" value="${business.contacts}" />
							</div>
							<div class="editor_main_right_top_main_input">
								联系电话：<input id="business_phone" name="phone" style="margin-left: 0px;" type="text" value="${business.phone}" />
							</div>
							<div class="editor_main_right_top_main_input">
								所在城市：<input id="business_city" name="city" style="margin-left: 0px;" type="text" value="${business.city}" />
							</div>
							<div class="editor_main_right_top_main_input">
								营业执照：
								<input id="license" name="licenseForm" class="layui-input" style="margin-left: 0px;" type="file" value="${business.license}"/>
							</div>
							<div class="editor_main_right_top_main_input">
								公司地址：
								<textarea id="business_address" name="address" style="width: 600px; height: 100px; margin-left: -2px; margin-top: 26px;">
								${business.address}
							</textarea>

							</div>
							<div class="editor_main_right_top_main_input">
								公司简介：
								<textarea id="business_introduction" name="introduction" style="width: 600px; height: 100px; margin-left: -2px; margin-top: 26px;">
								${business.introduction}
							</textarea>
							</div>
						</div>
					</form>
					<!-- <div class="editor_main_right_top_main_input">
							城市：
							<div id="city" style="margin-left: 70px;margin-top: -30px;">
								<select class="prov" id="prov"></select>
								<select class="city" id="cityname" disabled="disabled"></select>
								<select class="dist" id="dist" disabled="disabled"></select>
						 	</div>
						</div> -->
				</div>

			</div>



			<!------------------------------------222222-------------------------------------->
			<div id="modify_ptusermsg1" style="display: none;">
				<div class="editor_main_right_top_">
					<div class="editor_main_right_top_main">
						<div class="editor_main_right_top_main_text">

							<div class="editor_main_right_top_main_left" style="margin-top: 200px;"></div>
							<div class="editor_main_right_top_main_left">&nbsp;&nbsp;修改图标</div>
						</div>
					</div>
				</div>
				<div class="editor_main_right_top_main_text_text" id="input_msg">
					<div class="editor_main_right_top_main_input">
						<!-- <form action="../ptuser/modifyptuserimg" method="post" enctype="multipart/form-data"> -->
						`修改图标:<input type="file" id="imgurl_pic" name='imgurl_pic'>
						<button class='btn btn-info' id='submit_img'>修改</button>
						<!-- <button class='btn btn-info' type="submit">修改</button> -->
						<!-- </form> -->
					</div>
				</div>

			</div>

			<!--------------------------------------33333333----------------------------------------------------->

			<div id="modify_ptusermsg2" style="display: none;">
				<div class="editor_main_right_top_">
					<div class="editor_main_right_top_main">
						<div class="editor_main_right_top_main_text">
							<div class="editor_main_right_top_main_left">&nbsp;&nbsp;修改密码</div>
							<div class="" style='float: left; line-height: 40px; margin-left: 500px'>
								<span id='modify_password_msg' style='color: red;'></span>
							</div>
							<div class="editor_main_right_top_main_right" style="margin-right: 20px;">
								<button id="btn_modify_username" type="button" class="btn btn-info btn-xs">&nbsp;&nbsp;&nbsp;&nbsp;提 交&nbsp;&nbsp;&nbsp;&nbsp;</button>
							</div>
						</div>
					</div>
				</div>
				<div class="editor_main_right_top_main_text_text" id="input_msg">
					<div class="editor_main_right_top_main_input">
						旧密码：<input id="oldusername" style="margin-left: 18px;" type="password" />
					</div>
					<div class="editor_main_right_top_main_input">
						新密码：<input id="newusername" style="margin-left: 18px;" type="password" />
					</div>
					<div class="editor_main_right_top_main_input">
						确认密码：<input id="renewusername" style="margin-left: 5px;" type="password" />
					</div>
					<div class="editor_main_right_top_main_input">
						验证码：<input id="yanzhengma" style="margin-left: 18px;" type="text" />
					</div>

				</div>
			</div>

			<!-----------------------------4444444444------------------------------------------>









		</div>



	</div>

	<div class="webpage_center_main" style="border: 2px solid rgb(253, 129, 0); margin-top: 60px; height: 0px;"></div>

	</div>






<input type="text" id='img_hidden' hidden="true" value="${business.license}">


</body>

<script type="text/javascript">
	$(function() {
		$('#btn_submit').click(function() {

			/* $('#modifybusiness').submit(); */
			/* $.ajax({
				url:"../business/modifybusinessmsg",
			    type:'post',
			    data:$('#modifybusiness').serialize(),
			    success:function(data){
			    	if(data.msg == '1'){
			    		layer.msg('修改成功', {icon: 1});
			    	
			    	}
			    }
			}) */

		})

		//		$(document).on("click", "#modify_a", function(){
		$('#modify_a1').click(function() {
			$('#modify_ptusermsg').show();
			$('#modify_ptusermsg1').hide();
			$('#modify_ptusermsg2').hide();
			$('#modify_a1').css({
				'background-color' : 'rgb(253,129,0)',
				'color' : 'white'
			});
			$('#modify_a2').css({
				'background-color' : 'rgb(243,243,243)',
				'color' : 'black'
			});
			$('#modify_a3').css({
				'background-color' : 'rgb(229,229,229)',
				'color' : 'black'
			});
			$('#modify_a4').css({
				'background-color' : 'rgb(243,243,243)',
				'color' : 'black'
			});
		})
		$('#modify_a2').click(function() {
			$('#modify_ptusermsg').hide();
			$('#modify_ptusermsg1').show();
			$('#modify_ptusermsg2').hide();
			$('#modify_a1').css({
				'background-color' : 'rgb(229,229,229)',
				'color' : 'black'
			});
			$('#modify_a2').css({
				'background-color' : 'rgb(253,129,0)',
				'color' : 'white'
			});
			$('#modify_a3').css({
				'background-color' : 'rgb(229,229,229)',
				'color' : 'black'
			});
			$('#modify_a4').css({
				'background-color' : 'rgb(243,243,243)',
				'color' : 'black'
			});
		})
		$('#modify_a3').click(function() {
			$('#modify_ptusermsg').hide();
			$('#modify_ptusermsg1').hide();
			$('#modify_ptusermsg2').show();
			$('#modify_a1').css({
				'background-color' : 'rgb(229,229,229)',
				'color' : 'black'
			});
			$('#modify_a2').css({
				'background-color' : 'rgb(243,243,243)',
				'color' : 'black'
			});
			$('#modify_a3').css({
				'background-color' : 'rgb(253,129,0)',
				'color' : 'white'
			});
			$('#modify_a4').css({
				'background-color' : 'rgb(243,243,243)',
				'color' : 'black'
			});
		})
		$('#modify_a4').click(function() {
			$('#modify_a1').css({
				'background-color' : 'rgb(229,229,229)',
				'color' : 'black'
			});
			$('#modify_a2').css({
				'background-color' : 'rgb(243,243,243)',
				'color' : 'black'
			});
			$('#modify_a3').css({
				'background-color' : 'rgb(229,229,229)',
				'color' : 'black'
			});
			$('#modify_a4').css({
				'background-color' : 'rgb(253,129,0)',
				'color' : 'white'
			});
		})
		
$('#btn_yulan').click(function(){
			
			var text1 = $('#business_name').val();
			var text2 = $('#business_nature').val();
			var text3 = $('#business_industry').val();
			var text4 = $('#business_scale').val();
			var text5 = $('#business_email').val();
			var text6 = $('#business_contacts').val();
			var text7 = $('#business_phone').val();
			var text8 = $('#business_city').val();
			var text9 = $('#business_address').val();
			var text10 = $('#business_introduction').val();
			layer.open({
				  type: 1,
				  closeBtn: 1, //不显示关闭按钮
				  anim: 2,
				  title: '',
				  skin: 'layui-layer-rim', //加上边框
				  shadeClose: true, //开启遮罩关闭
				  area: ['520px', '590px'],
				  content: "<div class='_layer_ptusermsg_main'>"+
						"<div class='_layer_ptusermsg_main_top'>"+
					"</div>"+
					"<div class='_layer_ptusermsg_main_center_name'>"+
					"<img style='width: 80px;height:80px;margin-left:200px' class='img-circle' src='/upload/"+$('#img_hidden1').val()+"'></img></div>"+
				  "<div style='border-bottom: 1px solid gray;height:100px;'>"+
						"<div class='_layer_ptusermsg_main_text_left'>"+
					"<span style='color:rgb(247,132,58);margin-left:20px;'>公司信息</span>"+
					"<span style='color:rgb(247,132,58);margin-left:10px;height:250px;'><span class='glyphicon glyphicon-record' ></span></span>"+
				"</div>"+
				"<div class='_layer_ptusermsg_main_text_right'><div style='margin-top:8px;'>"+
					"名称："+text1+"<br/>"+
					"公司性质："+text2+"cm<br/>"+
					"所属行业："+text3+"<br/>"+
					"公司规模："+text4+"<br/>"+
				"</div></div>"+
			"</div>"+
			"<div style='border-bottom: 1px solid gray;height:60px;'>"+
			"<div class='_layer_ptusermsg_main_text_left' style='height:60px;line-height: 60px'>"+
				"<span style='color:rgb(247,132,58);margin-left:20px;'>邮箱：</span>"+
				"<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>"+
			"</div>"+
			"<div class='_layer_ptusermsg_main_text_right'style='height:60px;line-height: 60px'>"+
			text5+
			"</div>"+
		"</div>"+
		"<div style='border-bottom: 1px solid gray;height:60px;'>"+
		"<div class='_layer_ptusermsg_main_text_left' style='height:60px;line-height: 60px'>"+
			"<span style='color:rgb(247,132,58);margin-left:20px;'>联系人：</span>"+
			"<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>"+
		"</div>"+
		"<div class='_layer_ptusermsg_main_text_right'style='height:60px;line-height: 60px'>"+text6+
		
		"</div>"+
	"</div>"+
	"<div style='border-bottom: 1px solid gray;height:60px;'>"+
	"<div class='_layer_ptusermsg_main_text_left' style='height:60px;line-height: 60px'>"+
		"<span style='color:rgb(247,132,58);margin-left:20px;'>联系电话：</span>"+
		"<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>"+
	"</div>"+
	"<div class='_layer_ptusermsg_main_text_right'style='height:60px;line-height: 60px'>"+text7+
	
	"</div>"+
"</div>"+
"<div style='border-bottom: 1px solid gray;height:60px;'>"+
"<div class='_layer_ptusermsg_main_text_left' style='height:60px;line-height: 60px'>"+
	"<span style='color:rgb(247,132,58);margin-left:20px;'>所在城市：</span>"+
	"<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>"+
"</div>"+
"<div class='_layer_ptusermsg_main_text_right'style='height:60px;line-height: 60px'>"+text8+

"</div>"+
"</div>"+
			"<div style='border-bottom: 1px solid gray;height:60px;'>"+
				"<div class='_layer_ptusermsg_main_text_left' style='height:60px;line-height: 60px'>"+
					"<span style='color:rgb(247,132,58);margin-left:20px;'>公司地址:</span>"+
					"<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>"+
				"</div>"+
				"<div class='_layer_ptusermsg_main_text_right'style='height:60px;line-height: 60px'>"+text9+
				
				"</div>"+
			"</div>"+
			"<div style='border-bottom: 1px solid gray;height:60px;'>"+
				"<div class='_layer_ptusermsg_main_text_left' style='height:60px;line-height: 60px'>"+
					"<span style='color:rgb(247,132,58);margin-left:20px;'>公司简介:</span>"+
					"<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>"+
				"</div>"+
				"<div class='_layer_ptusermsg_main_text_right'style='height:60px;line-height: 60px'>"+text10+
				"</div>"+
			"</div>"+
			"<div style='border-bottom: 1px solid gray;height:60px;'>"+
			"<div class='_layer_ptusermsg_main_text_left' style='height:60px;line-height: 60px'>"+
				"<span style='color:rgb(247,132,58);margin-left:20px;'>营业执照:</span>"+
				"<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>"+
			"</div>"+
			"<div class='_layer_ptusermsg_main_text_right'style='height:60px;line-height: 60px'>"+
			"<img style='height:60px;' class='img-circle' src='/upload/"+$('#img_hidden').val()+"'></img>"+
			"</div>"+
		"</div></div>"
				});
			
			
			
		});

	})
</script>
</html>
