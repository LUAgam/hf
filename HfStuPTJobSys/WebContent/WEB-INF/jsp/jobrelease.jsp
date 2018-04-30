<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>发布职位</title>
		<link rel="shortcut icon" href="../asset/xjzsys.ico"/>
		<link rel="stylesheet" type="text/css" href="../asset/css/webpage.css" />
		<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="../asset/css/register.css" />
		<link rel="stylesheet" type="text/css" href="../asset/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="../asset/css/jobreleaser.css" />
		<link rel="stylesheet" type="text/css" href="../asset/jedate-czy/skin/jedate.css" />

		<!--<link rel="stylesheet" type="text/css" href="layer/skin/default/layer.css"/>-->
		<link rel="stylesheet" type="text/css" href="../asset/layer/skin/default/layer.css" />
		<link rel="stylesheet" type="text/css" href="../asset/css/login.css" />
		<script src="../asset/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/bootstrap-czy/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/jquery.validate.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/layer/layer.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/jedate-czy/jquery.jedate.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/jquery.cityselect.js" type="text/javascript" charset="utf-8"></script>
		
		 <script type="text/javascript" charset="utf-8" src="../asset/js/ueditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="../asset/js/ueditor.all.min.js"> </script>
	    <script type="text/javascript" charset="utf-8" src="../asset/js/zh-cn.js"></script>
	    
	    	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=nNid3BNgQgYwWQG0UIkt6bPCxUcv1Gbs"></script>
	    
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
		<div class="webpage_center" style="border-bottom: 2px solid rgb(252,150,5);">
			<div class="webpage_center_search">
				<div class="webpage_center_search_left">
					<img style="width: 200px;height: 80px;" src="../asset/img/logo.png" />
				</div>
				<div id="webpage_center_search_center" style="margin-top:0px;" class="webpage_center_search_center">
					<ul>
						<li><span style="font-family: '微软雅黑';font-size: 1.5em;color: rgb(225,104,30);">发布职位</span></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="jobrelease_top_citytitle">
			<span id="">
					<a href="" style="font-size: 1em;font-family: '微软雅黑';color: #2B669A;">大学生职位平台></a>
			</span>
			<span id="" style="font-family: '微软雅黑';color: gray;">
					发布职位
			</span>
		</div>
		<div class="jobrelease_center">
			
			<form id="submit_form" action="" method="post" >
				
			<div class="jobrelease_center_title">
				&nbsp;&nbsp;
				<font color="#666666">填写详情</font>
			</div>
			<div class="jobrelease_center_text">
					<div class="jobrelease_center_form_text_1">
						职位标题：<input id="jbname" name="jbname" type="text" placeholder="请输入职位标题" />
					</div>
					<div class="jobrelease_center_form_text_1">
						职位种类：<select id="jbkind" name="jbkind">
									<option>其他</option>
									<option>家教</option>
									<option>安保</option>
									<option>促销</option>
									<option>服务员</option>
									<option>送餐员</option>
									<option>客服</option>
								 </select>
					</div>
					<div class="jobrelease_center_form_text_1">
						职位类型：<select id="jbtype" name="jbtype">
									<option>短期职位</option>
									<option>长期职位</option>
									<option>周末职位</option>
									<option>全职职位</option>
								 </select>
					</div>
					<div class="jobrelease_center_form_text_1">
						招聘人数：<input id="recnum" name="recnum" type="text" placeholder="请输入人数" style="width: 100px;" />人
					</div>
					<div class="jobrelease_center_form_text_1">
						工资待遇：<input id="salary" name="salary" type="text" placeholder="请输入人数" style="width: 100px;" />
						<select id="jbtimetype" name="jbtimetype" style="width: 80px;">
										<option value="0">元/天</option>
										<option value="1">元/小时</option>
										<option value="2">元/月</option>
									</select>
					</div>
					<div class="jobrelease_center_form_text_1" style="position: relative;">
						工作时间：<input id="inpstart"  name="inpstart" type="text" class="workinput wicon mr25" id="inpstart" style="width: 120px" readonly>
						 至
						<input id="inpend" name="inpend"  type="text" class="workinput wicon mr25" id="inpend" style="width: 120px" readonly>
					</div>
					<div class="jobrelease_center_form_text_1" style="position: relative;">
						上班时间：<input id="starttime" name="starttime" class="workinput wicon mr25"  type="text" placeholder="输入开始时间"  style="width: 120px" readonly>
						至
						<input id="endtime" name="endtime" class="workinput wicon mr25"  type="text" placeholder="输入开始时间"  style="width: 120px" readonly>
					</div>
					<div class="jobrelease_center_form_text_1">
						<div >
							职位描述： 
						</div>
						<script id="textarea_1" type="text/plain" style="width:600px;height:300px;margin-left: 70px"></script>
						 <!-- <button onclick="getContent()">获得内容</button>  -->
						
						<!-- <textarea id="textarea_1" name="textarea_1" style="width: 600px;height: 60px;margin-top: -16px;margin-left: 70px;"
							 placeholder="请输入职位日期，职位时间，职位具体信息，工资待遇，工作要求等等"></textarea> -->
					</div>
				
			</div>
			<div class="jobrelease_center_title" style="margin-top: 30px;">
				&nbsp;&nbsp;
				<font color="#666666">工作对接</font>
			</div>
			<div class="jobrelease_center_text">
				<div class="jobrelease_center_form_text_1">
						简历邮箱：<input id="eamil" name="eamil" type="text" value="${business.email}" readonly="readonly" />
				</div>
				<div class="jobrelease_center_form_text_1">
				 &nbsp;&nbsp;&nbsp; 联系人：<input name="name" type="name" value="${business.contacts }" readonly="readonly"/>
				</div>
				<div class="jobrelease_center_form_text_1">
						咨询电话：<input id="phone" name="phone" type="text" value="${business.phone }" readonly="readonly"/>
				</div>
			</div>
			<div class="jobrelease_center_title" style="margin-top: 30px;">
				&nbsp;&nbsp;
				<font color="#666666">工作地点</font>
			</div>
			<div class="jobrelease_center_text">
				<div class="jobrelease_center_form_text_1">
						工作地点：<div id="city" style="margin-left: 70px;margin-top: -25px;">
							<select class="prov" id="prov"></select>
							<select class="city" id="cityname" disabled="disabled"></select>
							<select class="dist" id="dist" disabled="disabled"></select>
						 </div>
				</div>
			</div>
			<div class="jobrelease_center_text">
				<div class="jobrelease_center_form_text_1">
						 具体地址：<input type="text" id="suggestId" size="20" value="百度" style="width:150px;" />
						<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
				</div>
					<!-- <div id="r-result">请输入:<input type="text" id="suggestId" size="20" value="百度" style="width:150px;" /></div>
					<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div> -->
			</div>
			<div class="jobrelease_center_text">
				<div class="jobrelease_center_form_text_1">
						地图标记：
								 <div id="l-map" class="jobrelease_map"></div>
				</div>
			</div>
			<div id="jobrelease_center_text_btn" class="jobrelease_center_text">
				
				<button id="btn_submit" type="submit"  class="layui-btn layui-btn-warm layui-btn-small">
					<span style="font-family: '微软雅黑';font-size:1.3em ;">
						点击发布
					</span>
				</button>
				
			</div>
			</form>
		</div>
		<div class="register_center_foot">
		
		</div>
		<input type="text" id="lngandlat" hidden="true" value="">
	</body>
	<script type="text/javascript">
	// 百度地图API功能
	function G(id) {
		return document.getElementById(id);
	}

	var map = new BMap.Map("l-map");
	map.centerAndZoom("合肥",12);                   // 初始化地图,设置城市和地图级别。
	setTimeout(function(){
		map.setZoom(14);   
	}, 2000);  //2秒后放大到14级
	map.enableScrollWheelZoom(true);
	var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
		{"input" : "suggestId"
		,"location" : map
	});

	ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
	var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
		
		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
		G("searchResultPanel").innerHTML = str;
	});

	var myValue;
	ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
	var _value = e.item.value;
		myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
		//获取经纬度
		var myGeo = new BMap.Geocoder();
		// 将地址解析结果显示在地图上,并调整地图视野
		myGeo.getPoint(myValue, function(point){
			if (point) {
	          var lngandlat_ = point.lng+","+point.lat
	          document.getElementById("lngandlat").value=lngandlat_;
				map.centerAndZoom(point, 16);
				map.addOverlay(new BMap.Marker(point));
			}else{
				alert("您选择地址没有解析到结果!");
			}
		}, "合肥市");
		//---------------------------------
		setPlace();
	});

	function setPlace(){
		map.clearOverlays();    //清除地图上所有覆盖物
		function myFun(){
			var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
			map.centerAndZoom(pp, 18);
			map.addOverlay(new BMap.Marker(pp));    //添加标注
		}
		var local = new BMap.LocalSearch(map, { //智能搜索
		  onSearchComplete: myFun
		});
		local.search(myValue);
	}
