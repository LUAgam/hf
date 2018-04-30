<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="shortcut icon" href="../asset/xjzsys.ico"/>
		<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap-theme.css"/>
		<link rel="stylesheet" type="text/css" href="../asset/css/webpage.css" />
		<link rel="stylesheet" type="text/css" href="../asset/css/paging.css"/>
		<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="../asset/css/register.css" />
		<link rel="stylesheet" type="text/css" href="../asset/layui/css/layui.css" />
		<script src="../asset/js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/query.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/paging.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/layer/layer.js" type="text/javascript" charset="utf-8"></script>
		
		<style type="text/css">
			#table01 th{
				text-align: center;
			}
			#table01 td{
				text-align: center;
				font-family: '微软雅黑';
			}
			.money_color{
				color: #70CC74;
				font-weight: 600;
			}
		</style>

		
	</head>

	<body style="width: 1440px">
		<div class="webpage_top">
			<div class="webpage_top_center">
				<div class="webpage_top_center_left">
					<span style="font-family: '微软雅黑';font-size: 1.1em;color: red;">合肥</span>
					<span><a href="" style="font-family: '微软雅黑';color: gray;">[切换城市]</a></span>
				</div>
				<div id="webpage_top_center_right" class="webpage_top_center_right">
					<a href="${pageContext.request.contextPath}/page/webpage" style="">首页</font></a>
					<!-- <a href="#" style="">申请合作</a>
					<a href="#" style="">推广</a> -->
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
		<!-- <div class="webpage_center">
			<div class="webpage_center_search">
				<div class="webpage_center_search_left">
					<img style="width: 200px;height: 80px;" src="../asset/img/logo.png" />
				</div>
				<div id="webpage_center_search_center" style="margin-top:0px;" class="webpage_center_search_center">
					<ul>
						<li><span style="font-family: '微软雅黑';font-size: 1.5em;color: rgb(225,104,30);">我的钱包</span></li>
					</ul>
				</div>
			</div>
		</div> -->
		<div class="register_center">
			<div class="register_center_main">
				<div class="register_center_top_1" id="register_center_top_1">
					<ul>
						<li><span style="color: white;">我的钱包</span></li>
					</ul>
				</div>
				<div class="register_center_top_main" style="margin-top: 20px" id="">
					账户余额：<span id="balance_" class="money_color" style="color:red;font-size: 2em">${balance}</span>
					<span class="money_color" style="color:gray;font-size: 2em">(RMB)</span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="btn_getbalance" type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-refresh">
					</span></button>
					</br></br>
					<div style="">
						<button type="button" class="btn btn-info" id="rechargemoney">账户充值</button>
						<button type="button" class="btn btn-success">开通会员</button>
					</div>
				</div></br></br>
					账单明细:</br></br>
				<div class="register_center_top_main" id="rechargelist" style="border-top:1px solid gray; " id="">
					<table id="table01" class="table table-hover" >
						<tr>
							<th> <span style="float:left;">交易号</span></th>
							<th>业务</th>
							<th>时间</th>
							<th>收入</th>
							<th>状态</th>
						</tr>
						<tr>
							<td><span style="float:left;">111111111111111111</span></td>
							<td>钱包充值</td>
							<td>2017-04-30 13:50:30</td>
							<td><span class="money_color">100.00</span></td>
							<td>充值成功</td>
						</tr>
					</table>	
					<div style="" id="pageToolbar"></div>
				</div>
				</div>
		</div>
		<div class="register_center_foot"></div>
					
	</body>
	<script type="text/javascript">
		$(function(){
			
			var currentpage = '';
		 	currentpage = ajax_table(1);
		 	
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
					url: '../accountrecord/getrecordlist',
					data: {
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
									url: '../accountrecord/getrecordlist',
									data: {
										"currentpage" : currentpage,
										"pagesize": pagesize,
									},
									success: function(data) {
										totalrecord = data.totalrecord;
										/*var temp = eval("("+data+")");*/
										var data1 = data.list;
										for(var i=0;i<data1.length;i++){
											$("#table01").append(
													"<tr>"+
													"<td><span style='float:left;'>"+data1[i].serialnumber+"</span></td>"+
													"<td>"+data1[i].moneymsg+"</td>"+
													"<td>"+data1[i].changetime+"</td>"+
													"<td><span class='money_color'>"+data1[i].changemoney+"</span></td>"+
													"<td>充值成功</td>"+
													"</tr>"
													);
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
											"<tr>"+
											"<td><span style='float:left;'>"+datatemp[i].serialnumber+"</span></td>"+
											"<td>"+datatemp[i].moneymsg+"</td>"+
											"<td>"+datatemp[i].changetime+"</td>"+
											"<td><span class='money_color'>"+datatemp[i].changemoney+"</span></td>"+
											"<td>充值成功</td>"+
											"</tr>"
											);
								}
								
							}
						}
					}),
						totalrecord = data.totalrecord;
						/*var temp = eval("("+data+")");*/
						var data1 = data.list;
						for(var i=0;i<data1.length;i++){
							$("#table01").append(
									"<tr>"+
									"<td><span style='float:left;'>"+datatemp[i].serialnumber+"</span></td>"+
									"<td>"+datatemp[i].moneymsg+"</td>"+
									"<td>"+datatemp[i].changetime+"</td>"+
									"<td><span class='money_color'>"+datatemp[i].changemoney+"</span></td>"+
									"<td>充值成功</td>"+
									"</tr>");
						}
					}
				});
				
				return currentpage;
			}
			$('#btn_getbalance').click(function(){
				$.ajax({
					type: 'post',
					url: '../accountrecord/getbalance',
					success: function(data) {
						
						$('#balance_').html(data.balance);
						
					}
					
				})
				
			});
			$('#rechargemoney').click(function(){
				
					  layer.prompt({title: '请输入充值金额'}, function(val, index){
					    var r = new RegExp("^\\d+(\\.\\d+)?$");
					    if(r.test(val)){
					    	layer.close(index);
					    	/* window.location.href = '${pageContext.request.contextPath }/servlet/returnbankjsp?money='+val;   */  	
					    	   var index = layer.open({
					    		  type: 2,
					    		  content: '${pageContext.request.contextPath }/servlet/returnbankjsp?money='+val+'&orderid=0',
					    		  area: ['1200px', '600px'],
					    		  maxmin: true
					    		}); 
					    	/* layer.open({
					    		  type: 2 //此处以iframe举例
					    		  ,title: '当你选择该窗体时，即会在最顶端'
					    		  ,area: ['800px', '800px']
					    		  ,shade: 0
					    		  ,offset: [ //为了演示，随机坐标
					    		    300
					    		    ,300
					    		  ]
					    		  ,maxmin: true
					    		  ,content: '${pageContext.request.contextPath }/servlet/returnbankjsp?money='+val
					    		  ,btn: ['继续弹出', '全部关闭'] //只是为了演示
					    		  ,yes: function(){
					    			  
					    		  }
					    		  ,btn2: function(){
					    		    layer.closeAll();
					    		  }
					    		  ,zIndex: layer.zIndex //重点1
					    		  ,success: function(layero){
					    		    layer.setTop(layero); //重点2
					    		  }
					    		}); */
					    	
					    }else{
					    	 layer.msg('请输入整数或小数'); 
					    }
					  });
				
			})
			
			
			
		})
	
	
	</script>
	

</html>