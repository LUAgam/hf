<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="../asset/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="../asset/css/main.css" />
		<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap.min.css"/>
		<script src="../asset/js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/bootstrap-czy/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/layui/lay/dest/layui.all.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/layui/lay/modules/laydate.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			a:hover{
				text-decoration: none;
			}
		</style>
	</head>

	<body>
			<div class="layui-tab">
			  <ul class="layui-tab-title">
			    <li></li>
			    <li></li>
			    <li id='notverify' class="layui-this"><button class="layui-btn layui-btn-normal" value='0'>申诉列表</button></li>
			    <li><button id='alreadysuccess' class="layui-btn layui-btn-normal" value='1'>已处理</button></li>
			  </ul>
			   <div class="layui-form-pane" style="float: right;margin-top:-50px;">
				  <div class="layui-form-item">
				    <div class="layui-input-inline">
				      <input class="layui-input" placeholder="开始日" id="LAY_demorange_s" style="">
				    </div>
				    <div class="layui-input-inline">
				      <input class="layui-input" placeholder="截止日" id="LAY_demorange_e">
				    </div>
				    <button id="btn_datesearch" type="button" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
				  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				  </div>
				  
				</div>  
			  <div class="layui-tab-content">
			  	<div class="layui-tab-item"></div>
			  	<div class="layui-tab-item"></div>
			    <div class="layui-tab-item layui-show">申诉列表
			    	<table class="table table-hover">
			    		 <thead>
						    <tr>
						      <th>编号</th>
						      <th>职位名称</th>
						      <th>商家名称</th>
						      <th>申诉时间</th>
						      <th>申诉用户</th>
						      <th>联系方式</th>
						      <th>操作</th>
						    </tr> 
						  </thead>
						  <tbody id="table01">
						    <tr>
						      <td>1</td>
						      <td>明珠广场发传单</td>
						      <td>合肥学院蜀山区南艳湖校区</td>
						      <td>2016-11-29 12:30:30</td>
						      <td>沈亮亮</td>
						      <td>15056002785</td>
						      <td> <a href='' class='layui-btn layui-btn-normal layui-btn-mini'>职位预览</a> 
						      	<a href='javascript:void(0);'  data-opt='edit' class='layui-btn layui-btn-mini' style="background-color: #5FB878;">
						      		已处理&nbsp;<span class="glyphicon glyphicon-ok"></span></a>
						      </td>
						    </tr>
						  </tbody>
					</table>
			    <div id='page01'></div>
			    
			    
			    </div>
			    <div class="layui-tab-item">已处理
			    	<table class="table table-hover">
			    		 <thead>
						    <tr>
						      <th>编号</th>
						      <th>职位名称</th>
						      <th>商家名称</th>
						      <th>申诉时间</th>
						      <th>申诉用户</th>
						      <th>联系方式</th>
						      <th>处理时间</th>
						      <th>操作</th>
						    </tr> 
						  </thead>
						  <tbody id="table02">
						    <tr>
						      <td>1</td>
						      <td>服务员</td>
						      <td>明珠广场发传单</td>
						      <td>2016-11-29 12:30:30</td>
						      <td>合肥学院蜀山区南艳湖校区</td>
						      <td>安徽省XX科技有限公司</td>
						      <td> <a href='' class='layui-btn layui-btn-normal layui-btn-mini'>预览</a> 
						      	<!--<a href='javascript:;'  data-opt='edit' class='layui-btn layui-btn-mini'>编辑</a>--> 
						      	<a href='javascript:;' data-opt='del' class='layui-btn layui-btn-danger layui-btn-mini'>下架</a>
						      </td>
						    </tr>
						  </tbody>
			    		
					</table>
			    
			    	<div id='page02'></div>
			    </div>
			  </div>
			</div>
			 
			 
			 
			 
			<script>
			//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
			layui.use('element', function(){
			  var element = layui.element();
			  //…
			});
			layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  
			  var start = {
			    min: laydate.now()
			    ,max: '2099-06-16 23:59:59'
			    ,istoday: false
			    ,choose: function(datas){
			      end.min = datas; //开始日选好后，重置结束日的最小日期
			      end.start = datas //将结束日的初始值设定为开始日
			    }
			  };
			  
			  var end = {
			    min: laydate.now()
			    ,max: '2099-06-16 23:59:59'
			    ,istoday: false
			    ,choose: function(datas){
			      start.max = datas; //结束日选好后，重置开始日的最大日期
			    }
			  };
			  
			  document.getElementById('LAY_demorange_s').onclick = function(){
			    start.elem = this;
			    laydate(start);
			  }
			  document.getElementById('LAY_demorange_e').onclick = function(){
			    end.elem = this
			    laydate(end);
			  }
			  
			});
			
			</script>
			
			
			
	</body>
	<script type="text/javascript">
		$(function(){
			
			var startdate = $('#LAY_demorange_s').val();
			var enddate = $('#LAY_demorange_e').val();
			var data_ = {'state':0,'startdate':startdate,'enddate':enddate};
			var url_ = '';
			var btnval = '0';
			
			function getlist(data_,url_){
				$.ajax({
					type:"post",
					url:url_,
					data:data_,
					success:function(data){
					},
				});
			};
			function getbtnid(btnid,url_,state){
				console.log(btnid);
				btnval = $('#'+btnid).val();
				console.log(btnval);
				startdate = $('#LAY_demorange_s').val();
				enddate = $('#LAY_demorange_e').val();
				data_ = {'state':state,'startdate':startdate,'enddate':enddate};
				url_ = '';
				getlist(data_,url_);
			};
		$('#notverify').click(function(){
			loadlist();
		});	
		$('#alreadysuccess').click(function(){
			layui.use(['laypage', 'layer'], function(){
				  var laypage = layui.laypage
				  ,layer = layui.layer;
				  var state = 1;
					  var nums = 8; //每页出现的数据量
					  var length = '';
					  $.ajax({
							type:"post",
							url:"../complain/getcountcomplain",
							data:{
								'state':state,
							},
							success:function(data){
								nums = data.count;
								//调用分页
								  laypage({
								    cont: 'page02'
								    ,skin: '#1E9FFF'
								    ,pages: Math.ceil(length/nums) //得到总页数
								    ,jump: function(obj){
								    	var index = layer.load(0, {
											  shade: [0.2,'#fff'] //0.1透明度的白色背景
											});
					//			    	layer.msg('第 '+ obj.curr +' 页');
										$.ajax({
											type:"post",
											url:"../complain/getallcomplain",
											data:{
												'startindex':nums*(obj.curr-1),
												'pagesize':nums,
												'state':state,
											},
											success:function(data){
												$('#table02').empty();
										    	for(var i=0;i<data.length;i++){
										    		$('#table02').append(
										    		"<tr>"
												      +"<td>"+((obj.curr-1)*nums+(i+1))+"</td>"
												      +"<td>"+data[i].ptjobname+"</td>"
												      +"<td>"+data[i].businessname+"</td>"
												      +"<td>"+data[i].complaintime+"</td>"
												      +"<td>"+data[i].ptusername+"</td>"
												      +"<td>"+data[i].ptusertel+"</td>"
												      +"<td>"+data[i].handletime+"</td>"
												      +"<td> <a target='_Blank' href='../ptjob/getById?id="+data[i].ptjobid+"' class='layui-btn layui-btn-normal layui-btn-mini'>预览</a> "
												      	+"<a href='javascript:void(0);' id='ptjobcomplainmsg' complain='"+data[i].complain+"' ptusername='"+data[i].ptusername+"' data-opt='del' class='layui-btn layui-btn-danger layui-btn-mini'>详情 </a>"
												    +"</tr>");
										    	};
										    	layer.close(index);
											},
										});
									
									    }
									  });
							},
						});
					  
					});
			
			
		});
		$('#btn_datesearch').click(function(){
			console.log('btn_datesearch');
			console.log(btnval);
			startdate = $('#LAY_demorange_s').val();
			enddate = $('#LAY_demorange_e').val();
			data_ = {'state':0,'startdate':startdate,'enddate':enddate};
			url_ = '';
			getlist(data_,url_);
		});	
		loadlist();
		function loadlist(){
			layui.use(['laypage', 'layer'], function(){
				  var laypage = layui.laypage
				  ,layer = layui.layer;
				  var state = 0;
					  var nums = 8; //每页出现的数据量
					  var length = '';
					  $.ajax({
							type:"post",
							url:"../complain/getcountcomplain",
							data:{
								'state':state,
							},
							success:function(data){
								nums = data.count;
								 //调用分页
								  laypage({
								    cont: 'page01'
								    ,skin: '#1E9FFF'
								    ,pages: Math.ceil(length/nums) //得到总页数
								    ,jump: function(obj){
								    	var index = layer.load(0, {
											  shade: [0.2,'#fff'] //0.1透明度的白色背景
											});
					//			    	layer.msg('第 '+ obj.curr +' 页');
										$.ajax({
											type:"post",
											url:"../complain/getallcomplain",
											data:{
												'startindex':nums*(obj.curr-1),
												'pagesize':nums,
												'state':state,
											},
											success:function(data){
												$('#table01').empty();
										    	for(var i=0;i<data.length;i++){
										    		$('#table01').append(
										    		"<tr>"
												      +"<td>"+((obj.curr-1)*nums+(i+1))+"</td>"
												      +"<td>"+data[i].ptjobname+"</td>"
												      +"<td>"+data[i].businessname+"</td>"
												      +"<td>"+data[i].complaintime+"</td>"
												      +"<td>"+data[i].ptusername+"</td>"
												      +"<td>"+data[i].ptusertel+"</td>"
												      +"<td> <a target='_Blank' href='../ptjob/getById?id="+data[i].ptjobid+"' class='layui-btn layui-btn-normal layui-btn-mini'>预览</a> "
												      	+"<a href='javascript:void(0);' id='ptjobcomplainmsg' complain='"+data[i].complain+"' ptusername='"+data[i].ptusername+"' data-opt='del' class='layui-btn layui-btn-danger layui-btn-mini'>详情 </a>"
												      +"<a href='javascript:void(0);' id='handle_' complainid='"+data[i].id+"' data-opt='edit' class='layui-btn layui-btn-mini' style='background-color: #5FB878;'>"+
											      		"已处理&nbsp;<span class='glyphicon glyphicon-ok'></span></a></td>"+
												    +"</tr>");
										    	};
										    	layer.close(index);
											},
										});
									
									    }
									  });
							},
						});
					  
					});
		}
				$(document).on("click","#ptjobcomplainmsg",function(){
					
					var complain = $(this).attr('complain');
					var ptusername = $(this).attr('ptusername');
					layer.open({
						  type: 1,
						  title:ptusername+"投诉内容:",
						  skin: 'layui-layer-molv', //样式类名
						  area: ['380px', '200px'], 
						  closeBtn: 0, //不显示关闭按钮
						  anim: 2,
						  shadeClose: true, //开启遮罩关闭
						  content: "<p>"+complain+"</p>"
						});
					
				})
				$(document).on("click","#handle_",function(){
					var complainid = $(this).attr('complainid');
					var this_ =  $(this);
					$.ajax({
						type:"post",
						url:"../complain/changecomplainstate",
						data:{
							'complainid':complainid,
							'state':1,
						},
						success:function(data){
							
							layer.msg('已处理 ');
							this_.parent().parent().remove();
							
						},
					});
					
				})
		
		
		
		})
		
		
		
	</script>
	


</html>