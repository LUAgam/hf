<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的发布</title>
	</head>
	<link rel="shortcut icon" href="../asset/xjzsys.ico"/>
		<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap-theme.css" />
		<link rel="stylesheet" type="text/css" href="../asset/css/webpage.css" />
		<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="../asset/css/paging.css"/>
		<link rel="stylesheet" type="text/css" href="../asset/css/jquery.slideBox.css"/>
		<script src="../asset/js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/query.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/paging.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/bootstrap-czy/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/layer/layer.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/jquery.slideBox.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.myrelease_title{
				border: 0px solid black;
				width: 100%;
				height: 40px;
			}
			.myrelease_title_state{
				border: 0px solid black;
				width: 8%;
				height: 100%;
				float: left;
				line-height: 40px;
				font-size: 1.1em;
				text-align: center;
				background-color: rgb(237,238,240);
			}
			.myrelease_title_text{
				border: 0px solid black;
				width: 91%;
				height: 100%;
				float: left;
				background-color: rgb(245,245,245);
			}
			.myrelease_title_div{
				border: 0px solid black;
				width: 100%;
			}
			.myrelease_title_div_left{
				border: 0px solid black;
				width: 8%;
				float: left;
			}
			.myrelease_title_select{
				border: 0px solid black;
				width: 100%;
				background-color: rgb(237,238,240);
				height: 150px;
			}
			.myrelease_title_select li{
				width: 100%;
				height: 150px;
			}
			.myrelease_title_select a{
				border: 0px solid black;
				display: block;
				height: 150px;
				font-size: 1em;
				font-family: "微软雅黑";
				color: gray;
			}
			#select_release a:hover{
				
				text-decoration: none;
			}
			#select_01 a:hover{
				color: rgb(62,181,27);
			}
			#select_02 a{
				background-color: white;
				color: rgb(130,175,214);
			}
			#select_02 a:hover{
				color: rgb(130,175,214);
			}
			#select_03 a:hover{
				color: rgb(255,98,0);
			}
			.myrelease_title_div_right{
				border: 1px solid rgb(254,137,58);
				width: 91%;
				height: 600px;
				float: left;
			}
			#myrelease_main_text a{
				color:slateblue;
				font-family: '微软雅黑';
			}
			#myrelease_main_text img{
					width: 28px;
					height: 28px;
				}
			.css_luyongrenshu{
				height: 60px;
				-moz-border-radius:4px;  
			    -webkit-border-radius:4px;  
			    border-radius:4px;
			}

		</style>
		
		
		
		
	<body style="width: 1440px">
		<div class="left_login" id="left_login" style="height:280px;z-index: 9999;">
				<ul>
					<li><span class="glyphicon glyphicon-user"><span style="font-family: '微软雅黑';color: gray;">管理中心</span></span></li>
					<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/page/jobrelease">发布职位</a></li>
					<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/jobverify/myrelease">我的发布</a></li>
					<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="#">设置中心</a></li>
					<%-- <li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/increment/increment">增值服务</a></li>
					<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/accountrecord/recharge">我的钱包</a></li> --%>
					<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/user/quit">退出</a></li>
				</ul>
			</div>
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
						<input type="text" class="form-control" placeholder="请输入搜索的内容" aria-describedby="basic-addon2">
					</div>
					<button type="button" style="width: 60px;margin-left: -15px;" class="btn btn-warning col-sm-2">&nbsp;搜索&nbsp;</button>
				</div>
				<div id="webpage_center_search_right" class="webpage_center_search_right">
					<button id='release_' type="button" class="btn btn-danger" style="background-color: rgb(253,113,28);">
						<span class="glyphicon glyphicon-pencil"></span>
						<span style="font-size: 1.2em;">发布职位</span></button>
				</div>
			</div>
			<div class="webpage_center_pic" id="webpage_center_pic"  >
				<div id="demo1" class="slideBox">
				  <ul class="items">
				    <li><a href="http://www.jq22.com/" ><img src="../asset/img/1.jpg"></a></li>
				    <li><a href="http://www.jq22.com/" ><img src="../asset/img/2.jpg"></a></li>
				    <li><a href="http://www.jq22.com/" ><img src="../asset/img/3.jpg"></a></li>
				    <li><a href="http://www.jq22.com/" ><img src="../asset/img/4.jpg"></a></li>
				    <li><a href="http://www.jq22.com/" ><img src="../asset/img/5.jpg"></a></li>
				  </ul>
				</div>
			</div>
			<div class="webpage_center_citywork">
				<span id="">
					<a href="" style="font-size: 1em;font-family: '微软雅黑';">大学生职位平台></a>
				</span>
				<span id="" style="font-family: '微软雅黑';color: gray;">
					我的发布
				</span>
			</div>
			<div class="webpage_center_main">
				
						<div class="myrelease_title">
							<div class="myrelease_title_state">
								状态
							</div>
							<div class="myrelease_title_text">
								
							</div>
						</div>	
						
					<div class="myrelease_title_div">
						
						<div class="myrelease_title_div_left" >
									<div class="myrelease_title_select" id="select_release">
										<li id="select_01"><a href="javascript:void(0)" id="select_a_01">
											<br /><br />
												<span id="" style="font-size: 1.6em;"  class="glyphicon glyphicon-ok-circle"></span>
												<br />等待审核
												<br />(${state0.num })
										</a></li>
									</div>
									<div class="myrelease_title_select" id="select_release">
										<li id="select_02"><a href="javascript:void(0)" id="select_a_02">
											<br /><br />
												<span id="" style="font-size: 1.6em;"  class="glyphicon glyphicon-time"></span>
												<br />正在招聘
												<br />(${state1.num })
										</a></li>
									</div>
									<div class="myrelease_title_select" id="select_release">
										<li id="select_03"><a href="javascript:void(0)" id="select_a_03">
											<br /><br />
												<span id="" style="font-size: 1.6em;"  class="glyphicon glyphicon-remove-circle"></span>
												<br />截止报名
												<br />(${state2.num })
										</a></li>
									</div>
						</div>
						<div class="myrelease_title_div_right" id="myrelease_main_text">
						<!-- -------------------------------------------当没有数据时显示----------------------------------------------- -->	
						<div id='havenotmsg' hidden="true" style='width: 100%;height: 595px;border-top: 1px solid gainsboro;margin: 0 auto;background-color: ghostwhite;'>
										<div style='line-height: 400px;float: left;width: 25%;height: 400px;'>
										</div>
										<div style='line-height: 400px;float: left;'>
											<img src='../asset/img/cry.png' style='width: 120px;height: 140px;'/>
										</div>"
										<div style='line-height: 400px;float: left;'>
											<span style='font-size: 2em;font-family: '黑体';'>
												没有要找到你要找的信息
											</span>
										</div>
						</div>
						<!-- -------------------------------------------未审核----------------------------------------------- -->	
						<table id="table01" class="table table-hover" style="display:none;">
							<input id='table01_size' type="text" value="${state0.num }" hidden="true" />
								<c:forEach var="ptjob" items="${state0.ptjobs}">
									<tr>
										<td>&nbsp;<a href="../ptjob/getById?id=${ptjob.id}" style="font-size: 1.1em;text-decoration: underline;">
											${ptjob.jbname }</a></td>
										<td ><span class='glyphicon glyphicon-map-marker'></span>区域：${ptjob.jbadress }&nbsp;<fmt:formatDate value="${ptjob.releasetime }" pattern="yyyy-MM-dd" /></td>
										<td><span style="color: #FF7701;">等待审核</span></td>
										<td>
											<a class="css_luyongrenshu" style="color: white;background-color: gray;">
												&nbsp;录用人数: 未知<%-- ${ptjob.jbname } --%>&nbsp;
											</a>
										</td>
										<td><a href="javascript:void(0)" class="css_luyongrenshu" style="color: white;background-color: red;">
												&nbsp;等待审核中。。。&nbsp;
											</a></td>
									</tr>
								</c:forEach>
							</table>
							<!-- ----------------------------------------------招聘中-------------------------------------------- -->	
							<table id="table02" class="table table-hover" >
								<input id='table02_size' type="text" value="${state1.num }" hidden="true" />
								<c:forEach var="ptjob" items="${state1.ptjobs}">
									<tr>
										<td>&nbsp;<a href="../ptjob/getById?id=${ptjob.id}" style="font-size: 1.1em;text-decoration: underline;">
											${ptjob.jbname }</a></td>
										<td ><span class='glyphicon glyphicon-map-marker'></span>区域：${ptjob.jbadress }&nbsp;<fmt:formatDate value="${ptjob.releasetime }" pattern="yyyy-MM-dd" /></td>
										<td>
											<a class="css_luyongrenshu" style="color: white;background-color: gray;">
												&nbsp;已录用人数: ${ptjob.jobverify.employeenum }<%-- ${ptjob.jbname } --%>&nbsp;
											</a>
										</td>
										<td><a href="javascript:void(0)" onclick="" class="css_luyongrenshu" style="color: white;background-color: red;">
												&nbsp;招聘ing。。。&nbsp;
											</a></td>
										<td>
											<button onclick="checklist(${ptjob.id});" type="button" class="btn btn-info btn-xs">查看名单<span class="glyphicon glyphicon-search"></span></button>
										</td>
									</tr>
								</c:forEach>
								<!-- ------------------------------------已经下架------------------------------------------------------ -->	
								<table id="table03" class="table table-hover" style="display:none;">
									<input id='table03_size' type="text" value="${state2.num }" hidden="true" />
								<c:forEach var="ptjob" items="${state2.ptjobs}">
									<tr>
										<td>&nbsp;<a href="../ptjob/getById?id=${ptjob.id}" style="font-size: 1.1em;text-decoration: underline;">
											${ptjob.jbname }</a></td>
										<td ><span class='glyphicon glyphicon-map-marker'></span>区域：${ptjob.jbadress }&nbsp;<fmt:formatDate value="${ptjob.releasetime }" pattern="yyyy-MM-dd" /></td>
										<td><span style="color: #FF7701;">后台下架</span></td>
										<td>
											<a class="css_luyongrenshu" style="color: white;background-color: gray;">
												&nbsp;录用人数: ${ptjob.jobverify.employeenum }<%-- ${ptjob.jbname } --%>&nbsp;
											</a>
										</td>
										<td><a href="javascript:void(0)" onclick="gogo_01(${ptjob.id})" class="css_luyongrenshu" style="color: white;background-color: red;">
												&nbsp;下架原因&nbsp;
												<input id="undercarriagemsg_${ptjob.id}" type="text"  value="${ptjob.jobverify.undercarriagemsg }"  style="display:none;"/>
											</a></td>
									</tr>
								</c:forEach>
							</table>	
							</table>	
						</div>
					</div>
			</div>	
			
			<div class="webpage_center_main" style="border: 2px solid rgb(253,129,0);margin-top: 60px;height: 0px;">
				
			</div>
			
			
			
			
			
			
		</div>
		
		
	</body>
	
	<script type="text/javascript">
		function gogo_01(id){
			var undercarriagemsg = $('#undercarriagemsg_'+id).val();
			layer.open({
			  type: 1,
			  title: "下架原因",
			  closeBtn: 0,
			  area: ['300px', '200px'],
			  skin: 'layui-layer-rim',
			  /*skin: 'layui-layer-nobg',*/ //没有背景色
			  shadeClose: true,
			  content: undercarriagemsg
			});
			
		};
		
		
		function checklist(ptjobid){
			
			/* layer.tab({
				  area: ['600px', '300px'],
				  tab: [{
				    title: '职位报名名单', 
				    content: '${pageContext.request.contextPath}/page/checklist',
				  }, {
				    title: 'TAB2', 
				    content: '内容2'
				  }, {
				    title: 'TAB3', 
				    content: '内容3'
				  }]
				}); */
			layer.open({
				  type: 2,
				  title: '报名名单',
				  shadeClose: true,
				  shade: 0.8,
				  area: ['70%', '70%'],
				  content: '${pageContext.request.contextPath}/page/checklist?pyjobid='+ptjobid
				});
			
			
		};
	
		$(function(){
			
			
			
			
			
			
			
			$('#demo1').slideBox({
	        duration : 0.3,//滚动持续时间，单位：秒
	        easing : 'linear',//swing,linear//滚动特效
	        delay : 5,//滚动延迟时间，单位：秒
	        hideClickBar : false,//不自动隐藏点选按键
	        clickBarRadius : 10,
	         hideBottomBar : true
			});
			
			$("#select_01").click(function(){
				$("#select_a_01").css({'background':'white','color':'rgb(62,181,27)'});
				$("#select_a_02").css({'background':'rgb(237,238,240)','color':'gray'});
				$("#select_a_03").css({'background':'rgb(237,238,240)','color':'gray'});
				$('#table01').show();
				$('#table02').hide();
				$('#table03').hide();
				$("#havenotmsg").hide();
				var listsize = $("#table01_size").val();
				if(listsize == 0){
					$("#havenotmsg").show();
				}
			})
			$("#select_02").click(function(){
				$("#select_a_01").css({'background':'rgb(237,238,240)','color':'gray'});
				$("#select_a_02").css({'background':'white','color':'rgb(130,175,214)'});
				$("#select_a_03").css({'background':'rgb(237,238,240)','color':'gray'});
				$('#table01').hide();
				$('#table02').show();
				$('#table03').hide();
				$("#havenotmsg").hide();
				var listsize = $("#table02_size").val();
				if(listsize == 0){
					$("#havenotmsg").show();
				}
				
			})
			$("#select_03").click(function(){
				$("#select_a_01").css({'background':'rgb(237,238,240)','color':'gray'});
				$("#select_a_02").css({'background':'rgb(237,238,240)','color':'gray'});
				$("#select_a_03").css({'background':'white','color':'rgb(255,98,0)'});
				$('#table01').hide();
				$('#table02').hide();
				$('#table03').show();
				$("#havenotmsg").hide();
				var listsize = $("#table03_size").val();
				if(listsize == 0){
					$("#havenotmsg").show();
				}
				
			})
			$("#release_").click(function(){
				 window.location.href = '${pageContext.request.contextPath }/page/jobrelease';
			})
			
			/* $("#select_01").mouseover(function(){  
				$("#select_a_01").css({'color': 'rgb(62,181,27)',});
			});
			$("#select_01").mouseleave(function(){
				$("#select_a_01").css({'color': 'gray',});
			});
			$("#select_02").mouseover(function(){  
				$("#select_a_02").css({'color': 'rgb(130,175,214)',});
			});
			$("#select_02").mouseleave(function(){
				$("#select_a_02").css({'color': 'gray',});
			});
			$("#select_03").mouseover(function(){  
				$("#select_a_03").css({'color': 'rgb(255,98,0)',});
			});
			$("#select_03").mouseleave(function(){
				$("#select_a_03").css({'color': 'gray',});
			}); */
			
			
		});
	</script>
</html>
