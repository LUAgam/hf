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
			#table01 td{
			
			
			
			
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
					
				<table id="table01" class="table table-hover">
					<!-- <tr>
						<td><img class="img-circle" src="../asset/img/jbtype/qita.png"/>&nbsp;&nbsp;&nbsp;<font color="gray" face="微软雅黑">安徽科大讯飞有限公司</font></td>
						<td width='100px'>aaaa</td>
						<td>aaaa</td>
						<td>aaaa</td>
						<td>aaaa</td>
						<td>aaaa</td>
						<td>aaaa</td>
						<td>aaaa</td>
						<td>aaaa</td>
					</tr> -->
					<c:if test="${jobapplys.size() == 0}">
						<div id='havenotmsg'  style='width: 100%;height: 800px;border-top: 1px solid gainsboro;border-bottom: 1px solid gainsboro;margin: 0 auto;background-color: ghostwhite;'>
										<div style='line-height: 400px;float: left;width: 20%;height: 400px;'>
										</div>
										<div style='line-height: 400px;float: left;'>
											<img src='../asset/img/cry.png' style='width: 120px;height: 140px;'/>
										</div>"
										<div style='line-height: 400px;float: left;'>
											<span style='font-size: 2em;font-family: '黑体';'>
												您还没有申请职位--!
											</span>
										</div>
						</div>
					</c:if>
					<c:forEach var="jobapply" items="${jobapplys}">
					
						<tr id='cancle_collect_${jobapply.id}'>
							<td><img class='img-circle' src='../asset/img/jbtype/${jobapply.ptjob.imgurl}'/>&nbsp;
								<a target='_Blank' href='../ptjob/getById?id=${jobapply.ptjob.id}'><span style="color: gray;font: '微软雅黑';font-size: 1.1em;">${jobapply.ptjob.jbname}</span></a></td>
							 <td width='100px'><span class='glyphicon glyphicon-map-marker'></span><span style="color: gray;font: '微软雅黑';"> ${jobapply.ptjob.jbadress}</span></td>
							<td><span class='glyphicon glyphicon-time'></span><span style="color: gray;font: '微软雅黑';font-size:1.1em;font-weight: 600;"> <fmt:formatDate value="${jobapply.applytime}" pattern="yyyy-MM-dd" /></span></td>
							<td><div id='cancel_collect_${jobapply.id}'>
									<c:if test="${jobapply.state == 0}">
										<a class='css_quxiaoshoucang' href='javascript:void(0)' id='cancle_col' value='${jobapply.id}' state='${jobapply.state}'  style='color: white;background-color: gray;'>
										&nbsp;已取消报名&nbsp;</a>
									</c:if>
									<c:if test="${jobapply.state == 1}">
										<a class='css_quxiaoshoucang' href='javascript:void(0)' id='cancle_col' value='${jobapply.id}' state='${jobapply.state}' style='color: white;background-color: red;'>
										&nbsp;取消报名&nbsp;</a>
									</c:if>
									<c:if test="${jobapply.state == 2}">
										<a class='css_quxiaoshoucang' href='javascript:void(0)' id='' value='${jobapply.id}' state='${jobapply.state}' style='color: white;background-color: blue;'>
										&nbsp;已被录用&nbsp;</a>
									</c:if>
								</div>
							</td> 
							<td> <c:if test="${jobapply.state == 2}">
										<button id='collectjob' value='${jobapply.ptjob.id}' type="button" class="btn btn-success btn-xs" title='投诉'><span class="glyphicon glyphicon-pencil"></span></button>
								</c:if>
							</td>
						</tr>
					</c:forEach>
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
		
		
	</body>
	
	<script type="text/javascript">
		$(function(){
			$('#demo1').slideBox({
	        duration : 0.3,//滚动持续时间，单位：秒
	        easing : 'linear',//swing,linear//滚动特效
	        delay : 5,//滚动延迟时间，单位：秒
	        hideClickBar : false,//不自动隐藏点选按键
	        clickBarRadius : 10,
	         hideBottomBar : true
			});
			//------------------------------------------------------投诉职位----------------------
			 $(document).on("click", "#collectjob", function(){
				 var ptjobid = $(this).attr("value");
				 $.ajax({
						type : 'post',
						url : '../complain/getcomplainselect',
						data : {
							'ptjobid' : ptjobid,
						},
						success : function(data){
							if(data.msg == 1){
							layer.msg('对不起，您已经投诉过该职位 ');
							}else{
								layer.prompt({
									  title:'投诉原因:',
									  formType: 2
									},function(val, index){
										var complain = val;
										$.ajax({
											type : 'post',
											url : '../complain/addonecomplain',
											data : {
												'ptjobid' : ptjobid,
												'complain' : complain,
												'state' : 0,
												
											},
											success : function(data){
												layer.msg('投诉成功，我们将尽快处理 ');
												 /* layer.msg('投诉成功，我们将尽快处理', {icon: 2});  */
											},
										}); 						
									  layer.close(index);
								});
								
							}
							
						},
					}); 		
			}) 
			
			//------------------------------------------------------取消报名----------------------
			 $(document).on("click", "#cancle_col", function(){
				 
					var myapplyid = $(this).attr("value");
					var state = $(this).attr("state");
					
					if(state == 1){
						layer.confirm('您确定取消报名？', {
							  btn: ['确定','取消'] //按钮
							}, function(){
								
								 $.ajax({
										type : 'post',
										url : '../myapply/cancelapplyjob',
										data : {
											'myapplyid' : myapplyid,
											
										},
										success : function(data){
											
											$('#cancel_collect_'+myapplyid).children('a').empty();
											
											$('#cancel_collect_'+myapplyid).append(
												"<a class='css_quxiaoshoucang' href='javascript:void(0)' id='cancle_col' value='${jobapply.id}' state='${jobapply.state}'  style='color: white;background-color: gray;'>"
												+"&nbsp;已取消报名&nbsp;</a>"
											);
											
											/*  $('#cancle_collect_'+myapplyid).empty();  */
											 layer.msg('取消成功', {icon: 1}); 
										},
									}); 
								
								
								
							}, function(){
							});
					}else{
						
						layer.msg('您已经取消报名，若再报名请重新进入职位详情页报名', {icon: 1});
						
					}
			}) 
			
			
			
						/* $('cancel_collect_'+myapplyid).children('a').css({'background-color': 'gray',}); */
					  /*  layer.msg('该收藏已被删除', {icon: 1}); */
			
			
			
			
			
			
			
		});
	</script>
</html>
