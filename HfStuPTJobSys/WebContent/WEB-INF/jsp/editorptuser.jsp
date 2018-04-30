<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>编辑资料</title>
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
	<div class="left_login" id="left_login" style="height: 200px; z-index: 9999;">
		<ul>
			<li><span class="glyphicon glyphicon-user"><span style="font-family: '微软雅黑'; color: gray;">管理中心</span></span></li>
			<li><a style="font-family: '微软雅黑'; color: rgb(253, 113, 28);" href="${pageContext.request.contextPath }/page/editorptuser">编辑简历</a></li>
			<li><a style="font-family: '微软雅黑'; color: rgb(243, 152, 0);" href="${pageContext.request.contextPath }/myapply/selectalljob">我的申请</a></li>
			<li><a style="font-family: '微软雅黑'; color: rgb(243, 152, 0);" href="${pageContext.request.contextPath }/page/mycollect">我的收藏</a></li>
			<li><a style="font-family: '微软雅黑'; color: rgb(243, 152, 0);" href="${pageContext.request.contextPath}/user/quit">退出</a></li>
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
					<li><span style="font-family: '微软雅黑'; font-size: 1.5em; color: rgb(225, 104, 30);">编辑简历</span></li>
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
					<li><a href="#" id="modify_a1" style="background-color: rgb(253, 129, 0); color: white;"><span class="glyphicon glyphicon-pencil"></span> 修改简历</a></li>
					<li><a href="#" id="modify_a2" style="background-color: rgb(243, 243, 243);"><span class="glyphicon glyphicon-picture"></span> 修改头像</a></li>
					<li><a href="#" id="modify_a3"><span class="glyphicon glyphicon-lock"></span> 修改密码</a></li>
					<li><a href="#" id="modify_a4" style="background-color: rgb(243, 243, 243);"><span class="glyphicon glyphicon-pencil"></span> 附件简历</a></li>
				</div>



			</div>
			<div class="editor_main_right_">
				<!------------------------------------11111111111-------------------------------->
				<div id="modify_ptusermsg">
					<div class="editor_main_right_top_">
						<div class="editor_main_right_top_main">
							<div class="editor_main_right_top_main_text">
								<div class="editor_main_right_top_main_left">
									&nbsp;&nbsp;修改简历资料<font color="#D91600">(注: 简历越完善，就越容易获得职位信息哟)</font>
								</div>
								<div class="editor_main_right_top_main_right">

									<button id="btn_yulan" type="button" class="btn btn-warning btn-xs">&nbsp;&nbsp;&nbsp;&nbsp;预 览&nbsp;&nbsp;&nbsp;&nbsp;</button>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<button id="btn_submit" type="button" class="btn btn-info btn-xs">&nbsp;&nbsp;&nbsp;&nbsp;提 交&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</div>
							</div>
						</div>
					</div>
					<div class="editor_main_right_top_main_text_text" id="input_msg">
						<div class="editor_main_right_top_main_input">
							姓名：<input id="ptuser_name" style="margin-left: 28px;" type="text" value="${ptuser.name}" />
						</div>
						<div class="editor_main_right_top_main_input">
							城市：
							<div id="city" style="margin-left: 70px; margin-top: -30px;">
								<select class="prov" id="prov"></select> <select class="city" id="cityname" disabled="disabled"></select> <select class="dist" id="dist" disabled="disabled"></select>
							</div>
						</div>
						<div class="editor_main_right_top_main_input">
							所在学校：<input id="ptuser_school" type="text" value="${ptuser.school}" />
						</div>
						<div class="editor_main_right_top_main_input">
							出生年月：<input id="birthday_year" type="text" style="width: 60px" />&nbsp;年 <input id="birthday_month" type="text" style="width: 40px" />&nbsp;月 <input id="birthday_day" type="text" style="width: 40px" />&nbsp;日 <input id='hidden_birthday' type="text" hidden="true" value="${ptuser.birthday}">
						</div>
						<div class="editor_main_right_top_main_input">
							身高：<input id="ptuser_height" style="margin-left: 28px; width: 60px;" type="text" value="${ptuser.height}" />&nbsp;cm
						</div>
						<div class="editor_main_right_top_main_input">
							手机号：<input id="ptuser_phone" style="margin-left: 15px;" type="text" value="${ptuser.phone}" />
						</div>
						<div class="editor_main_right_top_main_input">
							性别：<select id="ptuser_sex" style="margin-left: 28px;">
								<option>男</option>
								<option>女</option>
							</select>
						</div>
						<div class="editor_main_right_top_main_input">
							邮箱：<input id="ptuser_email" style="margin-left: 28px;" type="text" value="${ptuser.eamil}" />
						</div>
						<div class="editor_main_right_top_main_input">
							qq：<input id="ptuser_qq" style="margin-left: 38px;" type="text" value="${ptuser.qq}" />
						</div>
						<div class="editor_main_right_top_main_input" style="height: 100px; width: 600px;">
							工作经验：
							<textarea id="ptuser_experience" name="" style="width: 600px; height: 100px; margin-left: 70px; margin-top: -26px;">
								${ptuser.experience}
							</textarea>
						</div>
						<div class="editor_main_right_top_main_input" style="height: 100px; width: 600px;">
							相关简历：
							<textarea id="ptuser_resume" name="" style="width: 600px; height: 100px; margin-left: 70px; margin-top: -26px;">
								${ptuser.resume}
							</textarea>
						</div>
					</div>

				</div>



				<!------------------------------------222222-------------------------------------->
				<div id="modify_ptusermsg1" style="display: none;">
					<div class="editor_main_right_top_">
						<div class="editor_main_right_top_main">
							<div class="editor_main_right_top_main_text">

								<div class="editor_main_right_top_main_left" style="margin-top: 200px;">
									<img id='imgUrl_' alt="网络太差。。" src="${ptuser.imgurl}" style='width: 60px; height: 80px'>
								</div>
								<input type="text" id='img_hidden' hidden="true" value="${ptuser.imgurl}">
								<div class="editor_main_right_top_main_left">&nbsp;&nbsp;修改头像</div>
							</div>
						</div>
					</div>
					<div class="editor_main_right_top_main_text_text" id="input_msg">
						<div class="editor_main_right_top_main_input">
							<!-- <form action="../ptuser/modifyptuserimg" method="post" enctype="multipart/form-data"> -->
							`修改头像:<input type="file" id="imgurl_pic" name='imgurl_pic'>
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

				<div id="modify_ptusermsg3" style="display: none;">
					<form action="">
						<div class="editor_main_right_top_">
							<div class="editor_main_right_top_main">
								<div class="editor_main_right_top_main_text">
									<div class="editor_main_right_top_main_left">&nbsp;&nbsp;附件简历</div>
									<div class="" style='float: left; line-height: 40px; margin-left: 500px'>
										<span id='modify_password_msg' style='color: red;'></span>
									</div>
									<!-- <div class="editor_main_right_top_main_right" style="margin-right: 20px;">
										<button id="btn_modify_username" type="button" class="btn btn-info btn-xs">&nbsp;&nbsp;&nbsp;&nbsp;上 传&nbsp;&nbsp;&nbsp;&nbsp;</button>
									</div> -->
								</div>
							</div>
						</div>
						<div class="editor_main_right_top_main_text_text" id="input_msg">
							<br>
							<br>
							<br> <a href="../ptuser/download">${ptuser.fujian}</a> <br><br><input type="file" id="image" name='image'>
							<br>
							<br>
							<br>
							<button class='btn btn-info' id='submit_img1'>上 传</button>
						</div>
					</form>
				</div>

				<!-----------------------------4444444444------------------------------------------>
				<!-- <div class='_layer_ptusermsg_main'>
						<div class='_layer_ptusermsg_main_top'>
						
						</div>
						<div class='_layer_ptusermsg_main_center_name'>
						
						</div>
						 <div style='border-bottom: 1px solid gray;height:100px;'>
							<div class='_layer_ptusermsg_main_text_left'>
								<span style='color:rgb(247,132,58);margin-left:20px;'>个人资料</span>
								<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>
							</div>
							<div class='_layer_ptusermsg_main_text_right'><br/>
								年龄：<br/>
								身高：<br/>
								城市：<br/>
							</div>
						</div>
						<div style='border-bottom: 1px solid gray;height:60px;'>
							<div class='_layer_ptusermsg_main_text_left'style='height:60px;line-height: 60px'>
								<span style='color:rgb(247,132,58);margin-left:20px;'>联系方式</span>
								<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>
							</div>
							<div class='_layer_ptusermsg_main_text_right'style='height:60px;'>
								<div style='margin-top: 10px;'>
									手机：<br/>
									邮箱：
								</div>
							</div>
						</div>
						<div style='border-bottom: 1px solid gray;height:60px;'>
							<div class='_layer_ptusermsg_main_text_left' style='height:60px;line-height: 60px'>
								<span style='color:rgb(247,132,58);margin-left:20px;'>自我简介</span>
								<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>
							</div>
							<div class='_layer_ptusermsg_main_text_right'style='height:60px;line-height: 60px'>
							
							</div>
						</div>
						<div style='border-bottom: 1px solid gray;height:60px;'>
							<div class='_layer_ptusermsg_main_text_left' style='height:60px;line-height: 60px'>
								<span style='color:rgb(247,132,58);margin-left:20px;'>工作经验：</span>
								<span style='color:rgb(247,132,58);margin-left:-4px;'><span class='glyphicon glyphicon-record' ></span></span>
							</div>
							<div class='_layer_ptusermsg_main_text_right'style='height:60px;line-height: 60px'>
							</div>
						</div> 
						
					</div> -->









			</div>



		</div>

		<div class="webpage_center_main" style="border: 2px solid rgb(253, 129, 0); margin-top: 60px; height: 0px;"></div>

	</div>









</body>

<script type="text/javascript">
	$(function() {
		$('#submit_img').click(
				function() {
					/* var oldpassword = $('#oldusername').val(); */

					$.ajaxFileUpload({
						url : '../ptuser/modifyptuserimg', //用于文件上传的服务器端请求地址
						secureuri : false, //是否需要安全协议，一般设置为false
						fileElementId : 'imgurl_pic', //文件上传域的ID
						dataType : 'json', //返回值类型 一般设置为json
						success : function(data) //服务器成功响应处理函数
						{
							if (data.mag == 1) {
								var imgurl_src = '';
								$.ajax({
									url : "../ptuser/getptuserimg",
									type : 'post',
									success : function(data1) {
										imgurl_src = data1.imgUrl_;
										$('#imgUrl_').removeAttr("src");
										$('#imgUrl_').attr("src",
												"/upload/" + imgurl_src);
									}
								});
								layer.msg('修改成功', {
									icon : 1
								});
							} else {
								layer.msg('修改失败', {
									icon : 1
								});
							}
						},
						error : function(data, status, e)//服务器响应失败处理函数
						{
							layer.msg('修改失败，原因未知', {
								icon : 1
							});
						}
					})

				});
		
		$('#submit_img1').click(
				function() {
					/* var oldpassword = $('#oldusername').val(); */

					$.ajaxFileUpload({
						url : '../ptuser/modifyFujian', //用于文件上传的服务器端请求地址
						secureuri : false, //是否需要安全协议，一般设置为false
						fileElementId : 'image', //文件上传域的ID
						dataType : 'json', //返回值类型 一般设置为json
						success : function(data) //服务器成功响应处理函数
						{
							if (data.mag == 1) {
								var imgurl_src = '';
								$.ajax({
									url : "../ptuser/getFujian",
									type : 'post',
									success : function(data1) {
										imgurl_src = data1.imgUrl_;
										$('#imgUrl_').removeAttr("src");
										$('#imgUrl_').attr("src",
												"/upload/" + imgurl_src);
									}
								});
								layer.msg('修改成功', {
									icon : 1
								});
							} else {
								layer.msg('修改失败', {
									icon : 1
								});
							}
						},
						error : function(data, status, e)//服务器响应失败处理函数
						{
							layer.msg('修改失败，原因未知', {
								icon : 1
							});
						}
					})

				});

		$('#btn_yulan')
				.click(
						function() {

							var name = $('#ptuser_name').val();
							var phone = $('#ptuser_phone').val();
							var height = $('#ptuser_height').val();
							var school = $('#ptuser_school').val();
							var sex = $('#ptuser_sex').val();

							var eamil = $('#ptuser_email').val();
							var qq = $('#ptuser_qq').val();
							var experience = $('#ptuser_experience').val();
							var resume = $('#ptuser_resume').val();
							var year_ = $('#birthday_year').val();
							var birthday = $('#birthday_year').val() + "年"
									+ $('#birthday_month').val() + "月"
									+ $('#birthday_day').val() + "日";
							var city = $("#prov").val() + '-'
									+ $("#cityname").val() + '-'
									+ $("#dist").val();
							var city1 = $("#cityname").val() + '-'
									+ $("#dist").val();
							var age = '';
							if (year_ != '') {
								var thisyear = new Date().getFullYear();
								age = thisyear - year_;
								if (isNaN(age)) {
									age = '';
								}
							}
							layer
									.open({
										type : 1,
										closeBtn : 1, //不显示关闭按钮
										anim : 2,
										title : '',
										skin : 'layui-layer-rim', //加上边框
										shadeClose : true, //开启遮罩关闭
										area : [ '520px', '590px' ],
										content : "<div class='_layer_ptusermsg_main'>"
												+ "<div class='_layer_ptusermsg_main_top'>"
												+ "</div>"
												+ "<div class='_layer_ptusermsg_main_center_name'>"
												+ "<img style='width: 80px;height:80px;margin-left:200px' class='img-circle' src='"
												+ $('#img_hidden').val()
												+ "'></img></div>"
												+ "<div style='border-bottom: 1px solid gray;height:100px;'>"
												+ "<div class='_layer_ptusermsg_main_text_left'>"
												+ "<span style='color:rgb(247,132,58);margin-left:20px;'>个人资料</span>"
												+ "<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>"
												+ "</div>"
												+ "<div class='_layer_ptusermsg_main_text_right'><div style='margin-top:8px;'>"
												+ "年龄："
												+ age
												+ "<br/>"
												+ "身高："
												+ height
												+ "cm<br/>"
												+ "城市："
												+ city1
												+ "<br/>"
												+ "所在学校："
												+ school
												+ "<br/>"
												+ "</div></div>"
												+ "</div>"
												+ "<div style='border-bottom: 1px solid gray;height:60px;'>"
												+ "<div class='_layer_ptusermsg_main_text_left'style='height:60px;line-height: 60px'>"
												+ "<span style='color:rgb(247,132,58);margin-left:20px;'>联系方式</span>"
												+ "<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>"
												+ "</div>"
												+ "<div class='_layer_ptusermsg_main_text_right'style='height:60px;'>"
												+ "<div style='margin-top: 10px;'>"
												+ "手机："
												+ phone
												+ "<br/>"
												+ "邮箱："
												+ eamil
												+ ""
												+ "</div>"
												+ "</div>"
												+ "</div>"
												+ "<div style='border-bottom: 1px solid gray;height:60px;'>"
												+ "<div class='_layer_ptusermsg_main_text_left' style='height:60px;line-height: 60px'>"
												+ "<span style='color:rgb(247,132,58);margin-left:20px;'>自我简介:</span>"
												+ "<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>"
												+ "</div>"
												+ "<div class='_layer_ptusermsg_main_text_right'style='height:60px;line-height: 60px'>"
												+ resume
												+

												"</div>"
												+ "</div>"
												+ "<div style='border-bottom: 1px solid gray;height:60px;'>"
												+ "<div class='_layer_ptusermsg_main_text_left' style='height:60px;line-height: 60px'>"
												+ "<span style='color:rgb(247,132,58);margin-left:20px;'>工作经验:</span>"
												+ "<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>"
												+ "</div>"
												+ "<div class='_layer_ptusermsg_main_text_right'style='height:60px;line-height: 60px'>"
												+ experience
												+ "</div>"
												+ "</div></div>"
									});

						});
		$('#btn_submit').click(
				function() {

					var name = $('#ptuser_name').val();
					var phone = $('#ptuser_phone').val();
					var height = $('#ptuser_height').val();
					var school = $('#ptuser_school').val();
					var sex = $('#ptuser_sex').val();
					var eamil = $('#ptuser_email').val();
					var qq = $('#ptuser_qq').val();
					var experience = $('#ptuser_experience').val();
					var resume = $('#ptuser_resume').val();
					var biryear = $('#birthday_year').val();
					var birmon = $('#birthday_month').val();
					var birday = $('#birthday_day').val();
					var birthday = biryear + "年" + birmon + "月" + birday + "日";
					if ((biryear.trim() == "")
							|| ("" == birmon.trim() || ("" == birday.trim()))) {
						birthday = $('#hidden_birthday').val();
					}
					var city = $("#prov").val() + '-' + $("#cityname").val()
							+ '-' + $("#dist").val();

					/* 'name' : name,
					'phone' : phone,
					'height' : height,
					'school' : school,
					'sex' : sex,
					'eamil' : eamil,
					'qq' : qq,
					'experience' : experience,
					'resume' : resume,
					'birthday' : birthday,
					'city' : city, */
					$.ajax({
						url : "../ptuser/modifyptuser",
						type : 'post',
						data : {
							'name' : name,
							'phone' : phone,
							'height' : height,
							'school' : school,
							'sex' : sex,
							'eamil' : eamil,
							'qq' : qq,
							'experience' : experience,
							'resume' : resume,
							'birthday' : birthday,
							'city' : city,
						},
						success : function(data) {
							if (data.mag == '1')
								layer.msg('修改成功', {
									icon : 1
								});
							if (data.mag == '2')
								layer.msg('修改失败，错误未知', {
									icon : 1
								});
						}

					});

				});
		$('#btn_modify_username').click(function() {
			var oldpassword = $('#oldusername').val();
			var newpassword = $('#newusername').val();
			var renewpassword = $('#renewusername').val();
			var yanzhengma = $('#yanzhengma').val();

			if (newpassword == renewpassword) {
				$.ajax({

					type : 'GET',
					url : '../user/modifypassword',
					data : {
						'oldpassword' : oldpassword,
						'newpassword' : newpassword,
					},
					success : function(data) {
						$('#modify_password_msg').empty();
						if (data.msg == 1) {

							layer.msg('修改成功', {
								icon : 1
							});
						}
						if (data.msg == 2) {
							$('#modify_password_msg').html('密码输入错误');
						}
						if (data.msg == 3) {
							$('#modify_password_msg').html('修改密码错误');
						}

					}
				})
			} else {
				$('#modify_password_msg').html('两次输入密码不一致');
			}

		});

		//		$(document).on("click", "#modify_a", function(){
		$('#modify_a1').click(function() {
			$('#modify_ptusermsg').show();
			$('#modify_ptusermsg1').hide();
			$('#modify_ptusermsg2').hide();
			$('#modify_ptusermsg3').hide();
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
			$('#modify_ptusermsg3').hide();
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
			$('#modify_ptusermsg3').hide();
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
			$('#modify_ptusermsg').hide();
			$('#modify_ptusermsg1').hide();
			$('#modify_ptusermsg2').hide();
			$('#modify_ptusermsg3').show();
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

	})

	$(function() {
		$("#city").citySelect({
			prov : "安徽",
			city : "合肥",
			dist : "蜀山区"
		});
		$("#textarea_1").hover(function() {
			$("#textarea_1").css({
				"height" : "150px",
				"border" : "1px solid #1E9FFF",
			});
		}, function() {
			$("#textarea_1").css({
				"height" : "60px",
				"border" : "1px solid rgb(169,169,169)",
			});
		});
	})
</script>
</html>
