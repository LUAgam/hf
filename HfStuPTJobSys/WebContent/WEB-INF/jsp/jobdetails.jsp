<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>职位详细信息</title>
	</head>
	<link rel="shortcut icon" href="../asset/xjzsys.ico"/>
	<link rel="stylesheet" type="text/css" href="../asset/css/jobdetails.css"/>
	<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap-theme.css"/>
	<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap.css"/>
	<style type="text/css">
		
		.right_shoucangjia{
			border: 1px solid rgb(243,152,0);
			margin-top: 200px;
			position: fixed;
			margin-left: 1335px;
			background-color: rgb(255,146,58);
			width: 50px;
			height: 120px;
			-moz-border-radius:10px;  
		    -webkit-border-radius:10px;  
		    border-radius:10px;  
		}
		.u-flyer{display: block;width: 50px;height: 50px;border-radius: 50px;position: fixed;z-index: 9999;}
		#msg{position:fixed; top:260px; right:0px; z-index:10000; width:1px; height:52px; line-height:52px; font-size:20px; text-align:center; color:#fff; background:rgb(255,146,58); display:none}
		
	</style>
	
	<script src="../asset/js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="../asset/bootstrap-czy/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
	<script src="../asset/js/jquery.fly.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="../asset/layer/layer.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=nNid3BNgQgYwWQG0UIkt6bPCxUcv1Gbs"></script>
	<body style="width: 1440px;background-color: rgb(243,245,246);">
		
		<div class="right_shoucangjia" id="right_shoucangjia">
			<li style="width: 100%;height: 120px;">
				<a href="${pageContext.request.contextPath }/page/mycollect" style="display: block;">
					<img style="width: 50px;height:120px ;" src="../asset/img/img_collect.png"/>
				</a>
			</li>
		</div>
		<div id="msg">已成功加入收藏夹</div>
		
		<div class="job_top" id="job_top">
			<div class="job_top_center">
				<div class="job_top_center_left">
					<img style="height: 30px;width: 80px;" src="../asset/img/logo.png"/>
				</div>
				<div class="job_top_center_right" id="job_top_center_right">
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
		<div class="job_main">
			<div class="job_main_left">
				<div class="job_main_left_top">
					<span id="">
					<a href="" style="font-size: 1em;font-family: '微软雅黑';">大学生职位平台></a>
					</span>
					<span id="">
					<a href="" style="font-size: 1em;font-family: '微软雅黑';">合肥${ptjob.jbkind}></a>
					</span>
					<span id="" style="font-family: '微软雅黑';color: ;">
						职位"${ptjob.jbname}"
					</span>
				</div>
				<div class="job_main_left_main">
					<div class="job_main_left_main_title">
						<div class="" style="width: 100%;height: 10px;background-color: white;">
							
						</div>
						<div class="job_main_left_main_title_main">
							<br />
							<span id="" style="font-family: '微软雅黑';font-size: 2em;">
								${ptjob.jbname}
							</span><br />
							<span id="" style="font-family: '微软雅黑';font-size: 1em;color: darkgray;">
								${ptjob.business.name}
							</span><br />
							<span style="font-family: '微软雅黑';font-size: 1.2em;color: rgb(255,153,0);">${ptjob.salary}/天</span>
							<span style="font-family: '微软雅黑';font-size: 1.2em;color:gray;">|</span>
							<span style="font-family: '微软雅黑';font-size: 1.2em;color:rgb(58,137,226);">${ptjob.jbkind}</span>
							<span style="font-family: '微软雅黑';font-size: 1.2em;color:gray;">|</span>
							<span style="font-family: '微软雅黑';font-size: 1.2em;color:gray;">发布时间： <fmt:formatDate value="${ptjob.releasetime}" pattern="YY年MM月dd号" /></span>
								<c:if test="${ptjob.state == '1'}">
									<button type="button" id="signup_job" class="btn btn-danger btn-lg" style="background-color: rgb(255,146,58);margin-left: 200px;">
										<span style="font-size: 1.2em;color: white;font-family: '微软雅黑';">报名职位</span>
									</button>
								</c:if>
								<c:if test="${ptjob.state != '1'}">
									<button type="button" id="signup_job" class="btn btn-danger btn-lg" disabled="disabled" style="background-color: rgb(255,146,58);margin-left: 200px;">
										<span style="font-size: 1.2em;color: white;font-family: '微软雅黑';">报名职位</span>
									</button>								
								</c:if>
							<div class="" style="margin-top: -10px;">
								<a href="javascript:void(0);"  id="shoucang_go">
								<span id="shoucang_go01" class="glyphicon glyphicon-star" style="color:rgb(255,153,0) ;">
								</span>
								<span id="shoucang_go02" style="font-family: '微软雅黑';font-size: 0.9em;color:rgb(255,153,0) ;">
									点击收藏
								</span>
							</a>
							</div>
							<!--<button type="button" class="btn btn-danger btn-sm" style="background-color: rgb(255,146,58);margin-left: 300px;;">
								<span class="glyphicon glyphicon-star" style="font-size: 1.2em;color: white;font-family: '微软雅黑';">报名职位</span>
							</button><br />-->
						</div>
					
					</div>
					<div class="job_main_left_main_text">
						<span class="span_maintitle">招聘人数：</span>
						<span class="span_maintext">${ptjob.recnum}人</span><br />
						<span class="span_maintitle">工作日期：</span>
						<span class="span_maintext">
						<fmt:formatDate value="${ptjob.startdate}" pattern="yyyy-MM-dd" />
						至<fmt:formatDate value="${ptjob.enddate}" pattern="yyyy-MM-dd" /></span><br />
						<span class="span_maintitle">上班地点：</span>
						<span class="span_maintext">${ptjob.jbadress}</span><br />
						<span class="span_maintitle">上班时间：</span>
						<span class="span_maintext">${ptjob.worktime}小时</span><br />
						
						<div class="" style="border-left:4px solid rgb(255,153,0); margin-top: 20px;">
							<span id="" style="font-family: '微软雅黑';font-size: 1.2em;color:gray ;font-weight:600;">
								&nbsp;&nbsp;工作详情
							</span>
						</div>
						<div class="" style="margin-top: 20px;">
							<span id="" class="span_maintext" style="font-size: 0.9em;">
									${ptjob.jbdetails}
							</span>
							
						</div>
						<div id="l-map" class="" style="margin-top: 20px;border: 4px solid gainsboro;width: 100%;height: 300px;">
							<input id="address_suggest" type="text" hidden="true" value="${ptjob.suggest}"/>
							
						</div>
						
					</div>
					
				</div>
			</div>
			<div class="job_main_right">
				<div class="job_main_right_top">
					
				</div>
				<div class="job_main_right_main">
					<div class="job_main_right_main_top">
						<div class="job_main_right_main_text1">
							<span style="font-size: 1.2em;color: rgb(255,153,0);">职位推荐</span>
						</div>
					</div>
					<div class="job_main_right_main_main">
						<c:forEach items="${ptjobrecommend}" var="pjb">
							<div class="job_main_right_main_text">
								<span style="font-size: 1.2em;color:rgb(58,137,226);">
									<a target='_Blank' href='../ptjob/getById?id=${pjb.id}'>${pjb.jbname}</a></span>
								<div style="margin-top: 6px">
									<span style="font-size: 0.9em;color: rgb(255,153,0);">${pjb.salary}</span>&nbsp;
									<span style="font-size: 0.9em;color:gray;">|</span>&nbsp;
									<span style="font-size: 0.9em;color:rgb(58,137,226);">${pjb.jbkind}</span>&nbsp;
									<span style="font-size: 0.9em;color:gray;">|</span>&nbsp;
									<span style="font-size: 0.9em;color:gray;">${pjb.jbadress}</span>
								</div>
							</div>
						</c:forEach>
					
					
						
						<!-- <div class="job_main_right_main_text">
							<span style="font-size: 1.2em;color:rgb(58,137,226);"><a href="">检索出的公司名称</a></span>
							<div style="margin-top: 6px">
								<span style="font-size: 0.9em;color: rgb(255,153,0);">100/天</span>&nbsp;
								<span style="font-size: 0.9em;color:gray;">|</span>&nbsp;
								<span style="font-size: 0.9em;color:rgb(58,137,226);">其他</span>&nbsp;
								<span style="font-size: 0.9em;color:gray;">|</span>&nbsp;
								<span style="font-size: 0.9em;color:gray;">芜湖</span>
							</div>
						</div>
						<div class="job_main_right_main_text">
							<span style="font-size: 1.2em;color:rgb(58,137,226);">检索出的公司名称</span>
							<div style="margin-top: 6px">
								<span style="font-size: 0.9em;color: rgb(255,153,0);">100/天</span>&nbsp;
								<span style="font-size: 0.9em;color:gray;">|</span>&nbsp;
								<span style="font-size: 0.9em;color:rgb(58,137,226);">其他</span>&nbsp;
								<span style="font-size: 0.9em;color:gray;">|</span>&nbsp;
								<span style="font-size: 0.9em;color:gray;">芜湖</span>
							</div>
						</div> -->
						<div id="" style="width: 100%;height: 60px;line-height: 60px;text-align: center;">
							<ul style="list-style: none;">
								<li style="width: 100%;height: 30px;width: 80%;">
									<a href="" style="display: block;">
										<span style="font-size: 1.2em;color:gray;">查看更多</span>
									</a>
								</li>
							</ul>
						</div>
						
					</div>
				</div>
				
			</div>
			<div class="_jobdetails_text" style="">
				<div class="_jobdetails_text_main">
					
					<div class="_jobdetails_text_main_top">
							<div class="_jobdetails_text_main_top_comname" >
								<li id="li_gsjs" style="border-bottom:4px solid rgb(255,119,1);">
									<a href="javascript:void(0);">公司介绍</a></li>
							</div>
							<div class="_jobdetails_text_main_top_comname">
								<li id="li_zgjz"><a href="javascript:void(0);">在岗职位</a></li>
							</div>
							<div class="_jobdetails_text_main_top_comname">
								<li id="li_jzpl"><a href="javascript:void(0);">该职位相关评论</a></li>
							</div>
					</div>
					
					<div class="_jobdetails_text_main_text" id="_obdetails_text">
						
						 <img style="width: 100px;height: 100px;" src="../asset/img/2.jpg"/>&nbsp;&nbsp;&nbsp;
						<span id="" style="font-size: 1.6em;font-weight: 500;">
								${ptjob.business.name}
						</span> 
						
						<!--<div class="_jobdetails_text_main_text_table">
							<div class="_jobdetails_text_main_text_table_left">
								<img class='img-circle' src="img/jbtype/qita.png"/>
							</div>
							<div class="_jobdetails_text_main_text_table_right">
								<div id=""><a href="">合肥学院计算机科学技术系</a></div>
								<div id="msg_jobdetails_other"><span style="color: #E38D13;">100元/天</span>&nbsp;|&nbsp;其他&nbsp;|&nbsp;经开区</div>
							</div>
						</div>-->
						<!-- <div class="_jobdetails_text_main_text_comments_text">
							<div>
								<textarea id="jobcomments" style="width: 560px;height: 100px;"></textarea>
							</div>
							<div id="comments_msgisnull" style="float: left;margin-left: 160px;border: 1px solid black;" >
							</div>
							<div style="float: right;margin-right: 80px;">
								<button type="button" id="submit_comment" class="btn btn-info"><span class="glyphicon glyphicon-ok"></span>点击评论</button>
							</div>
						</div>
						<div id="comments_list">
							<div class="_jobdetails_text_main_text_comments">
								<span style="color:rgb(55,155,233);">沈亮亮</span><br />
								<span style="color: darkgray;">大家好，我叫沈亮亮，来自安徽定远的小学生</span>
								<div style="margin-right: 10px;float: right;">
									<a id="business_huifu" style="margin-right: 0px;" href="javascript:void(0);">回复</a>
								</div>
								<div class="_jobdetails_text_main_text_comments_business">
								<span style="font-size: 1.1em;">&nbsp;&nbsp;&nbsp;企业回复：大家好，我叫沈亮亮，来自安徽定远的小学生</span>
								</div>
								<div class="_jobdetails_text_main_text_comments_business">
								<span style="font-size: 1.1em;">&nbsp;&nbsp;&nbsp;企业回复：大家好，我叫沈亮亮，来自安徽定远的小学生</span>
								</div>
							</div>
						</div>
						<div class="_jobdetails_text_main_text_comments_jiazai">
							<li><a id="loadcomments" href="javascript:void(0);">加载更多</a></li>
						</div> -->
						
						<div id="clone_comments" class="_jobdetails_text_main_text_comments">
								<span style="color:rgb(55,155,233);">沈亮亮</span><br />
								<span style="color: darkgray;">大家好，我叫沈亮亮，来自安徽定远的小学生</span>
								<div style="margin-right: 10px;float: right;">
									<a id="business_huifu" style="margin-right: 0px;" href="javascript:void(0);">回复</a>
								</div>
									<div class="_jobdetails_text_main_text_comments_business">
									<span style="font-size: 1.1em;">&nbsp;&nbsp;&nbsp;企业回复：大家好，我叫沈亮亮，来自安徽定远的小学生</span>
								</div>
						</div>
						
						
					</div>
				</div>
				<div style="width: 100%;border: 3px solid rgb(255,146,58);"></div>
			</div>
			
		</div>
		
		
		<input type="hidden" id="hidden_id" name="data" value="${ptjob.id}">
		<input type="text" hidden="true" id="hidden_businessid"  value="${ptjob.business.id}">
	</body>
	<script type="text/javascript">
		// 百度地图API功能
		function G(id) {
			return document.getElementById(id);
		}
		var address_suggest = $('#address_suggest').val();
		var map = new BMap.Map("l-map");
		
		var keyword = address_suggest;
		var localSearch = new BMap.LocalSearch(map);
	    localSearch.enableAutoViewport(); //允许自动调节窗体大小
	    localSearch.setSearchCompleteCallback(function (searchResult) {
	        var poi = searchResult.getPoi(0);
	        var point = new BMap.Point(poi.point.lng, poi.point.lat);
	        map.centerAndZoom(poi.point, 15);
			var marker = new BMap.Marker(point);  // 创建标注
			map.addOverlay(marker);               // 将标注添加到地图中
			marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
	    });
	    localSearch.search(keyword);
		
		
		
