<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的申请</title>
	</head>
			<link rel="shortcut icon" href="../asset/xjzsys.ico"/>
		
		<link rel="stylesheet" type="text/css" href="../asset/css/webpage.css" />
		<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="../asset/css/jquery.slideBox.css"/>
		<link rel="stylesheet" type="text/css" href="../asset/layui/css/layui.css"/>
		<script src="../asset/js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/layer/layer.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/jquery.slideBox.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			a{
				font-family: "微软雅黑";
			}
			#webpage_center_main_left_id a{
				font-family: "微软雅黑";
				font-size:1.1em;
			}
			.css_quxiaoshoucang{
				-moz-border-radius:4px;  
			    -webkit-border-radius:4px;  
			    border-radius:4px;
			}
			#cancel_collect a:hover{
				color: white;
			}
			#table01 td{
			
			
			
			
			}
		</style>
		
		
		<body style="width: 1440px">
		<%-- <div class="left_login" id="left_login" style="height:200px;z-index: 9999;">
			<ul>
				<li><span class="glyphicon glyphicon-user"><span style="font-family: '微软雅黑';color: gray;">管理中心</span></span></li>
				<li><a style="font-family: '微软雅黑';color: rgb(253,113,28);" href="${pageContext.request.contextPath }/page/editorptuser">编辑简历</a></li>
				<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/myapply/selectalljob">我的申请</a></li>
				<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/page/mycollect">我的收藏</a></li>
				<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath}/user/quit">退出</a></li>
			</ul>
		</div> --%>
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
					<button type="button" class="btn btn-danger" style="background-color: rgb(253,113,28);">
						<span class="glyphicon glyphicon-pencil"></span>
						<span style="font-size: 1.2em;">编辑简历</span></button>
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
					我的申请
				</span>
			</div>
			<div class="webpage_center_main" >
			  <div class="webpage_center_main_left" id="webpage_center_main_left_id">
						
						<div id="center_" class="layui-collapse">
			  <div class="layui-colla-item" id='changestate'>
			    <h2 class="layui-colla-title">杜甫&nbsp;&nbsp;&nbsp;&nbsp;<span class='badge' style='background-color: red;'>未读</span>
			    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消息接收日期：2017-05-01 16:02:02
			    </h2>
			    <div class="layui-colla-content">
			    <p> 您好你有一条职位动态：您已经被蜀山区发传单职位录用 <p>
			    <p> 消息来自：合肥XX有限公司   <p> 
			    <p>  联系人：程志远 <p> 
			    <p>  联系电话:15056002785(如有疑问请向我们联系)<p> 
			    <p>  工作日期：2017-05-01至 2017-05-01<p> 
			    <p>  请您按时来就职啊，感谢您的合作，祝您生活愉快<p> 
			    </div>
			  </div>
			  <div class="layui-colla-item">
			    <h2 class="layui-colla-title">李清照</h2>
			    <div class="layui-colla-content">内容区域</div>
			  </div>
			  <div class="layui-colla-item">
			    <h2 class="layui-colla-title">鲁迅</h2>
			    <div class="layui-colla-content">内容区域</div>
			  </div>
		</div>



					
					
					<div style="" id="pageToolbar"></div>
					
					
					
					
					
					
				</div>
				<div class="webpage_center_main_right">
					<div class="webpage_center_main_right_top">
						<span style="font-size: 1.2em;color: rgb(255,153,0);">&nbsp;&nbsp;&nbsp;大学生职位平台</span>
					</div>
					<div class="webpage_center_main_right_main">

					</div>
					<div class="webpage_center_main_right_main">

					</div>
					<div class="webpage_center_main_right_main">
					</div>
				</div>
				
				
				
			</div>	
			
			<div class="webpage_center_main" style="border: 2px solid rgb(253,129,0);margin-top: 60px;height: 0px;">
			</div>
			
			
			
			
			
			
		</div>
		
		
	</body>
	
	<script type="text/javascript">
	$(function(){
		layui.use('element', function(){
			  var element = layui.element();
		});
		
		$.ajax({
			type:"post",
			url:"../message/getallmessage",
			data:{
				
			},
			success:function(data){
				var record = '';
				 for(var i=0;i<data.length;i++){
					 if(data[i].state == 0){
						 record = "<span class='badge' style='background-color: red;'>未读</span>";
					 }else{
						 record = "<span class='badge' style='background-color: blue;'>已读</span>";
					 }
					 
					$('#center_').append(
							"<div class='layui-colla-item' id='changestate' value='"+data[i].id+"' state='"+data[i].state+"'>"+
						    "<h2 class='layui-colla-title'>来自"+data[i].businessname+"&nbsp;&nbsp;&nbsp;&nbsp;"+record+
		    	"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消息接收日期："+data[i].sendtime+"</h2>"+
						   " <div class='layui-colla-content'>"+
						    " <p> 您好你有一条职位动态：您已经被"+data[i].ptjobname+"职位录用 <p>"+
						    "<p> 消息来自："+data[i].businessname+"   <p> "+
						    "<p>  联系人："+data[i].businesscontact+" <p> "+
						    "<p>  联系电话:"+data[i].businesstel+"(如有疑问请向我们联系)<p> "+
						   " <p>  工作日期："+data[i].worktime+"<p> "+ 
						    "<p>  请您按时来就职啊，感谢您的合作，祝您生活愉快<p> " +
						    "</div>"+
						" </div>"
					);
				} 
				
					
			},
		});
		
	 	$("#center_").on("click","#changestate",function(){
			var messageid = $(this).attr('value');
			var state = $(this).attr('state');
			var this_ = $(this);
			if(state == 0){
				$.ajax({
					type:"post",
					url:"../message/modifystate",
					data:{
						'messageid':messageid,
					},
					success:function(data){
						if(data.msg == 1){
							this_.attr('state','1');
							this_.children("h2").children(".badge").css("background-color", "blue").html('已读');
						}
					},
				});
			}
			
			
		}); 
		
		
		
		
	});
		$(function(){
			
			$('#demo1').slideBox({
	        duration : 0.3,//滚动持续时间，单位：秒
	        easing : 'linear',//swing,linear//滚动特效
	        delay : 5,//滚动延迟时间，单位：秒
	        hideClickBar : false,//不自动隐藏点选按键
	        clickBarRadius : 10,
	         hideBottomBar : true
			});
			
			
			
			
		});
	</script>
</html>
