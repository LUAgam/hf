<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="shortcut icon" href="../asset/xjzsys.ico"/>
		<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap-theme.css"/>
		<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="../asset/css/webpage.css" />
		<link rel="stylesheet" type="text/css" href="../asset/bootstrap-czy/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="../asset/css/register.css" />
		<link rel="stylesheet" type="text/css" href="../asset/layui/css/layui.css" />
		<!--<link rel="stylesheet" type="text/css" href="layer/skin/default/layer.css"/>-->
		<link rel="stylesheet" type="text/css" href="../asset/layer/skin/default/layer.css"/>
		<script src="../asset/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/bootstrap-czy/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="../asset/js/jquery.validate.min.js"></script>
		<script src="../asset/layer/layer.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/jquery.cityselect.js" type="text/javascript" charset="utf-8"></script>
		<script src="../asset/js/gVerify.js" type="text/javascript" charset="utf-8"></script>
		
		<script type="text/javascript">
		
		//验证
		
		$(document).ready(function() {
			                
			
			
			       	 });
		
		</script>

		
	</head>

	<body style="width: 1440px">
		<div class="webpage_top">
			<div class="webpage_top_center">
				<div class="webpage_top_center_left">
					<span style="font-family: '微软雅黑';font-size: 1.1em;color: red;">合肥</span>
					<span><a href="" style="font-family: '微软雅黑';color: gray;">[切换城市]</a></span>				
				</div>
				<div id="webpage_top_center_right" class="webpage_top_center_right">
					<a href="${pageContext.request.contextPath}/page/webpage">首页</font></a>
					<a href="#">申请合作</a>
					<a href="#">推广</a>
					<span id="" style="margin-left: -10px;margin-right: 10px;">|</span>
					<a href="${pageContext.request.contextPath }/page/login">登录</a>
				</div>
			</div>
		</div>
		<div class="webpage_center">
			<div class="webpage_center_search">
				<div class="webpage_center_search_left">
					<img style="width: 200px;height: 80px;" src="../asset/img/logo.png" />
				</div>
				<div id="webpage_center_search_center" style="margin-top:0px;" class="webpage_center_search_center">
					<ul>
						<li><span style="font-family: '微软雅黑';font-size: 1.5em;color: rgb(225,104,30);">免费注册</span></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="register_center">
			<div class="register_center_main">
				<div class="register_center_top">
					<span style="color: grey;">
						注册大学生职位平台，找职位，招职位更容易	
					</span>
				</div>
				<div class="register_center_top_1" id="register_center_top_1">
					<ul>
						<li><span style="color: white;">快速注册</span></li>
					</ul>
				</div>
				<div class="register_center_top_main" id="register_center_top_main">
					<form id="" class="layui-form" action="" style="margin-top: 20px;">
						<div class="layui-form-item">
							<!--<label class="layui-form-label">单选框</label>-->
							<div class="layui-input-block">
								<div id="lay_tips_1" style="float: left">
									<input id="radio_1"  type="radio" name="usertype" value="1" title="求职者" lay-filter="aihao" checked="checked">
								</div>
								<div id="lay_tips_2" style="float: left">
									<input id="radio_2"  type="radio" name="usertype" value="2" title="企业用户" lay-filter="aihao" >
								</div>
							</div>
						</div>
					</form>
					<form id="register_form" method="get" action="../user/addptuser">
						<div class="layui-form-item">
							<label class="layui-form-label" style="width:100px;">手机号</label>
							<div class="layui-input-inline">
								<input type="text" id="phone" name="phone" placeholder="请输入手机号" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" style="width:100px;">验证码</label>
							<div class="layui-input-inline">
								<input type="text" id="yzm" name="yzm" placeholder="请输入验证码" autocomplete="off" class="layui-input">
								<div id="v_container" style="width: 80px;height: 30px;margin-left: 100px;margin-top: -34px"></div>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" style="width:100px;">短信验证码</label>
							<div class="layui-input-inline">
								<input type="text" id="" name="" placeholder="请输入短信验证码" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" style="width:100px;">密码</label>
							<div class="layui-input-inline">
								<input type="password" id="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item" id="registe_temp">
							<label class="layui-form-label" style="width:100px;">确认密码</label>
							<div class="layui-input-inline">
								<input type="password" id="confirm_password" name="confirm_password" placeholder="请确认密码" autocomplete="off" class="layui-input">
							</div>
						</div>
						
						<div id="registe_temp_temp">
						
						</div>
						
						<div class="layui-form-item" style="margin-bottom: 40px;">
							<div class="layui-input-block">
								<button id="btn1" type="submit" class="layui-btn layui-btn-warm">立即提交</button>
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							</div>
						</div>
					</form>
						
				</div>
			</div>
		</div>
		<div class="register_center_foot">
			
		</div>
		
		
	</body>
	<script type="text/javascript">
	
	
	$(function(){
		var verifyCode = new GVerify("v_container");
		
		
			$("#phone").blur(function(){
				var username = $("#phone").val();
    			var state = radioval;
				
				
				 $.ajax({
                    url:"../user/getusername",
                    type:'post',
                    data: {
						"username" : username,
						"state" : state
					},
                    
                    success:function(data){
                    	 if(data.msg == '1'){
                    		layer.tips('该账号已经被注册，请重新输入', '#phone');
                    		$('#btn1').attr('disabled',true);
                    		
                    	}
                    	if(data.msg == '2'){
                    		$('#btn1').attr('disabled',false);
                    	} 
                    }

                }); 
				
			});
		
			var radioval = 1;
		
			$("#btn_1").click(function(){
				  var a =  $(".prov").val();
				alert(a);
				
			})
		
		layui.use('form', function() {
			var form = layui.form();
			form.on('radio(aihao)', function(data){
				  console.log(data.elem); //得到radio原始DOM对象
				  console.log(data.value); //被点击的radio的value值
				  if(data.value == 1){
					  radioval = 1;
				  	$('#city').remove();
				  	$('#registe_temp_02').remove();
				  	$('#registe_temp_03').remove();
				  	layer.tips('求职者账号：用来查看职位,申请职位工作!', '#lay_tips_1', {
					  tips: [1, '#78BA32'] //还可配置颜色
					});	
				  }
				  if(data.value == 2){
					  radioval = 2;
				  	$('#city').remove();
				  	$('#registe_temp_02').remove();
				  	$('#registe_temp_03').remove();
				  	$('#city').remove();
				  	layer.tips('企业：用来发布诚信可靠的职位,祝您事业发达!', '#lay_tips_2', {
					  tips: [1, '#78BA32'] //还可配置颜色
					});	
					$('#registe_temp').append(
					
						'<div id="registe_temp_02" class="layui-form-item" style="margin-top:600px;">'+
							'<label class="layui-form-label" style="width:100px;">组织名字</label>'+
							'<div class="layui-input-inline">'+
							'<input type="text" id="name" placeholder="请输入企业名称" autocomplete="off" class="layui-input">'+
							'</div>'+
						'</div>'+
						'<div id="registe_temp_03" class="layui-form-item">'+
							'<label class="layui-form-label" style="width:100px;">企业邮箱</label>'+
							'<div class="layui-input-inline">'+
							'<input type="text" id="email" placeholder="请输入企业邮箱" autocomplete="off" class="layui-input">'+
							'</div>'+
						'</div>'
					);
					$('#registe_temp_temp').append(
						'<div id="city">'+
						    '<label class="layui-form-label" style="width:100px;">选择城市</label>'+ 
							'<select class="prov" id="prov"></select>'+
							'<select class="city" id="cityname" disabled="disabled"></select>' +
							'<select class="dist" id="dist" disabled="disabled"></select> '+
						 '</div>'
					);
					/* $('#registe_temp_temp').append(
							'<div id="license" class="layui-form-item">'+
							'<label class="layui-form-label" style="width:100px;">营业执照</label>'+
							'<div class="layui-input-inline">'+
							'<input type="file" id="license" name="license" placeholder="营业执照" autocomplete="off"' +
							'class="layui-input">'+
							'</div>'+
							'</div>'
						); */
					
					
					
					
					$("#city").citySelect({prov:"安徽", city:"合肥", dist:"蜀山区"});
				  }
				}); 
			form.on('submit(formDemo)', function(data) {
				layer.msg(JSON.stringify(data.field));
				return false;
			});
		});
		
			/*$("#registe_temp_01").live(event,function(){
				$("#city").citySelect({prov:"湖南", city:"长沙", dist:"岳麓区"});
			})*/
		
			//验证
			
			 jQuery.validator.addMethod("isMobile", function(value, element) {  
				 var length = value.length;
			      return this.optional(element) || (length == 11 && /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test(value));    
			    }, "请正确填写您的手机号码。");
			 /* jQuery.validator.addMethod("usernameexit", function(value, element) {
				 	 var state = radioval;
				 	 var temp = 1;
					 $.ajax({
	                     url:"../user/getusername",
	                     type:'get',
	                     data: {
	 						"username" : value,
	 						"state" : state
	 					},
	                     
	                     success:function(data){
	                    	 alert(data.msg);
	                     	temp = data.msg;
	                     }
	
	                 }); 
					 if(temp == 1){
						 return false;
					 }
				 
			      return true;    
			    }, "账号已存在!");  */
						
			            $("#register_form").validate({
			            	 submitHandler:function(form){
			            		var username = $("#phone").val();
			        		    var password = $("#password").val();
			        			var state = radioval;
			        			var name = $("#name").val();
			        			var email = $("#email").val();
			        			var city = $("#prov").val()+'-'+$("#cityname").val()+'-'+$("#dist").val();
			        			
			        			var res = verifyCode.validate(document.getElementById("yzm").value);
			        			if(!res){
			        				layer.tips('验证码错误', '#yzm');
			        				return;
			        			}
			        			
			        			
			        			/* alert(city); */
			                    //验证通过后可提交表单
			                    //form.submit();
			                    //ajax提交
			                    if(state == 1){
			                    	/* form.submit(); */
			                    	
			                    	 $.ajax({
				                        url:"../user/addptuser",
				                        type:'post',
				                        data: {
				    						"username" : username,
				    						"password" : password,
				    						"state" : state
				    					},
				                        beforeSend:function () {
				                            //在表单提交后后端未作出响应时，禁用提交按钮，提高用户体验。
				                            $("#btn1").attr({ disabled: "disabled" });
				                        },
				                        complete:function(){
				                            //后端响应后放开按钮
				                            $("#btn1").removeAttr("disabled");
				                        },
				                        success:function(data){
				                        	
				                        	layer.confirm(data.msg, {
				              				  btn: ['登录','进入主页'] //按钮
				              				}, function(){
				              					
				              					window.location.href='../user/loginpage';
				              					
				              				}, function(){
				              					
				              					window.location.href='../page/webpage';
				              					
				              				});
				                        	
				                        	
				                        	/* alert(temp);
				                        	layer.alert(''+temp+'', {icon: 6});
				                        	window.location.href='../user/loginpage'; */
				                        }

				                    }); 
			                    }
			                   if(state == 2){
			                	   $.ajax({
				                        url:"../user/addBussiness",
				                        type:'post',
				                        data: {
				    						"username" : username,
				    						"password" : password,
				    						"state" : state,
				    						"name" : name,
				    						"email" : email,
				    						"city" : city,
				    					},
				                        beforeSend:function () {
				                            //在表单提交后后端未作出响应时，禁用提交按钮，提高用户体验。
				                            $("#btn1").attr({ disabled: "disabled" });
				                        },
				                        complete:function(){
				                            //后端响应后放开按钮
				                            $("#btn1").removeAttr("disabled");
				                        },
				                        success:function(data){
				                        	
				                        	layer.confirm(data.msg, {
					              				  btn: ['登录','进入主页'] //按钮
					              				}, function(){
					              					
					              					window.location.href='../user/loginpage';
					              					
					              				}, function(){
					              					
					              					window.location.href='../page/webpage';
					              					
					              				});
				                        	
				                        	/* var temp = data.msg;
				                        	alert(temp);
				                        	layer.alert(''+temp+'', {icon: 6});
				                        	window.location.href='../user/loginpage'; */
				                        }

				                    }); 
			                    	
			                    }
			                
			                    
			                    
			                }, 
			                
			                rules:{
			                	 phone:{
			                        required:true,
			                        isMobile:true,
			                    },
			                    yzm:{
			                        required:true,
			                    },
			                    password:{
			                    	required:true,
			                    },
			                    confirm_password:{
			                    	equalTo: "#password",
			                    }
			                    
			                },
			                messages:{
			                	 phone:{
			                        required:"手机号不能为空！",
			                        isMobile: "请输入正确的手机号",
			                    }, 
			                    yzm:{
			                        required:"请输入验证码！",
			                    },
			                    password:{
			                    	required:"密码不能为空哟",
			                    },
			                    confirm_password:{
			                    	equalTo: "两次密码输入不一致",
			                    }
			                },
			               
			                onfocusout:false,//失去焦点时不执行验证
			                errorPlacement:function(error,element){//错误提示，错误对象
			                    layer.tips(error[0].innerText,element,{//1.错误信息，2提示位置，3同时提示多个错误
			                        tipsMore:true,//错误信息可以同时提示多个，...
			                    });
			                }
			           	 });
		
	})
	
		
			 
			
		
		
		 /*function getRadio(){ 
		　　　 e = event.srcElement;
		　　if(e.type=="radio"　&&　e.name=="isAdvertisers")　
		　　　 alert("你点击的Radio按钮值为"+e.value);
		
		　　　　　　 if(e.value=='Yes'){
		　　 $('#advertisers').hide('slow');
		　　 }else{
		　　 $('#advertisers').show('slow');
		　　 }
　}*/
	</script>
	
	<!--<script type="text/javascript">
		$(document).ready(function() {
			$("input:radio[name=usertype]").change(function () {
                alert(1);
            });
					/*$("input[name=usertype]").click(function() {
						
						alert("aaaaaaaaaaaaaaaaaa")
						switch ($("input[name=usertype]:checked").attr("id")) {
							case "radio_1":
								alert('aaaaa');
							break;
							case "radio_2":
								alert('sddd');
							break;
								default:
							break;
										}
					});*/

						/*$('#radio_1').click(function(){
							alert('aaaaa');
							
							layer.tips('我是另外一个tips，只不过我长得跟之前那位稍有些不一样。', '吸附元素选择器', {
								  tips: [1, '#3595CC'],
								  time: 4000
								});
						})*/

					});
	</script>-->

</html>