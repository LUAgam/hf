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
		</style>
		
		
	<body style="width: 1440px">
		
		<div >
			<div id="center_" class="layui-collapse">
			 <!--  <div class="layui-colla-item" id='changestate'>
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
			  </div> -->
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
							   " <div class='layui-colla-content layui-show'>"+
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
	</script>
</html>