</script>
	
	
	
	<script type="text/javascript">
		var ue = UE.getEditor('textarea_1');
		 /*  function getContent() {
		        var arr = [];
		        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
		        arr.push("内容为：");
		        arr.push(UE.getEditor('textarea_1').getContent()); 
		        alert(arr.join("\n"));
		    }  */
	
		$(function(){
			$("#city").citySelect({prov:"安徽", city:"合肥", dist:"蜀山区"});
			/*  $("#textarea_1").hover(function(){
				 alert('aaaa');
				$("#textarea_1").css({"height":"300px","border": "1px solid #1E9FFF",});
			},function(){
				$("#textarea_1").css({"height":"100px","border": "1px solid rgb(169,169,169)",});
			});  */
			/*$("#textarea_1").hover(function(){
				$("#textarea_1").css({"height":"150px","border": "1px solid #1E9FFF",});
			});*/
			
		})
		
	
		var start = {
			format: 'YYYY-MM-DD',
			minDate: $.nowDate(0), //设定最小日期为当前日期
			isinitVal: true,
			festival: true,
			ishmsVal: false,
			maxDate: '2099-06-30', //最大日期
			choosefun: function(elem, datas) {
				end.minDate = datas; //开始日选好后，重置结束日的最小日期
			}
		};
		var end = {
			format: 'YYYY-MM-DD',
			minDate: $.nowDate(0), //设定最小日期为当前日期
			festival: true,
			maxDate: '2099-06-16', //最大日期
			choosefun: function(elem, datas) {
				start.maxDate = datas; //将结束日的初始值设定为开始日的最大日期
			}
		};
		$.jeDate("#starttime",{
			format:"hh:mm"
		});
		$.jeDate("#endtime",{
			format:"hh:mm"
		});
		
		
		$('#inpstart').jeDate(start);
		$('#inpend').jeDate(end);
		
		
		 jQuery.validator.addMethod("isMobile", function(value, element) {  
				 var length = value.length;
			      return this.optional(element) || (length == 11 && /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test(value));    
			    }, "请正确填写您的手机号码。");
		
		 $("#submit_form").validate({
			 
			
			            	 submitHandler:function(form){
			            	 	var jbkind = $("#jbkind").val();
			            	 	var jbtype = $("#jbtype").val();
			            		var jbname = $("#jbname").val();
			        		    var recnum = $("#recnum").val();
			        			var salary = $("#salary").val();
			        			var jbtimetype = $("#jbtimetype").val();
			        			var inpstart = $("#inpstart").val();
			        			var inpend = $("#inpend").val();
			        			var starttime = $("#starttime").val();
			        			var endtime = $("#endtime").val();
			        			/* var textarea_1 = $("#textarea_1").val(); */
			        			var textarea_1 = UE.getEditor('textarea_1').getContent()
			        			var eamil = $("#eamil").val();
			        			var name = $("#name").val();
			        			var phone = $("#phone").val();
			        			var suggest = $("#suggestId").val();//具体地址
			        			var city = $("#prov").val()+'-'+$("#cityname").val()+'-'+$("#dist").val();
			        			var jbadress = $("#dist").val(),
			        			 	lngandlat = $("#lngandlat").val();
			        			/* alert(jbkind+'---'+jbname+'---'+city+'---'+recnum+'---'+salary+'---'+jbtimetype+'---'+inpstart+'---'+inpend+'---'+starttime);
			                    */ //验证通过后可提交表单
			                    //form.submit();
			                    //ajax提交
			                    	/* form.submit(); */
			                    	
			                    	 $.ajax({
				                        url:"../ptjob/addptjob",
				                        type:'post',
				                        data: {
				                        	"jbkind" : jbkind,
				                        	"jbtype" : jbtype,
				                        	"jbname" : jbname,
				                        	"recnum" : recnum,
				                        	"salary" : salary,
				                        	"jbtimetype" : jbtimetype,
				                        	"inpstart" : inpstart,
				                        	"inpend" : inpend,
				                        	"starttime" : starttime,
				                        	"jbadress" : jbadress,
				                        	"endtime" : endtime,
				                        	"jbdetails" : textarea_1,
				                        	"eamil" : eamil,
				                        	"name" : name,
				                        	"phone" : phone,
				                        	"city" : city,
				                        	"suggest" : suggest,
				                        	"lngandlat" : lngandlat,
				    						/*"username" : username,
				    						"password" : password,
				    						"state" : state*/
				    					},
				    					success : function(data){
				    						
				    						if(data.msg == '1'){
				    							layer.msg('发布成功', {icon: 1});
				    							$('#btn_submit').removeClass("layui-btn-warm");
				    							$('#btn_submit').addClass("layui-btn-disabled");
				    							window.location.href='../page/jobrelease';
				    						}
				    						if(data.msg == '2')
				    							layer.msg('发布失败，原因未知', {icon: 1});
				    						
				    					},
				    					
				    					
				                        beforeSend:function () {
				                            //在表单提交后后端未作出响应时，禁用提交按钮，提高用户体验。
				                            $("#btn1").attr({ disabled: "disabled" });
				                        },
				                        complete:function(){
				                            //后端响应后放开按钮
				                            $("#btn1").removeAttr("disabled");
				                        },
				                        /* success:function(data){
				                        	var temp = data;
				                        	layer.alert(''+temp+'', {icon: 6});  
				                        } */

				                    }); 
			                
			                    
			                    
			                }, 
			                
			                rules:{
			                	jbname:{
			                        required:true,
			                    },
			                    recnum:{
			                        required:true,
			                        digits:true,
			                    },
			                    salary:{
			                        required:true,
			                        digits:true,
			                    },
			                    inpend:{
			                        required:true,
			                    },
			                    starttime:{
			                        required:true,
			                    },
			                    endtime:{
			                        required:true,
			                    },
			                    textarea_1:{
			                        required:true,
			                    },
			                    eamil:{
			                        email:true,
			                    },
			                    phone:{
			                    	isMobile:true,
			                    },
			                   /* yzm:{
			                        required:true,
			                    },
			                    confirm_password:{
			                    	equalTo: "#password",
			                    }*/
			                    
			                },
			                messages:{
			                	 jbname:{
			                        required:"职位标题不能为空！",
			                    }, 
			                    recnum:{
			                        required:"请输入职位人数！",
			                        digits:"请输入整数！",
			                    },
			                    salary:{
			                        required:"请输入职位人数！",
			                        digits:"请输入整数！",
			                    },
			                    inpend:{
			                        required:"请输入工作截至日期！",
			                    },
			                    starttime:{
			                        required:"请输入上班时间！",
			                    },
			                    endtime:{
			                        required:"请输入下班时间！",
			                    },
			                    textarea_1:{
			                        required:"请简介描述您所发布的职位信息！",
			                    },
			                    eamil:{
			                        email:"请输入正确的邮箱地址!",
			                    },
			                    phone:{
			                    	isMobile:"请填写正确的手机号!",
			                    },
			                    /*yzm:{
			                        required:"请输入验证码！",
			                    },
			                    confirm_password:{
			                    	equalTo: "两次密码输入不一致",
			                    }*/
			                },
			               
			                onfocusout:false,//失去焦点时不执行验证
			                errorPlacement:function(error,element){//错误提示，错误对象
			                    layer.tips(error[0].innerText,element,{//1.错误信息，2提示位置，3同时提示多个错误
			                        tipsMore:true,//错误信息可以同时提示多个，...
			                    });
			                }
			           	 });
		
		
		
		
		
		
		
		
		
		
		
	</script>

</html>