<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的收藏</title>
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
		<script src="../asset/layer/layer.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/bootstrap-czy/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/jquery.slideBox.min.js" type="text/javascript" charset="utf-8"></script>
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
		</style>
		
		
	<body style="width: 1440px">
		<div class="left_login" id="left_login" style="height:200px;z-index: 9999;">
			<ul>
				<li><span class="glyphicon glyphicon-user"><span style="font-family: '微软雅黑';color: gray;">管理中心</span></span></li>
				<li><a style="font-family: '微软雅黑';color: rgb(253,113,28);" href="${pageContext.request.contextPath }/page/editorptuser">编辑简历</a></li>
				<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/myapply/selectalljob">我的申请</a></li>
				<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath }/page/mycollect">我的收藏</a></li>
				<li><a style="font-family: '微软雅黑';color: rgb(243,152,0);" href="${pageContext.request.contextPath}/user/quit">退出</a></li>
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
					<button id='editmsgbtn' type="button" class="btn btn-danger" style="background-color: rgb(253,113,28);">
						<span class="glyphicon glyphicon-pencil"></span>
						<span style="font-size: 1.2em;">编辑简历</span></button>
				</div>
			</div>
			<div class="webpage_center_pic" id="webpage_center_pic" >
				
				
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
			<div class="webpage_center_main" style="margin-top: 80px;">
						<div class="webpage_center_main_left" id="webpage_center_main_left_id">
					
				<table id="table01" class="table table-hover">
					<!-- <tr id=''>
						<td><img class='img-circle' src='../asset/img/jbtype/qita.png'/>&nbsp;
							<a href=''><span style='color: gray;font: '微软雅黑';font-size: 1.1em;'>安徽科大讯飞有限公司</span></a></td>
						<td width='100px'><span class="glyphicon glyphicon-map-marker"></span><span style='color: gray;font: '微软雅黑';'> 蜀山区</span></td>
						<td><span class="glyphicon glyphicon-time"></span><span style="color: gray;font: '微软雅黑';font-size:1.1em;font-weight: 600;"> 2012-03-06</span></td>
						<td><div id='cancel_collect'>
						<a class='css_quxiaoshoucang' href='javascript:void(0)' id='cancle_col' style="color: white;background-color: red;height:30px;">
												&nbsp;取消收藏&nbsp;</a>
							</div>
					</td></tr> -->
					
					
				</table>					
					
					
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
		
		<c:if test="${user != null }">
			<input type="hidden" id="hidden_userid" value="${user.id}"> 
		</c:if>
		<c:if test="${user == null }">
			<input type="hidden" id="hidden_userid" value="0"> 
		</c:if>
	</body>
	
	<script type="text/javascript">
	
	
	
		$(function(){
			
			var userid = $('#hidden_userid').val();
			var mycollectid = 0;//收藏的job  id主键通过主键进行各种操作
			
			$(document).on("click", "#cancle_col", function(){ 
				//此处的$(this)指$( "#testDiv")，而非$(document) 
					mycollectid = $(this).attr("value");
				
					layer.confirm('您确定取消收藏？', {
						  btn: ['确定','取消'] //按钮
						}, function(){
							$.ajax({
								type : 'post',
								url : '../collect/deletemycollect',
								data : {
									'mycollectid' : mycollectid,
									
								},
								success : function(data){
									
									$('#cancle_collect_'+mycollectid).empty();
									
								},
							});
							
						  layer.msg('该收藏已被删除', {icon: 1});
						}, function(){
						  /*layer.msg('也可以这样', {
						    time: 20000, //20s后自动关闭
						    btn: ['明白了', '知道了']
						  });*/
						});
					
				
			});
			
			
			$('#demo1').slideBox({
	        duration : 0.3,//滚动持续时间，单位：秒
	        easing : 'linear',//swing,linear//滚动特效
	        delay : 5,//滚动延迟时间，单位：秒
	        hideClickBar : false,//不自动隐藏点选按键
	        clickBarRadius : 10,
	         hideBottomBar : true
			});
			
			
			$.ajax({
				
				type:'post',
				url:'../collect/mycollect',
				data:{
					'userid':userid,
				},
				success:function(data){
					if(data.length == 0){
						$('#table01').append(
								"<div style='width: 100%;height: 800px;border-top: 1px solid gainsboro;border-bottom: 1px solid gainsboro;margin: 0 auto;background-color: ghostwhite;'>"
								+"<div style='line-height: 400px;float: left;width: 20%;height: 400px;'>"
								+"</div>"
								+"<div style='line-height: 400px;float: left;'>"
									+"<img src='../asset/img/cry.png' style='width: 120px;height: 140px;'/>"
								+"</div>"
								+"<div style='line-height: 400px;float: left;'>"
									+"<span style='font-size: 2em;font-family: '黑体';'>"
										+"你还没收藏任何职位"
									+"</span>"
								+"</div>"
							+"</div>"
							);
						
						
					}
					
					for(var i=0;i<data.length;i++){
						$('#table01').append(
							
							"<tr id='cancle_collect_"+data[i].id+"'>"
							+"<td><img class='img-circle' src='../asset/img/jbtype/"+data[i].urlImg+"'/>&nbsp;"
								+"<a target='_Blank' href='../ptjob/getById?id="+ 
								data[i].id +"'><span style='color: gray;font: '微软雅黑';font-size: 1.1em;'>"+data[i].jobname+"</span></a></td>"
							+"<td width='100px'><span class='glyphicon glyphicon-map-marker'></span><span style='color: gray;font: '微软雅黑';'> "+data[i].address+"</span></td>"
							+"<td><span class='glyphicon glyphicon-time'></span><span style='color: gray;font: '微软雅黑';font-size:1.1em;font-weight: 600;''> "+data[i].colttime+"</span></td>"
							+"<td><div id='cancel_collect'>"
							+"<a class='css_quxiaoshoucang' href='javascript:void(0)' id='cancle_col' value='"+data[i].id+"' style='color: white;background-color: red;height:30px;'>"
									+"&nbsp;取消收藏&nbsp;</a>"
								+"</div>"
						+"</td></tr>"
							
								
						);
						
						
					}
				}
			})
			
			$('#editmsgbtn').click(function(){
				
				window.location.href='${pageContext.request.contextPath }/page/editorptuser';
				
			}); 
			/* $('#cancle_col').click(function(){
				
				
				layer.confirm('您确定取消收藏？', {
				  btn: ['确定','取消'] //按钮
				}, function(){
					
				  layer.msg('该收藏已被删除', {icon: 1});
				}, function(){
				});
				
			}); */
			
			
		});
		
		
		/* "<tr id=''>"
			"<td><img class='img-circle' src='img/jbtype/qita.png'/>&nbsp;&nbsp;&nbsp;"
				"<a href=''><span style='color: gray;font: '微软雅黑';font-size: 1.1em;'>安徽科大讯飞有限公司</span></a></td>"
			"<td width='100px'><span class="glyphicon glyphicon-map-marker"></span>&nbsp;合肥啊</td>"
			"<td><span class="glyphicon glyphicon-time"></span>&nbsp;2012-03-06</td>"
			"<td><div id='cancel_collect'>"
				"<a href='javascript:void(0)'  class='css_quxiaoshoucang' id='cancle_col'>"
									"&nbsp;取消收藏&nbsp;</a></div>"
		"</td></tr>" */
		
		
		
		
		
	</script>
</html>
