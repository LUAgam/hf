<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>大学生职位平台</title>
		<link rel="shortcut icon" href="../asset/xjzsys.ico"/>
		<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap-theme.css" />
		<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="../asset/css/paging.css"/>
		<link rel="stylesheet" type="text/css" href="../asset/css/webpage.css" />
		<link rel="stylesheet" type="text/css" href="../asset/css/jquery.slideBox.css"/>
		<script src="../asset/js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/query.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/paging.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/bootstrap-czy/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/pageptjob.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/jquery.slideBox.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/layer/layer.js" type="text/javascript" charset="utf-8"></script>
	</head>

	<script type="text/javascript">
	
		
	
	</script>
	
	<body style="width: 1440px">
		<c:if test="${user.state == '1'}">
			<div class="left_login" id="left_login" style="height:240px;z-index: 9999;">
				<ul>
					<li><span class="glyphicon glyphicon-user"><span style="font-family: '微软雅黑';color: gray;">管理中心</span></span></li>
					<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/page/editorptuser">编辑简历</a></li>
					<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/myapply/selectalljob">我的申请</a></li>
					<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/page/mycollect">我的收藏</a></li>
					<li><a id='messagelayer' style="font-family: '微软雅黑';color: rgb(243,152,0);" href="javascript:void(0);">我的信息<span class='badge' id='msgnotreadcount' style='background-color: red;'></span></a></li>
					<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/user/quit">退出</a></li>
				</ul>
			</div>
		</c:if>
		<input id='userstate' hidden="true" value="${user.state}">
		<c:if test="${user.state == '2'}">
			<div class="left_login" id="left_login" style="height:280px;z-index: 9999;">
				<ul>
					<li><span class="glyphicon glyphicon-user"><span style="font-family: '微软雅黑';color: gray;">管理中心</span></span></li>
					<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/page/jobrelease">发布职位</a></li>
					<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/jobverify/myrelease">我的发布</a></li>
					<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/page/editorbusiness">设置中心</a></li>
					<%-- <li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/increment/increment">增值服务</a></li>
					<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/accountrecord/recharge">我的钱包</a></li> --%>
					<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/user/quit">退出</a></li>
				</ul>
			</div>
		</c:if>
		<c:if test="${user.state == null}">
			<div class="left_login" id="left_login">
				<ul>
					<li><span class="glyphicon glyphicon-user"><span style="font-family: '微软雅黑';color: gray;">管理中心</span></span></li>
					<li><a style="font-family: '微软雅黑';color: rgb(253,113,28);" href="${pageContext.request.contextPath }/page/login">登录</a></li>
					<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/page/register">注册</a></li>
				</ul>
			</div>
		</c:if>
		<div class="webpage_top">
			<div class="webpage_top_center">
				<div class="webpage_top_center_left">
					<span style="font-family: '微软雅黑';font-size: 1.1em;color: red;">合肥</span>
					<span><a href="" style="font-family: '微软雅黑';color: gray;">[切换城市]</a></span>
				</div>
				<div id="webpage_top_center_right" class="webpage_top_center_right">
					<a href="${pageContext.request.contextPath}/page/webpage" style="">首页</font></a>
					<a href="#" style="">申请合作</a>
					<a href="#" style="">推广</a>
					<span id="" style="margin-left: -10px;margin-right: 10px;">|</span>
					<c:if test="${user.state != null}">
						<c:if test="${user.ptuser != null}">
							<c:if test="${user.ptuser.name != null}">
								<a href="#" style="color:'rgb(243,46,0)';">${user.ptuser.name}</a>
							</c:if>
							 <c:if test="${user.ptuser.name == null}">
								<a href="#" style="color:'rgb(243,46,0)';">尊敬的用户</a>
							</c:if>
						</c:if>
						<c:if test="${user.business != null}">
							<c:if test="${user.business.name != null}">
								<a href="#" style="color:'rgb(243,46,0)';">${user.business.name}</a>
							</c:if>
							<c:if test="${user.business.name == null}">
								<a href="#" style="color:'rgb(243,46,0)';">尊敬的商家</a>
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
					<img style="width: 200px;height: 80px;" src="../asset/img/logo.png" />
				</div>
				<div class="webpage_center_search_center">
					<div class="col-sm-9" style="margin-left: 40px;">
						<input id='searchtxt' type="text" class="form-control" placeholder="请输入搜索的内容" aria-describedby="basic-addon2">
					</div>
					<button id='searchtxtbtn' type="button" style="width: 60px;margin-left: -15px;" class="btn btn-warning col-sm-2">&nbsp;搜索&nbsp;</button>
				</div>
				<c:if test="${user.state == '1'}">
					<div id="webpage_center_search_right" class="webpage_center_search_right">
					<button type="button" class="btn btn-danger" style="background-color: rgb(253,113,28);"><span class="glyphicon glyphicon-pencil">&nbsp;</span><span style="font-size: 1.2em;">发布职位</span></button>
					</div>
				</c:if>
				<c:if test="${user.state != '1'}">
					<div id="webpage_center_search_right" class="webpage_center_search_right">
						<button type="button" class="btn btn-success" style="background-color: rgb(101,176,21);"><span style="font-size: 1.2em;">发布快捷职位</span></button>
						<button type="button" class="btn btn-warning" style="background-color: rgb(243,152,0);"><span style="font-size: 1.2em;">发布任务</span></button>
						<button id='release_' type="button" class="btn btn-danger" style="background-color: rgb(253,113,28);"><span style="font-size: 1.2em;">发布职位</span></button>
					</div>
				</c:if>
			</div>
			<div class="webpage_center_pic">
				<div id="slidepic" class="slideBox">
				  <ul class="items">
				    <li><a href="" ><img src="../asset/img/1.jpg"></a></li>
				    <li><a href="" ><img src="../asset/img/2.jpg"></a></li>
				    <li><a href="" ><img src="../asset/img/3.jpg"></a></li>
				    <li><a href="" ><img src="../asset/img/4.jpg"></a></li>
				    <li><a href="" ><img src="../asset/img/5.jpg"></a></li>
				  </ul>
				</div>
			</div>
			<div class="webpage_center_citywork" style="margin-top:35px;">
				<span id="">
					<a href="" style="font-size: 1em;font-family: '微软雅黑';">大学生职位平台></a>
				</span>
				<span id="" style="font-family: '微软雅黑';color: gray;">
					合肥职位
				</span>
			</div>
			<div class="webpage_center_citywork">
				<div class="webpage_center_citywork_left">
					<span style="font-family: '微软雅黑';"><a style="color: #000000" href="#">最新职位</a></span>
				</div>
				<div class="webpage_center_citywork_right">

				</div>
			</div>
			<!-- style="height:35px; -->
			<div class="webpage_center_condition" style="margin-top:-20px;">
				<div class="webpage_center_condition_leixing" id="webpage_center_condition_id" 
				style="">
					<div class="" style="float: left;margin-left: 20px;">
						<span style="font-family: '微软雅黑';">类&nbsp;&nbsp;&nbsp;型：</span>
					</div>
					<div class="" style="float: left;margin-left: -40px;">
						<ul id="ul_leixing">
							<li><a id="leixing" href="" style="background: rgb(255,153,0);color:white;">&nbsp;不限&nbsp;</a></li>
							<li><a id="leixing" href="" style=""><font >&nbsp;短期职位&nbsp; </font></a></li>
							<li><a id="leixing" href="" style=""><font >&nbsp;长期职位&nbsp; </font></a></li>
							<li><a id="leixing" href="" style=""><font >&nbsp;周末职位&nbsp; </font></a></li>
							<li><a id="leixing" href="" style=""><font >&nbsp;全职招聘&nbsp; </font></a></li>
						</ul>
					</div>
				</div>
				<div class="webpage_center_condition_zhonglei" id="webpage_center_condition_id">
					<div class="" style="float: left;margin-left: 20px;">
						<span style="font-family: '微软雅黑';">种&nbsp;&nbsp;&nbsp;类：</span>
					</div>
					<div class="" style="float: left;margin-left: -40px;">
						<ul id="ul_zhonglei">
							<li><a id="zhonglei" href="" style="background: rgb(255,153,0);color:white;">&nbsp;不限&nbsp;</a></li>
							<li><a id="zhonglei" href="" style=""><font >&nbsp;其他&nbsp; </font></a></li>
							<li><a id="zhonglei" href="" style=""><font >&nbsp;安保&nbsp; </font></a></li>
							<li><a id="zhonglei" href="" style=""><font >&nbsp;促销&nbsp; </font></a></li>
							<li><a id="zhonglei" href="" style=""><font >&nbsp;家教&nbsp; </font></a></li>
							<li><a id="zhonglei" href="" style=""><font >&nbsp;服务员&nbsp; </font></a></li>
							<li><a id="zhonglei" href="" style=""><font >&nbsp;送餐员&nbsp; </font></a></li>
							<li><a id="zhonglei" href="" style=""><font >&nbsp;客服&nbsp; </font></a></li>
						</ul>
					</div>
				</div>
				<div class="webpage_center_condition_quyu" id="webpage_center_condition_id">
					<div class="" style="float: left;margin-left: 20px;">
						<span style="font-family: '微软雅黑';">区&nbsp;&nbsp;&nbsp;域：</span>
					</div>
					<div class="" style="float: left;margin-left: -40px;">
						<ul id="ul_quyu">
							<li><a id="quyu" href="" style="background: rgb(255,153,0);color:white;">&nbsp;不限&nbsp;</a></li>
							<li><a id="quyu" href="" style=""><font >&nbsp;经开区&nbsp; </font></a></li>
							<li><a id="quyu" href="" style=""><font >&nbsp;肥东县&nbsp; </font></a></li>
							<li><a id="quyu" href="" style=""><font >&nbsp;庐阳区&nbsp; </font></a></li>
							<li><a id="quyu" href="" style=""><font >&nbsp;蜀山区&nbsp; </font></a></li>
							<li><a id="quyu" href="" style=""><font >&nbsp;长丰县&nbsp; </font></a></li>
							<li><a id="quyu" href="" style=""><font >&nbsp;庐江县&nbsp; </font></a></li>
							<li><a id="quyu" href="" style=""><font >&nbsp;包河区&nbsp; </font></a></li>
							<li><a id="quyu" href="" style=""><font >&nbsp;瑶海区&nbsp; </font></a></li>
							<li><a id="quyu" href="" style=""><font >&nbsp;政务区&nbsp; </font></a></li>
							<li><a id="quyu" href="" style=""><font >&nbsp;高新区&nbsp; </font></a></li>
							<li><a id="quyu" href="" style=""><font >&nbsp;滨湖新区&nbsp; </font></a></li>
							<li><a id="quyu" href="" style=""><font >&nbsp;肥西县&nbsp; </font></a></li>
							
						</ul>
					</div>
				</div>
				
			</div>
			<div id="webpage_center_condition_msg" class="webpage_center_condition_msg" style="margin-top:80px;">
				<button id="msg_btn1" type="button" style="background-color:rgb(255,153,0);"><font id="msg_font1" color="white">最新发布</font></button>
				<button id="msg_btn2" type="button"><font id="msg_font2" color="black">最高薪资</font></button>
				<button id="msg_btn3" type="button"><font id="msg_font3" color="black">最多人看</font></button>
				<button id="msg_btn4" type="button"><font id="msg_font4" color="black">离我最近</font></button>
			</div>
			<div class="webpage_center_main">
				<div class="webpage_center_main_left" id="webpage_center_main_left_id">
					
				<table id="table01" class="table table-hover">
					
					
				</table>					
					
					
					<div style="" id="pageToolbar"></div>
					
					
					
				</div>
				<div class="webpage_center_main_right">
					<div class="webpage_center_main_right_top">
						<span style="font-size: 1.2em;color: rgb(255,153,0);">&nbsp;&nbsp;&nbsp;大学生职位平台</span>
					</div>
					<div id="webpage_center_main_right_top1" class="webpage_center_main_right_top webpage_center_main_right_top1">
						<span style="font-size: 1.2em;color: gray;">&nbsp;&nbsp;&nbsp;想提高招聘效果,发职位&nbsp;?</span>
						<a href="#">马上发布</a>
					</div>
					<div class="webpage_center_main_right_main">

					</div>
					<div class="webpage_center_main_right_main">

					</div>
					<div class="webpage_center_main_right_main">
					</div>
				</div>
			</div>

		</div>
	</body>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#release_").click(function(){
				 window.location.href = '${pageContext.request.contextPath }/page/jobrelease';
			})
		
			$("#messagelayer").click(function(){
				layer.open({
					  type: 2,
					  area: ['700px', '530px'],
					  fixed: false, //不固定
					  maxmin: true,
					  content: '../page/messagelayer'
					});
			})
			/* msgnotreadcount */
			var userstate = $('#userstate').val();
			if(userstate == 1){
				$.ajax({
					type:"post",
					url:"../message/getnotreadmsg",
					data:{
					},
					success:function(data){
						if(data.count == 0){
							
						}else{
							$('#msgnotreadcount').html(data.count);
						}
					},
				});
			};
			

		})
	</script>

</html>