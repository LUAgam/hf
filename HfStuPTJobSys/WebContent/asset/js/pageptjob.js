$(document).ready(function() {
				
			var leixing = "";
			var zhonglei = "";
			var quyu = "";
			var condition = 0;//最新发布
			var searchtxt = '';
			
			
			$('#slidepic').slideBox({
		        duration : 0.3,//滚动持续时间，单位：秒
		        easing : 'linear',//swing,linear//滚动特效
		        delay : 5,//滚动延迟时间，单位：秒
		        hideClickBar : false,//不自动隐藏点选按键
		        clickBarRadius : 10,
		         hideBottomBar : true
		    });
			
			
			
			$('#ul_leixing').find('a[id=leixing]').each(function(i, a){
				$(a).click(function(e){
					var ul_selected = $(this).closest('ul');
					$(ul_selected).find('a[id=leixing]').each(function(i_inner, a_inner){
						if(a == a_inner){
							$(this).attr('style', 'background-color : rgb(255,153,0);color: white;');
							/* alert($(this).text()); */
							leixing = $(this).text();
						} else {
							$(this).attr('style', '');
						}
					});
					searchtxt = $('#searchtxt').val();
					conditionQuery(leixing,zhonglei,quyu,condition);
					return false;
				});
			});
			$('#ul_zhonglei').find('a[id=zhonglei]').each(function(i, a){
				$(a).click(function(e){
					var ul_selected = $(this).closest('ul');
					$(ul_selected).find('a[id=zhonglei]').each(function(i_inner, a_inner){
						if(a == a_inner){
							$(this).attr('style', 'background-color : rgb(255,153,0);color: white;');
							/* alert($(this).text()); */
							zhonglei = $(this).text();
						} else {
							$(this).attr('style', '');
						}
					});
					searchtxt = $('#searchtxt').val();
					conditionQuery(leixing,zhonglei,quyu,condition);
					return false;
				});
			});
			$('#ul_quyu').find('a[id=quyu]').each(function(i, a){
				$(a).click(function(e){
					var ul_selected = $(this).closest('ul');
					$(ul_selected).find('a[id=quyu]').each(function(i_inner, a_inner){
						if(a == a_inner){
							$(this).attr('style', 'background-color : rgb(255,153,0);color: white;');
							/* alert($(this).text()); */
								quyu = $(this).text();
						} else {
							$(this).attr('style', '');
						}
					});
					searchtxt = $('#searchtxt').val();
					conditionQuery(leixing,zhonglei,quyu,condition);
					return false;
				});
			});
	
	
			
			
			
			
			$("#msg_btn1").click(function() {
				$("#msg_btn1").css("background-color", "rgb(255,153,0)");
				$("#msg_font1").css("color", "white");
				$("#msg_btn2").css("background-color", "white");
				$("#msg_font2").css("color", "black");
				$("#msg_btn3").css("background-color", "white");
				$("#msg_font3").css("color", "black");
				$("#msg_btn4").css("background-color", "white");
				$("#msg_font4").css("color", "black");
				condition = 0;
				searchtxt = $('#searchtxt').val();
				conditionQuery(leixing,zhonglei,quyu,condition);
			});

			$("#msg_btn2").click(function() {
				$("#msg_btn1").css("background-color", "white");
				$("#msg_font1").css("color", "black");
				$("#msg_btn2").css("background-color", "rgb(255,153,0)");
				$("#msg_font2").css("color", "white");
				$("#msg_btn3").css("background-color", "white");
				$("#msg_font3").css("color", "black");
				$("#msg_btn4").css("background-color", "white");
				$("#msg_font4").css("color", "black");
				condition = 1;
				searchtxt = $('#searchtxt').val();
				conditionQuery(leixing,zhonglei,quyu,condition);
			});
			$("#msg_btn3").click(function() {
				$("#msg_btn1").css("background-color", "white");
				$("#msg_font1").css("color", "black");
				$("#msg_btn2").css("background-color", "white");
				$("#msg_font2").css("color", "black");
				$("#msg_btn3").css("background-color", "rgb(255,153,0)");
				$("#msg_font3").css("color", "white");
				$("#msg_btn4").css("background-color", "white");
				$("#msg_font4").css("color", "black");
				condition = 2;
				searchtxt = $('#searchtxt').val();
				conditionQuery(leixing,zhonglei,quyu,condition);
			});
			$("#msg_btn4").click(function() {
				$("#msg_btn1").css("background-color", "white");
				$("#msg_font1").css("color", "black");
				$("#msg_btn2").css("background-color", "white");
				$("#msg_font2").css("color", "black");
				$("#msg_btn3").css("background-color", "white");
				$("#msg_font3").css("color", "black");
				$("#msg_btn4").css("background-color", "rgb(255,153,0)");
				$("#msg_font4").css("color", "white");
				condition = 3;
				searchtxt = $('#searchtxt').val();
				conditionQuery(leixing,zhonglei,quyu,condition);
			});
			$("#searchtxtbtn").click(function() {
				searchtxt = $('#searchtxt').val();
				conditionQuery(leixing,zhonglei,quyu,condition);
			});
			
			
			
			
			
			
			
			
			
			
	
	
	
	
	
				/*var currentpage = 1;
				var pagesize = 10;
				console.log(currentpage);
				console.log(pagesize);
				var datatemp;
				$.ajax({
					type: 'GET',
					url: '../ptjob/getpage',
					data: {
						"currentpage" : currentpage,
						"pagesize": pagesize,
					},
					success: function(data) {
						var currentpage;
						var pagesize;
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
								for (var i = 0; i < children.length; i++) {
									children[i].remove();
								}
								$.ajax({
									type: 'post',
									url: '../ptjob/getpage',
									data: {
										"currentpage" : currentpage,
										"pagesize": pagesize,
									},
									success: function(data) {
										console.log("--------------currentpage"+currentpage);
										console.log(pagesize);
										console.log(data.totalrecord);
										totalrecord = data.totalrecord;
										console.log(data.pagesize);
										console.log(data.currentpage);
										console.log(data.totalpage);
										console.log(data.previouspage);
										console.log(data.pagebar);
										console.log(data.nextpage);
										var temp = eval("("+data+")");
										var data1 = data.list;
										for(var i=0;i<data1.length;i++){
											$("#table01").append(
													"<tr><td><img class='img-circle' src='../asset/img/jbtype/"+data1[i].imgurl+"'/>&nbsp;<a target='_Blank' href='../ptjob/getById?id="+ 
													data1[i].id +"'>" + "<font color='rgb(50,50,50)' face='微软雅黑'>" + data1[i].jbname+ "</font>" + 
													
													"</a></td width='260px'><td><span class='glyphicon glyphicon-map-marker'></span><font color='' face='微软雅黑'> &nbsp;" + data1[i].jbadress + 
													"</font></td><td width='100px'><span class='glyphicon glyphicon-user'></span><font color='' face='微软雅黑'>&nbsp;" + data1[i].quantity + 
													"</font></td><td width='150px'>&nbsp;&nbsp;<span class='glyphicon glyphicon-time'></span><font color='' face='微软雅黑'>&nbsp;" + data1[i].timedistance +
													"</font></td>");
										}
									},
								});
							}else{
								//-------------------------------------------------------
								var children = $("#table01").find("tr");
								for (var i = 0; i < children.length; i++) {
									children[i].remove();
								}
								
								for(var i=0;i<datatemp.length;i++){
									$("#table01").append(
											"<tr><td><img class='img-circle' src='../asset/img/jbtype/"+data1[i].imgurl+"'/>&nbsp;<a target='_Blank' href='../ptjob/getById?id="+ 
											data1[i].id +"'>" + "<font color='rgb(50,50,50)' face='微软雅黑'>" + data1[i].jbname+ "</font>" + 
											
											"</a></td width='260px'><td><span class='glyphicon glyphicon-map-marker'></span><font color='' face='微软雅黑'> &nbsp;" + data1[i].jbadress + 
											"</font></td><td width='100px'><span class='glyphicon glyphicon-user'></span><font color='' face='微软雅黑'>&nbsp;" + data1[i].quantity + 
											"</font></td><td width='150px'>&nbsp;&nbsp;<span class='glyphicon glyphicon-time'></span><font color='' face='微软雅黑'>&nbsp;" + data1[i].timedistance +
											"</font></td>");
								}
								
							}
						}
					}),
						console.log("--------------currentpage"+currentpage);
						console.log(pagesize);
						console.log(data.totalrecord);
						totalrecord = data.totalrecord;
						console.log(data.pagesize);
						console.log(data.currentpage);
						console.log(data.totalpage);
						console.log(data.previouspage);
						console.log(data.pagebar);
						console.log(data.nextpage);
						var temp = eval("("+data+")");
						var data1 = data.list;
						for(var i=0;i<data1.length;i++){
							$("#table01").append(
									"<tr><td><img class='img-circle' src='../asset/img/jbtype/"+data1[i].imgurl+"'/>&nbsp;<a target='_Blank' href='../ptjob/getById?id="+ 
									data1[i].id +"'>" + "<font color='rgb(50,50,50)' face='微软雅黑'>" + data1[i].jbname+ "</font>" + 
									
									"</a></td width='260px'><td><span class='glyphicon glyphicon-map-marker'></span><font color='' face='微软雅黑'> &nbsp;" + data1[i].jbadress + 
									"</font></td><td width='100px'><span class='glyphicon glyphicon-user'></span><font color='' face='微软雅黑'>&nbsp;" + data1[i].quantity + 
									"</font></td><td width='150px'>&nbsp;&nbsp;<span class='glyphicon glyphicon-time'></span><font color='' face='微软雅黑'>&nbsp;" + data1[i].timedistance +
									"</font></td>");
						}
					}
				});*/
				
			conditionQuery(leixing,zhonglei,quyu,condition);
				
				
			//-----------------------------------------------------------------------------------------------------	
				
				function conditionQuery(leixing,zhonglei,quyu,condition){
					var index = layer.load(0, {shade: false});
					var jbadress = quyu.trim();
					var jbtype = leixing.trim();
					var jbkind = zhonglei.trim();
					var condition = condition;
					
					$("#pageToolbar").empty();
					var childrendiv = $("#table01").find("div");
					for (var i = 0; i < childrendiv.length; i++) {
						children[i].remove();
					}
					var children = $("#table01").find("tr");
					for (var i = 0; i < children.length; i++) {
						children[i].remove();
					}
					
					
					var currentpage = 1;
					var pagesize = 10;
					var datatemp;
					
					$.ajax({
						type: 'GET',
						url: '../ptjob/getpage',
						data: {
							"jbadress" : jbadress,
							"jbtype" : jbtype,
							"jbkind" : jbkind,
							"currentpage" : currentpage,
							"pagesize": pagesize,
							"condition" : condition,
							"searchtxt" : searchtxt
						},
						success: function(data) {
							
							/*var currentpage;
							var pagesize;*/
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
									var childrendiv = $("#table01").find("div");
									for (var i = 0; i < childrendiv.length; i++) {
										children[i].remove();
									}
									var children = $("#table01").find("tr");
									for (var i = 0; i < children.length; i++) {
										children[i].remove();
									}
									$.ajax({
										type: 'post',
										url: '../ptjob/getpage',
										data: {
											"jbadress" : jbadress,
											"jbtype" : jbtype,
											"jbkind" : jbkind,
											"currentpage" : currentpage,
											"pagesize": pagesize,
											"condition" : condition,
											"searchtxt" : searchtxt
										},
										success: function(data) {
											totalrecord = data.totalrecord;
											/*var temp = eval("("+data+")");*/
											var data1 = data.list;
											for(var i=0;i<data1.length;i++){
														$("#table01").append(
																"<tr><td><img class='img-circle' src='../asset/img/jbtype/"+data1[i].imgurl+"'/>&nbsp;<a target='_Blank' href='../ptjob/getById?id="+ 
																data1[i].id +"&jbadress="+jbadress+"&jbtype="+jbtype+"&jbkind="+jbkind+"&condition="+condition+"'>" + "<font color='rgb(50,50,50)' face='微软雅黑'>" + data1[i].jbname+ "</font>" + 
																"</a></td><td id='td_"+data1[i].id+"'></td><td><span class='glyphicon glyphicon-map-marker'></span><font color='' face='微软雅黑'> &nbsp;" + data1[i].jbadress + 
																"</font></td><td><span class='glyphicon glyphicon-user'></span><font color='' face='微软雅黑'>&nbsp;" + data1[i].quantity + 
																"</font></td><td> <font color='red' face='微软雅黑'> &nbsp;"+ data1[i].distance +"km</font></td><td width='150px'>&nbsp;&nbsp;<span class='glyphicon glyphicon-time'></span><font color='' face='微软雅黑'>&nbsp;" + data1[i].timedistance +
																"</font></td>");
													if((data1[i].topjobstate == 1) && (condition == 0)){
														$('#td_'+data1[i].id).append("<span class='label label-warning'>置顶</span> ");
													}
													if(data1[i].quantity > 1000){
														$('#td_'+data1[i].id).append("<span class='label label-danger' style='background-color:rgb(235,81,34);'>hot!</span>");
													}
												
											}
											layer.close(index);
										},
									});
								}else{
									//-------------------------------------------------------
									var childrendiv = $("#table01").find("div");
									for (var i = 0; i < childrendiv.length; i++) {
										children[i].remove();
									}
									var children = $("#table01").find("tr");
									for (var i = 0; i < children.length; i++) {
										children[i].remove();
									}
									
									for(var i=0;i<datatemp.length;i++){
										$("#table01").append(
												"<tr><td><img class='img-circle' src='../asset/img/jbtype/"+data1[i].imgurl+"'/>&nbsp;<a target='_Blank' href='../ptjob/getById?id="+ 
												data1[i].id +"&jbadress="+jbadress+"&jbtype="+jbtype+"&jbkind="+jbkind+"&condition="+condition +"'>" + "<font color='rgb(50,50,50)' face='微软雅黑'>" + data1[i].jbname+ "</font>" + 
												
												"</a></td><td id='td_"+data1[i].id+"'></td><td><span class='glyphicon glyphicon-map-marker'></span><font color='' face='微软雅黑'> &nbsp;" + data1[i].jbadress + 
												"</font></td><td><span class='glyphicon glyphicon-user'></span><font color='' face='微软雅黑'>&nbsp;" + data1[i].quantity + 
												"</font></td><td> <font color='red' face='微软雅黑'> &nbsp;"+ data1[i].distance +"km</font></td><td width='150px'>&nbsp;&nbsp;<span class='glyphicon glyphicon-time'></span><font color='' face='微软雅黑'>&nbsp;" + data1[i].timedistance +
												"</font></td>");
										if((data1[i].topjobstate == 1) && (condition == 0)){
											$('#td_'+data1[i].id).append("<span class='label label-warning'>置顶</span> ");
										}
										if(data1[i].quantity > 1000){
											$('#td_'+data1[i].id).append("<span class='label label-danger' style='background-color:rgb(235,81,34);'>hot!</span>");
										}
									}
									layer.close(index);
								}
							}
						}),
							totalrecord = data.totalrecord;
							/*var temp = eval("("+data+")");*/
							var data1 = data.list;
							if(data1.length > 0){
								for(var i=0;i<data1.length;i++){
										$("#table01").append(
												"<tr><td><img class='img-circle' src='../asset/img/jbtype/"+data1[i].imgurl+"'/>&nbsp;<a target='_Blank' href='../ptjob/getById?id="+ 
												data1[i].id +"&jbadress="+jbadress+"&jbtype="+jbtype+"&jbkind="+jbkind+"&condition="+condition +"'>" + "<font color='rgb(50,50,50)' face='微软雅黑'>" + data1[i].jbname+ "</font>" + 
												"</a></td><td id='td_"+data1[i].id+"'></td><td><span class='glyphicon glyphicon-map-marker'></span><font color='' face='微软雅黑'> &nbsp;" + data1[i].jbadress + 
												"</font></td><td><span class='glyphicon glyphicon-user'></span><font color='' face='微软雅黑'>&nbsp;" + data1[i].quantity + 
												"</font></td><td > <font color='red' face='微软雅黑'> &nbsp;"+ data1[i].distance +"km</font></td><td width='150px'>&nbsp;&nbsp;<span class='glyphicon glyphicon-time'></span><font color='' face='微软雅黑'>&nbsp;" + data1[i].timedistance +
												"</font></td>");
									if((data1[i].topjobstate == 1) && (condition == 0)){
										$('#td_'+data1[i].id).append("<span class='label label-warning'>置顶</span> ");
									}
									if(data1[i].quantity > 1000){
										$('#td_'+data1[i].id).append("<span class='label label-danger' style='background-color:rgb(235,81,34);'>hot!</span>");
									}
								}
								layer.close(index);
							}else{
								$("#table01").append(
										"<div style='width: 100%;height: 800px;border-top: 1px solid gainsboro;margin: 0 auto;background-color: ghostwhite;'>"
										+"<div style='line-height: 400px;float: left;width: 15%;height: 400px;'>"
										+"</div>"
										+"<div style='line-height: 400px;float: left;'>"
											+"<img src='../asset/img/cry.png' style='width: 120px;height: 140px;'/>"
										+"</div>"
										+"<div style='line-height: 400px;float: left;'>"
											+"<span style='font-size: 2em;font-family: '黑体';'>"
												+"没有要找到你要找的信息"
											+"</span>"
										+"</div>"
									+"</div>");
								layer.close(index);
							}
							
						}
					});
					
					
				}
				
				
				
				
				
				
				
				
				
				
				
	
			});