</script>
	
	
	
	
	
	
	
	<script type="text/javascript">
	
	    document.getElementById("clone_comments").style.display= "none";
		
		$(function(){
			
			//--------------------------------------------------------------------------职位报名--------------------
			
			$('#signup_job').click(function(){
				
				var ptjobid = document.getElementById("hidden_id").value;
				$.ajax({
					type : "post",
					url : '../myapply/selectonejob',
					data : {
						
						'ptjobid' : ptjobid,
						
					},
					success : function(data){
						
						if(data.msg == 1){
							layer.msg('您已经报名,不能重复报名,谢谢合作', {icon: 1});
						}else if(data.msg == 0){
							$.ajax({
								type : "post",
								url : '../myapply/applyjob',
								data : {
									
									'ptjobid' : ptjobid,
									
								},
								success : function(data){
									
									if(data.msg == 1){
										layer.msg('报名成功', {icon: 1});
									}else{
										window.location.href = '../page/login';
									}
								},
							}); 
							
						}else{
							window.location.href = '../page/login';
						}
					},
				});
				
				
			});
			
			
			
			
			
			
			
			/*var clone_comments_ = $("#clone_comments").clone();*/
			/* alert(clone_comments); */
			
			var id = document.getElementById("hidden_id").value;
			var startindex = 0;
			var	pagesize = 5;
			
			//局部刷新评论每次刷新五条
			function load_comments(){
				
				$.ajax({
					type : "post",
					url : '../comments/getcomments',
					data : {
						'ptjobid' : id,
						'startindex' : startindex,
						'pagesize' : pagesize,
					},
					
					success: function(data) {
						
						for(var i=0;i<data.length;i++){
								$("#comments_list").append(
										"<div id='comments_ajax"+data[i].id+"' value='"+data[i].id+"'>"+	
										"<div style='margin-top:10px;'><span style='color:rgb(55,155,233);'>"+data[i].ptusername+"</span><br />"+
										"<span style='color: darkgray;'>"+data[i].comment+"</span></div>"+
										"<div style='margin-right: 10px;float: right;'>"+
											"<a id='business_huifu' value='"+data[i].id+"' style='margin-right: 0px;' href='javascript:void(0);'>回复</a>"+
										"</div>"+
											"<div id='business_comments_"+data[i].id+"'></div>"+
										"</div>"
								);
								
									for(var j=0;j<data[i].comments.length;j++){
										$("#business_comments_"+data[i].id).append(
												"<div class='_jobdetails_text_main_text_comments_business' style='margin-top:20px;'>"+
												"<span style='font-size: 1.1em;'>&nbsp;&nbsp;&nbsp;企业回复："+(data[i].comments)[j].comment+"</span>"+
												"</div>"
										);
									}
								
						}
						startindex = startindex + pagesize;
						/* alert('startindex = '+startindex); */
					},
				})
				
			}
			
			
			
			
			/* $("body").delegate("[id='_obdetails_text']","mouseover",function(){
				$('#business_huifu').click(function(){
					 var commentsid = $(this).attr("value");
					 alert('---------------获取评论id'+commentsid);
				});
			});  */
			
			
			//-----------------------------------------------------------------------------局部刷新回复评论----------
			$(document).on("click", "#business_huifu", function(){ 
					var commentsid = $(this).attr("value");
					var businessid_ =  $('#hidden_businessid').val();
				  	var comments_ajax = $(this).parent().parent().attr('id'); 
				  	var huifumsg = "";
					layer.prompt({
						  title:'回复内容:',
						  formType: 2
						},function(val, index){
						  huifumsg = val;
						  //下面写ajax
						  
						 $.ajax({
							 type:'post',
							 url:'../comments/addbscomments',
							 data:{
								 'businessid': businessid_,
								 'commentsid':commentsid,
								 'comment':huifumsg,
							 },
							 success:function(data){
								 
								 if(data.msg == 1){
								  $.ajax({
									 type:'post',
									 url:'../comments/getonecomments',
									 data:{
										 'commentsid':commentsid,
										 'comment':huifumsg,
									 },
									 success:function(data){
										 
											 $('#'+comments_ajax).empty();
										 
												$('#'+comments_ajax).append(
														 "<div id='comments_ajax"+data.id+"' value='"+data.id+"'>"+	
														"<div style='margin-top:10px;'><span style='color:rgb(55,155,233);'>"+data.ptusername+"</span><br />"+
														"<span style='color: darkgray;'>"+data.comment+"</span></div>"+
														"<div style='margin-right: 10px;float: right;'>"+
															"<a id='business_huifu' value='"+data.id+"' style='margin-right: 0px;' href='javascript:void(0);'>回复</a>"+
														"</div>"+
															"<div id='business_comments_"+data.id+"'></div>"+
														"</div>" 
												);
												
												 for(var j=0;j<data.comments.length;j++){
													$("#business_comments_"+data.id).append(
															"<div class='_jobdetails_text_main_text_comments_business' style='margin-top:20px;'>"+
															"<span style='font-size: 1.1em;'>&nbsp;&nbsp;&nbsp;企业回复："+(data.comments)[j].comment+"</span>"+
															"</div>"
													);
												} 
										 
									 },
								 })
								 }

								 if(data.msg == 2){
									 window.location.href = '../page/login';
								 }
								 if(data.msg == 3){
									 layer.msg('hi,这条职位不是您发的，所以您不能回复');
								 }
							
							 },
						 })
						  layer.close(index);
					});
				  	
				  	
				  	
				}); 
			
			
			
			 /* $("body").delegate("[id='business_huifu']","click",function(){
				var huifumsg = "";
				layer.prompt({
					  title:'回复内容:',
					},function(val, index){
					  layer.msg('得到了'+val);
					  huifumsg = val;
					  alert(huifumsg);
					  var commentsid = $(this).attr("value");
					  alert('---------------获取评论id'+commentsid);
					  //下面写ajax
					  
					 $.ajax({
						 type:'post',
						 url:'',
						 data:{
							 
						 },
						 success:function(data){
							 
						 },
					 })
					  
					  
					  
					  layer.close(index);
				});
		});  */
			
			
			
			
			
			
			
			
			
			
			
			
			$("#li_gsjs").click(function(){
				$("#li_gsjs").css({'border-bottom':'4px solid rgb(255,119,1)'});
				$("#li_zgjz").css({'border-bottom':''});
				$("#li_jzpl").css({'border-bottom':''});
				$("#_obdetails_text").empty();
				$("#_obdetails_text").html("<img style='width: 120px;height: 120px;' src='../asset/img/2.jpg'/>&nbsp;&nbsp;&nbsp;"+
						"<span id='' style='font-size: 1.6em;font-weight: 500;'>${ptjob.business.name}</span>");
				
			});
			$("#li_zgjz").click(function(){
				$("#li_gsjs").css({'border-bottom':''});
				$("#li_zgjz").css({'border-bottom':'4px solid rgb(255,119,1)'});
				$("#li_jzpl").css({'border-bottom':''});
				$("#_obdetails_text").empty();
				$.ajax({
					type : "post",
					url : '../business/getjblist',
					data : {
						'id' : id,
					},
					
					success: function(data) {
						for(var i=0;i<data.length;i++){
							$("#_obdetails_text").append("<div class='_jobdetails_text_main_text_table'>"+
									"<div class='_jobdetails_text_main_text_table_left'><img class='img-circle' src='../asset/img/jbtype/"+data[i].imgurl+"'/>"+
									"</div><div class='_jobdetails_text_main_text_table_right'><div><a href=''>"+data[i].jbname+"</a></div>"+
									"<div id='msg_jobdetails_other'><span style='color: #E38D13;'>"+data[i].salary+"</span>&nbsp;|&nbsp;"+data[i].jbkind+"&nbsp;|&nbsp;"+data[i].jbadress+"</div>"+
									"</div></div>"
							);
							
						}

					},
				})
				
				
				
				
			});
			
			//-------------------------------------------------------------------------加载评论------------
			
			
			
			
			$("#li_jzpl").click(function(){
				$("#li_gsjs").css({'border-bottom':''});
				$("#li_zgjz").css({'border-bottom':''});
				$("#li_jzpl").css({'border-bottom':'4px solid rgb(255,119,1)'});
				$("#_obdetails_text").empty();
				$("#_obdetails_text").append(
					"<div class='_jobdetails_text_main_text_comments_text'>"
					+"<div><textarea id='jobcomments' style='width: 560px;height: 100px;'></textarea>"
						+"</div><div id='comments_msgisnull' style='float: left;margin-left: 160px;' >"
						+"</div><div style='float: right;margin-right: 80px;'>"
							+"<button id='submit_comment' type='button' class='btn btn-info'><span class='glyphicon glyphicon-ok'></span>点击评论</button>"
						+"</div>"
					+"</div><div id='comments_list'></div>");
				load_comments();
				
				/* $.ajax({
					type : "post",
					url : '../comments/getcomments',
					data : {
						'ptjobid' : id,
						'startindex' : startindex,
						'pagesize' : pagesize,
					},
					
					success: function(data) {
						
						for(var i=0;i<data.length;i++){
								$("#comments_list").append(
										"<div id='comments_ajax"+data[i].id+"' value='"+data[i].id+"'>"+	
										"<div style='margin-top:10px;'><span style='color:rgb(55,155,233);'>"+data[i].ptusername+"</span><br />"+
										"<span style='color: darkgray;'>"+data[i].comment+"</span></div>"+
										"<div style='margin-right: 10px;float: right;'>"+
											"<a id='business_huifu' value='"+data[i].id+"' style='margin-right: 0px;' href='javascript:void(0);'>回复</a>"+
										"</div>"+
											"<div id='business_comments_"+data[i].id+"'></div>"+
										"</div>"
								);
								
									for(var j=0;j<data[i].comments.length;j++){
										$("#business_comments_"+data[i].id).append(
												"<div class='_jobdetails_text_main_text_comments_business' style='margin-top:20px;'>"+
												"<span style='font-size: 1.1em;'>&nbsp;&nbsp;&nbsp;企业回复："+(data[i].comments)[j].comment+"</span>"+
												"</div>"
										);
									}
								
						}
						startindex = startindex + pagesize;
						alert('startindex = '+startindex);
					},
				}) */
				$("#_obdetails_text").append(
						"<div class='_jobdetails_text_main_text_comments_jiazai'>"
						+"<li><a id='loadcomments' href='javascript:void(0);'>加载更多</a></li></div>"
				);
				
				/* $("#_obdetails_text").html(
					
					"<div class='_jobdetails_text_main_text_comments_text'>"
							+"<div><textarea id='jobcomments' style='width: 560px;height: 100px;'></textarea>"
						+"</div><div id='comments_msgisnull' style='float: left;margin-left: 160px;' >"
						+"</div><div style='float: right;margin-right: 80px;'>"
							+"<button id='submit_comment' type='button' class='btn btn-info'><span class='glyphicon glyphicon-ok'></span>点击评论</button>"
						+"</div>"
					+"</div><div id='comments_list'><div class='_jobdetails_text_main_text_comments'>"
						+"<span style='color:rgb(55,155,233);'>沈亮亮</span><br />"
						+"<span style='color: darkgray;'>大家好，我叫沈亮亮，来自安徽定远的小学生</span>"
						+"<div style='margin-right: 10px;float: right;'>"
						+"<a id='business_huifu' style='margin-right: 0px;' href='javascript:void(0);'>回复</a>"
						
						+"</div><div class='_jobdetails_text_main_text_comments_business'>"
							+"<span style='font-size: 1.1em;'>&nbsp;&nbsp;&nbsp;企业回复：大家好，我叫沈亮亮，来自安徽定远的小学生</span>"
						+"</div>"
					+"</div></div><div class='_jobdetails_text_main_text_comments_jiazai'>"
						+"<li><a id='loadcomments' href='javascript:void(0);'>加载更多</a></li></div>"
					
					
				); */
			});
			
			//-------------------------------------------------------------------加载更多每次五条 局部刷新-----------------
			$("body").delegate("[id='loadcomments']","click",function(){
				
					load_comments();
				
				
					/* $("#comments_list").append(
						"<div class='_jobdetails_text_main_text_comments'>"
							+"<span style='color:rgb(55,155,233);'>沈亮亮</span><br />"
							+"<span style='color: darkgray;'>大家好，我叫沈亮亮，来自安徽定远的小学生</span>"
							+"<div class='_jobdetails_text_main_text_comments_business'>"
								+"<span style='font-size: 1.1em;'>&nbsp;&nbsp;&nbsp;企业回复：大家好，我叫沈亮亮，来自安徽定远的小学生</span>"
							+"</div>"
						+"</div>"
					); */
					
					/*$("submit_comment").val();*/
			});
			
			//----------------------------------------------------------------------------------------局部刷新评论----
			$("body").delegate("[id='submit_comment']","click",function(){
					var jobcomments = $("#jobcomments").val();
					
					if("".trim() == jobcomments.trim()){
						/*alert("请输入评论内容");*/
							$("#comments_msgisnull").html(
							"<span style='color: red;'>评论内容为空,请重新输入</span>"
							);
					}else{
						
						$.ajax({
							
							type : 'post',
							url : '../comments/addcomments',
							data : {
								'ptjobid': id,
								'comment': jobcomments,
							},
							success:function(data){
								
								if(data.msg == 1){
									
									$.ajax({
										
										type : 'post',
										url : '../comments/getlastonecomments',
										success:function(data){
												
													$('#comments_list').prepend(
															
															"<div id='comments_ajax"+data.id+"' value='"+data.id+"'>"+	
															"<div style='margin-top:10px;'><span style='color:rgb(55,155,233);'>"+data.ptusername+"</span><br />"+
															"<span style='color: darkgray;'>"+data.comment+"</span></div>"+
															"<div style='margin-right: 10px;float: right;'>"+
																"<a id='business_huifu' value='"+data.id+"' style='margin-right: 0px;' href='javascript:void(0);'>回复</a>"+
															"</div>"+
																"<div id='business_comments_"+data.id+"'></div>"+
															"</div>"
													)
														for(var j=0;j<data.comments.length;j++){
															$("#business_comments_"+data.id).append(
																	"<div class='_jobdetails_text_main_text_comments_business' style='margin-top:20px;'>"+
																	"<span style='font-size: 1.1em;'>&nbsp;&nbsp;&nbsp;企业回复："+(data.comments)[j].comment+"</span>"+
																	"</div>"
															);
														}
												
										},
									});
								}
								if(data.msg == 2){
												window.location.href='../page/login';
								}
								
								
								
							},
						});
					}
					
					/*$("submit_comment").val();*/
			});
			
			function huifu_(commentid){
				
				alert(commentid);
				
			}
			
		/*	$("#loadcomments").click(function(){
				$("#comments_list").append(
					"<div class='_jobdetails_text_main_text_comments'>"
						+"<span style='color:rgb(55,155,233);'>沈亮亮</span><br />"
						+"<span style='color: darkgray;'>大家好，我叫沈亮亮，来自安徽定远的小学生</span>"
						+"<div class='_jobdetails_text_main_text_comments_business'>"
							+"<span style='font-size: 1.1em;'>&nbsp;&nbsp;&nbsp;企业回复：大家好，我叫沈亮亮，来自安徽定远的小学生</span>"
						+"</div>"
					+"</div>"
					
				);
			})*/
			
			
			
		})
		
		
			$(function() {
				var offset = $("#right_shoucangjia").offset();
				$("#shoucang_go").click(function(event){
					var addcar = $(this);
					
					var ptjobid = document.getElementById("hidden_id").value;
					
					$.ajax({
						
						type : 'post',
						url : '../collect/addmycollect',
						data : {
							'ptjobid' : ptjobid,
						},
						success:function(data){
							
							var state = data.msg;
							if(state == '2'){
								window.location.href = '../page/login';
							}
							
							
							
						},
					});
					
					
					
					
					
					
					
					var flyer = $('<img class="u-flyer" src="../asset/img/star_collect.jpg">');
					flyer.fly({
						start: {
							left: event.pageX,
							top: event.pageY
						},
						end: {
							left: offset.left+10,
							top: offset.top+10,
							width: 0,
							height: 0
						},
						onEnd: function(){
							$("#msg").show().animate({width: '200px'}, 300).fadeOut(2000);
							addcar.css("cursor","default").removeClass('orange').unbind('click');
							$("#shoucang_go01").css({'color':'gray',});
							$("#shoucang_go02").css({'color':'gray',});
							this.destory();
						}
					});
				});
			});
			
			$("#right_shoucangjia").mouseover(function(){
				$("div").animate({left: '-35px'},200);
			});
			$("#right_shoucangjia").mouseleave(function(){
				
				$("div").animate({left: '0px'},200);
				
			});
			
			
		
	</script>
	
</html>
