<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>职位工作报名名单</title>
	</head>
	<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap-theme.css" />
		<link rel="stylesheet" type="text/css" href="../asset/css/webpage.css" />
		<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="../asset/css/paging.css"/>
		<link rel="stylesheet" type="text/css" href="../asset/css/edituser.css"/>
	<style type="text/css">
	
		#table01 td{
			height: 40px;
			line-height: 40px;
			text-align: center;
		}
	
	</style>
	
		<script src="../asset/js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/query.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/paging.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/bootstrap-czy/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/jquery.slideBox.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/layer/layer.js" type="text/javascript" charset="utf-8"></script>
	<body>
	
	   <%-- --------------${pyjobid} --%>
		<table id="table01" class="table table-bordered table-hover">
			<tr>
				<td>编号</td>
				<td>姓名</td>
				<td>年龄</td>
				<td>性别</td>
				<td>学校</td>
				<td>报名日期 </td>
				<td>操作</td>
			</tr>
			
		</table>
		
		
		
		
		<div style="" id="pageToolbar"></div>
		<input value="${pyjobid}" id="ptjobid_" type='hidden'>
	</body>
	<script type="text/javascript">
		 $(function(){
			 
			 var pyjobid = $('#ptjobid_').val();
			 
			 	var currentpage = '';
			 
			 	currentpage = ajax_table(1);
			    
			   /*  $(document).on("click", "#pass_", function(){ */
			    $("body").delegate("[id='pass_']","click",function(){
			    	var jobappplyid = $(this).attr("value");
			    	var userid = $(this).attr("userid");
			    	 var this_ = $(this);
			    	
			    	$.ajax({
							
			    		type:'post',
			    		url:'../chectlist/passapply',
			    		data:{
			    			'jobappplyid':jobappplyid,
			    		},
			    		success : function(data){
			    			
			    			if(data.msg == '1'){
			    				 this_.attr("disabled","disabled");
			    				 $.ajax({
										
			 			    		type:'post',
			 			    		url:'../message/addonemessage',
			 			    		data:{
			 			    			'toUserid':userid,
			 			    			'messsage':'您申请的职位已我们已经同意了，请按照职位的具体时间来参加职位，多谢参与！',
			 			    			'ptjobid':pyjobid
			 			    		},
			 			    		success : function(data){
			 			    			
			 			    		},
			 			    	}) 
			    				 
			    				layer.msg('已通过报名,消息已经发送给该用户！', {icon: 1});
			    			}
			    		},
			    	})
			    });
			    
			   
			   $("body").delegate("[id='check_ptuser']","click",function(){
			    	var ptuserid = $(this).attr("value");
			    	var this_ = $(this);
			    	 
			    	
			    	 $.ajax({
							
			    		type:'post',
			    		url:'../chectlist/getptusermsg',
			    		data:{
			    			'ptuserid':ptuserid,
			    		},
			    		success : function(data){
			    			 layer.open({
								  type: 1,
								  closeBtn: 0, //不显示关闭按钮
								  anim: 2,
								  title: '',
								  skin: 'layui-layer-rim', //加上边框
								  shadeClose: true, //开启遮罩关闭
								  area: ['530px', '400px'],
								  content: "<div class='_layer_ptusermsg_main' style='height:300px;width:500px'>"+
										"<div class='_layer_ptusermsg_main_top'>"+
										"</div>"+
										"<div class='_layer_ptusermsg_main_center_name'>"+
										"<img style='width: 80px;height:80px;margin-left:200px' class='img-circle' src=../../pic/"+data.imgurl+"></img></div>"+
									  "<div style='border-bottom: 1px solid gray;height:100px;'>"+
											"<div class='_layer_ptusermsg_main_text_left'>"+
										"<span style='color:rgb(247,132,58);margin-left:20px;'>个人资料</span>"+
										"<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>"+
									"</div>"+
									"<div class='_layer_ptusermsg_main_text_right'><div style='margin-top:8px;'>"+
										"年龄："+data.age+"<br/>"+
										"身高："+data.height+"cm<br/>"+
										"城市："+data.city+"<br/>"+
										"所在学校："+data.school+"<br/>"+
									"</div></div>"+
								"</div>"+
								"<div style='border-bottom: 1px solid gray;height:60px;'>"+
									"<div class='_layer_ptusermsg_main_text_left'style='height:60px;line-height: 60px'>"+
										"<span style='color:rgb(247,132,58);margin-left:20px;'>联系方式</span>"+
										"<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>"+
									"</div>"+
									"<div class='_layer_ptusermsg_main_text_right'style='height:60px;'>"+
										"<div style='margin-top: 10px;'>"+
											"手机："+data.phone+"<br/>"+
											"邮箱："+data.eamil+""+
										"</div>"+
									"</div>"+
								"</div>"+
								"<div style='border-bottom: 1px solid gray;height:60px;'>"+
									"<div class='_layer_ptusermsg_main_text_left' style='height:60px;line-height: 60px'>"+
										"<span style='color:rgb(247,132,58);margin-left:20px;'>自我简介:</span>"+
										"<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>"+
									"</div>"+
									"<div class='_layer_ptusermsg_main_text_right'style='height:60px;line-height: 60px'>"+data.resume+
									
									"</div>"+
								"</div>"+
								"<div style='border-bottom: 1px solid gray;height:60px;'>"+
									"<div class='_layer_ptusermsg_main_text_left' style='height:60px;line-height: 60px'>"+
										"<span style='color:rgb(247,132,58);margin-left:20px;'>工作经验:</span>"+
										"<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>"+
									"</div>"+
									"<div class='_layer_ptusermsg_main_text_right'style='height:60px;line-height: 60px'>"+data.experience+
									"</div>"+
								"</div>"+
								"<div style='border-bottom: 1px solid gray;height:60px;'>"+
								"<div class='_layer_ptusermsg_main_text_left' style='height:60px;line-height: 60px'>"+
									"<span style='color:rgb(247,132,58);margin-left:20px;'>附件简历:</span>"+
									"<span style='color:rgb(247,132,58);margin-left:10px;'><span class='glyphicon glyphicon-record' ></span></span>"+
								"</div>"+
								"<div class='_layer_ptusermsg_main_text_right'style='height:60px;line-height: 60px'><a href='../ptuser/download/"+data.id+"'>"+data.fujian+
								"</a></div>"+
							"</div></div>"
								});
					    	 
			    			
			    		},
			    	}) 
			    });
			    
			    
				function ajax_table(currentpage){
					
					
					$("#pageToolbar").empty();
					var children = $("#table01").find("tr");
					for (var i = 1; i < children.length; i++) {
						children[i].remove();
					}
					var currentpage = currentpage;
					var pagesize = 5;
					var datatemp;
					
					$.ajax({
						type: 'post',
						url: '../chectlist/getchectlist',
						data: {
							"ptjobid" : pyjobid,
							"currentpage" : currentpage,
							"pagesize": pagesize,
						},
						success: function(data) {
							
							datatemp = data.list;
							$('#pageToolbar').Paging({
								pagesize: pagesize,
								count: data.totalrecord,
								toolbar: true,
							callback: function(page, size, count) {
								console.log(arguments)
								currentpage = page;
								pagesize = size;
								
								//-----------------------------------------------------------------------
								if((currentpage != 1) || (pagesize != 5) ){
									var children = $("#table01").find("tr");
									for (var i = 1; i < children.length; i++) {
										children[i].remove();
									}
									$.ajax({
										type: 'post',
										url: '../chectlist/getchectlist',
										data: {
											"ptjobid" : pyjobid,
											"currentpage" : currentpage,
											"pagesize": pagesize,
										},
										success: function(data) {
											totalrecord = data.totalrecord;
											/*var temp = eval("("+data+")");*/
											var data1 = data.list;
											for(var i=0;i<data1.length;i++){
												$("#table01").append(
														"<tr><td>" + (i+1) + "</td><td>" + data1[i].name + 
														"</td><td>" + data1[i].age + 
														"</td><td>" + data1[i].sex + 
														"</td><td>" + data1[i].school + 
														"</td><td>" + data1[i].applytime + 
														"</td><td><button id='check_ptuser' value='"+data1[i].ptuserid+"' type='button' title='查看' class='btn btn-info btn-xs'>"+
															"<span class='glyphicon glyphicon-search'></span>"+
														"</button>&nbsp;<button id='pass_' value='"+data1[i].id+"' userid='"+data1[i].userid+"' type='button' title='通过' class='btn btn-success btn-xs' >"+
														"<span class='glyphicon glyphicon-ok'></span>"+
														"</button>" +
																"</td></tr>");
											}
										},
									});
								}else{
									//-------------------------------------------------------
									var children = $("#table01").find("tr");
									for (var i = 1; i < children.length; i++) {
										children[i].remove();
									}
									
									for(var i=0;i<datatemp.length;i++){
										$("#table01").append(
												"<tr><td>" + (i+1) + "</td><td>" + datatemp[i].name + 
												"</td><td>" + datatemp[i].age + 
												"</td><td>" + datatemp[i].sex + 
												"</td><td>" + datatemp[i].school + 
												"</td><td>" + datatemp[i].applytime + 
												"</td><td><button id='check_ptuser' value='"+datatemp[i].ptuserid+"' type='button' title='查看' class='btn btn-info btn-xs'>"+
													"<span class='glyphicon glyphicon-search'></span>"+
												"</button>&nbsp;<button id='pass_' value='"+datatemp[i].id+"' userid='"+datatemp[i].userid+"' type='button' title='通过' class='btn btn-success btn-xs'>"+
												"<span class='glyphicon glyphicon-ok'></span>"+
												"</button>" +
														"</td></tr>");
									}
									
								}
							}
						}),
							totalrecord = data.totalrecord;
							/*var temp = eval("("+data+")");*/
							var data1 = data.list;
							for(var i=0;i<data1.length;i++){
								$("#table01").append(
										"<tr><td>" + (i+1) + "</td><td>" + datatemp[i].name + 
										"</td><td>" + datatemp[i].age + 
										"</td><td>" + datatemp[i].sex + 
										"</td><td>" + datatemp[i].school + 
										"</td><td>" + datatemp[i].applytime + 
										"</td><td><button id='check_ptuser' value='"+datatemp[i].ptuserid+"' type='button' title='查看' class='btn btn-info btn-xs'>"+
											"<span class='glyphicon glyphicon-search'></span>"+
										"</button>&nbsp;<button id='pass_' value='"+datatemp[i].id+"' userid='"+datatemp[i].userid+"' type='button' title='通过' class='btn btn-success btn-xs'>"+
											"<span class='glyphicon glyphicon-ok'></span>"+
										"</button>" +
												"</td></tr>");
							}
						}
					});
					
					return currentpage;
				}
			 
			 
			 
			 
			 
		})
	
	
		
		
		
		
	</script>
	
	
</html>
