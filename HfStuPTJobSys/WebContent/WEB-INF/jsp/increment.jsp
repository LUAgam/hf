<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>增值服务</title>
	</head>
	<link rel="shortcut icon" href="../asset/xjzsys.ico"/>
		<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap-theme.css" />
		<link rel="stylesheet" type="text/css" href="../asset/css/webpage.css" />
		<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="../asset/css/paging.css"/>
		<link rel="stylesheet" type="text/css" href="../asset/css/jquery.slideBox.css"/>
		<link rel="stylesheet" type="text/css" href="../asset/css/edituser.css"/>
		<link rel="stylesheet" type="text/css" href="../asset/jedate-czy/skin/jedate.css" />
		
		<script src="../asset/js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/query.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/paging.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/layer/layer.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/bootstrap-czy/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/jquery.slideBox.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/jquery.cityselect.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/jedate-czy/jquery.jedate.js" type="text/javascript" charset="utf-8"></script>
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
					<a href="${pageContext.request.contextPath}/page/webpage" style="">首页</a>
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
				<div id="webpage_center_search_center" style="margin-top:0px;margin-left:-10px" class="webpage_center_search_center">
					<ul>
						<li><span style="font-family: '微软雅黑';font-size: 1.5em;color: rgb(225,104,30);">企业增值服务</span></li>
					</ul>
				</div>
			
			</div>
			
			<div class="webpage_center_main" style="border: 0px solid black;margin-top: 60px;height: 0px;">
				<div class="editor_main_left_">
					<div class="editor_main_left_top">
						<div style="float: left;height: 28px;width: 30%;border-bottom: 3px solid rgb(175,175,175);">
						</div>
						<div style="float: left;width: 40%;line-height: 56px;text-align: center;color: #000000;">
							增值服务
						</div>
						<div style="float: right;height: 28px;width: 30%;border-bottom: 3px solid rgb(175,175,175);">
						</div>
					</div>
					<div class="editor_main_left_li">
						<li><a href="#" id="modify_a1" style="background-color: rgb(253,129,0);color: white;" ><span class="glyphicon glyphicon-arrow-up"></span>
						&nbsp;职位置顶</a></li>
						<li><a href="#" id="modify_a2" style="background-color: rgb(243,243,243);"><span class="glyphicon glyphicon-picture"></span> &nbsp;扩展模块</a></li>
						<li><a href="#" id="modify_a3" ><span class="glyphicon glyphicon-lock"></span> &nbsp;扩展模块</a></li>
						<li><a href="#" id="modify_a4"  style="background-color: rgb(243,243,243);"><span class="glyphicon glyphicon-pencil"></span> &nbsp;扩展模块</a></li>
					</div>
					
					
					
				</div>
				<div class="editor_main_right_">
					<!------------------------------------11111111111-------------------------------->
					<div id="modify_ptusermsg">
						<div class="editor_main_right_top_">
						<div class="editor_main_right_top_main">
							<div class="editor_main_right_top_main_text">
								<div class="editor_main_right_top_main_left" style="">
									&nbsp;&nbsp;<span style="font-size: 1.3em">职位置顶服务</span>
								</div>
							</div>
						</div>
					</div>
					<div id="modify_ptusermsg">
						<div class="editor_main_right_top_main_text_text" id="input_msg">
							<div class="editor_main_right_top_main_input">
								置顶职位选择：<select id="ptjob_top" style="height:30px;width: 200px">
										</select>
							</div>
							<div id='mouseover_' class="editor_main_right_top_main_input">
								置顶时长选择：<input id="inpstart"  name="inpstart" type="text" class="workinput wicon mr25" id="inpstart" style="width: 120px" readonly>
								 至
								<input id="inpend" name="inpend"  type="text" class="workinput wicon mr25" id="inpend" style="width: 120px" readonly>
								
							</div>
							<div class="editor_main_right_top_main">
							</div>
							<div class="editor_main_right_top_main_input">
								<span style="font-size: 1.2em">费用:<span style="color: red">200</span>/天</span>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span id='dayandmoney'></span>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button id='btn_pay' type="button" class="btn" style="background-color: rgb(259,123,0);color:white;width: 200px">去支付</button>
							</div>
						</div>
					</div>
					
					


				<!------------------------------------222222-------------------------------------->
					<div id="modify_ptusermsg1" style="display: none;">
						
					</div>
				
				<!--------------------------------------33333333----------------------------------------------------->
				
					<div id="modify_ptusermsg2" style="display: none;">
					
					</div>
					
					<!-----------------------------4444444444------------------------------------------>
					
					
					
					
					
					
					
					
					
				
			</div>
			
			
			
			</div>
				
			<div class="webpage_center_main" style="border: 2px solid rgb(253,129,0);margin-top: 60px;height: 0px;">
				
				
				
				
				
			</div>
				
		</div>	
			
			
			
			
			
			
			
		
		
	</body>
	<script type="text/javascript">  
	    $(function(){
	    })
	</script>
	<script type="text/javascript">
	$(function(){
		/* var minDate = $.nowDate(0); */
		/* ----------------------------------------------第一个模块---------------------------------------------------- */
		console.log($.nowDate(0));
		var minDate = '2017-05-30';
		var maxDate = '2018-06-30';
		datakongjian(minDate,maxDate); 
		function datakongjian(minDate,maxDate){
			var start = {
					format: 'YYYY-MM-DD',
					minDate: minDate, //设定最小日期为当前日期
					isinitVal: false,
					festival: true,
					isToday:false, 
					ishmsVal: false,
					maxDate: maxDate, //最大日期
					choosefun: function(elem, datas) {
						end.minDate = datas; //开始日选好后，重置结束日的最小日期
					}
				};
				var end = {
					format: 'YYYY-MM-DD',
					minDate: minDate, //设定最小日期为当前日期
					festival: true,
					isToday:false, 
					maxDate: maxDate, //最大日期
					choosefun: function(elem, datas) {
						start.maxDate = datas; //将结束日的初始值设定为开始日的最大日期
					}
				};
			$('#inpstart').jeDate(start);
			$('#inpend').jeDate(end);
		}
			
			 $.ajax({//ptjob_top
                url:"../business/getcurrentjblist",
                type:'post',
                success:function(data){
                	for(var i=0;i<data.length;i++){
                		$('#ptjob_top').append('<option value='+data[i].id+'>'+data[i].jbname+'</option>');
                	}
                	var ptjobid = $('#ptjob_top').val();
					console.log(ptjobid);
					$.ajax({
		                url:"../increment/getjobtime",
		                type:'post',
		                data: {
		        			'ptjobid' : ptjobid, 
						},
		                success:function(data){
		                	var nowdate = $.nowDate(0);
		                	if(nowdate > data.startdate){
		                		minDate = nowdate;
		                	}else{
		                		minDate = data.startdate;
		                	}
		                	if(nowdate < data.enddate){
		                		maxDate = data.enddate;
		                	}else{
		                		maxDate = nowdate;
		                	}
		                	console.log(minDate+"-------"+maxDate);
		                	//datakongjian(minDate,maxDate);
		        				$('#inpstart').remove();
		        				$('#inpend').remove();
		        				$('#mouseover_').html(
		        						"置顶时长选择：<input id='inpstart'  name='inpstart' type='text' class='workinput wicon mr25' id='inpstart' style='width: 120px' readonly>至"+
										"<input id='inpend' name='inpend'  type='text' class='workinput wicon mr25' id='inpend' style='width: 120px' readonly>"
		        					);
		        				datakongjian(minDate,maxDate); 
		                }

		            }); 
                }

            });  
			//blurptjob_top
			$('#ptjob_top').blur(function(){
				var ptjobid = $('#ptjob_top').val();
				var starttime = $('#inpstart').val();
				var endtime = $('#inpend').val();
				$.ajax({
	                url:"../increment/getjobtime",
	                type:'post',
	                data: {
	        			'ptjobid' : ptjobid, 
					},
	                success:function(data){
	                	var nowdate = $.nowDate(0);
	                	if(nowdate > data.startdate){
	                		minDate = nowdate;
	                	}else{
	                		minDate = data.startdate;
	                	}
	                	if(nowdate < data.enddate){
	                		maxDate = data.enddate;
	                	}else{
	                		maxDate = nowdate;
	                	}
	                	console.log(minDate+"-------"+maxDate);
	        				$('#inpstart').remove();
	        				$('#inpend').remove();
	        				$('#mouseover_').html(
	        						"置顶时长选择：<input id='inpstart'  name='inpstart' type='text' class='workinput wicon mr25' id='inpstart' style='width: 120px' readonly>至"+
									"<input id='inpend' name='inpend'  type='text' class='workinput wicon mr25' id='inpend' style='width: 120px' readonly>"
	        					);
	        				datakongjian(minDate,maxDate); 
	                }

	            }); 
			});
		$('#btn_pay').click(function(){
			var ptjobid = $('#ptjob_top').val();
			var starttime = $('#inpstart').val();
			var endtime = $('#inpend').val();
			if(starttime == ""){
				layer.tips('开始时间不能为空', '#inpstart');
			}else if(endtime == ""){
				layer.tips('结束时间不能为空', '#inpend');
			}else{
				var daylength = getDateDiff(starttime,endtime);
				var paymoney = daylength*200;
				$.ajax({
	                url:"../increment/payforjobtop",
	                type:'post',
	                data: {
	                	'starttime' : starttime,
	                	'endtime' : endtime,
	        			'ptjobid' : ptjobid,
	        			'paymoney' : paymoney
					},
	                success:function(data){
	                	if(data.msg == '1')
	                		layer.alert('该职位将会在您选择的时间置顶', {icon: 6});
	                	if(data.msg == '2')
	                		layer.confirm('余额不足啦', {
	                			  btn: ['前去充值','我再看看'] //按钮
	                			}, function(){
	                				window.location.href = '${pageContext.request.contextPath }/accountrecord/recharge';
	                			}, function(){
	                			  
	                			});
	                	if(data.msg == '3')
	                	layer.msg('您已经置顶了该职位0.0', function(){
                			});
	                }

	            }); 
			
			}
			
			
		});
	 	$('#mouseover_').mouseover(function(){
			var starttime = $('#inpstart').val();
			var endtime = $('#inpend').val();
			if(endtime == ""){
			}else if(starttime == ""){
			}else{
				var daylength = getDateDiff(starttime,endtime);
				$('#dayandmoney').html("<span style='font-size: 1.2em'>共计<span id='daylength' style='color: red'>"+daylength+"</span>天</span>"+
 				"<span style='font-size: 1.2em'>总费用:<span id='paymoney' style='color: red'>"+daylength*200+"</span>元</span>");
			}
			
		}); 
		
		
		
		function getDateDiff(date1,date2){
		        var arr1=date1.split('-');
			 var arr2=date2.split('-');
			 var d1=new Date(arr1[0],arr1[1],arr1[2]);
			 var d2=new Date(arr2[0],arr2[1],arr2[2]);
			 var daylength = (d2.getTime()-d1.getTime())/(1000*3600*24);
			 return daylength;
		}
		
		/* ----------------------------------------------第二个模块------------------------------------------------- */
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		$(document).on("click", "#modify_a", function(){
		$('#modify_a1').click(function(){
			$('#modify_ptusermsg').show();
			$('#modify_ptusermsg1').hide();
			$('#modify_ptusermsg2').hide();
			$('#modify_a1').css({'background-color':'rgb(253,129,0)','color':'white'});
			$('#modify_a2').css({'background-color':'rgb(243,243,243)','color':'black'});
			$('#modify_a3').css({'background-color':'rgb(229,229,229)','color':'black'});
			$('#modify_a4').css({'background-color':'rgb(243,243,243)','color':'black'});
		})
		$('#modify_a2').click(function(){
			$('#modify_ptusermsg').hide();
			$('#modify_ptusermsg1').show();
			$('#modify_ptusermsg2').hide();
			$('#modify_a1').css({'background-color':'rgb(229,229,229)','color':'black'});
			$('#modify_a2').css({'background-color':'rgb(253,129,0)','color':'white'});
			$('#modify_a3').css({'background-color':'rgb(229,229,229)','color':'black'});
			$('#modify_a4').css({'background-color':'rgb(243,243,243)','color':'black'});
		})
		$('#modify_a3').click(function(){
			$('#modify_ptusermsg').hide();
			$('#modify_ptusermsg1').hide();
			$('#modify_ptusermsg2').show();
			$('#modify_a1').css({'background-color':'rgb(229,229,229)','color':'black'});
			$('#modify_a2').css({'background-color':'rgb(243,243,243)','color':'black'});
			$('#modify_a3').css({'background-color':'rgb(253,129,0)','color':'white'});
			$('#modify_a4').css({'background-color':'rgb(243,243,243)','color':'black'});
		})
		$('#modify_a4').click(function(){
			$('#modify_a1').css({'background-color':'rgb(229,229,229)','color':'black'});
			$('#modify_a2').css({'background-color':'rgb(243,243,243)','color':'black'});
			$('#modify_a3').css({'background-color':'rgb(229,229,229)','color':'black'});
			$('#modify_a4').css({'background-color':'rgb(253,129,0)','color':'white'});
		})
		
		
	})
	
	$(function(){
	})
	
	</script>
</html>
