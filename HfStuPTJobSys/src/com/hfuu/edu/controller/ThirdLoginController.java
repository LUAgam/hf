package com.hfuu.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfuu.edu.entity.Ptuser;
import com.hfuu.edu.entity.User;
import com.hfuu.edu.service.PtuserService;
import com.hfuu.edu.service.UserService;
import com.hfuu.edu.utils.GetImage;
import com.hfuu.edu.utils.HttpRequest;

@Controller
@RequestMapping("/thirdlogin")
public class ThirdLoginController {
		
		
		@Autowired
		private PtuserService ptuserService;
		
		@Autowired
		private UserService userService;
	
	//第三方平台提供的参数
		private static String appid="158f42754629cd";
		private static String token="d15e164e887b874a29ba953e10f887d4";
		
		@RequestMapping("/login")
		public String loginpage() {
			
			return "thirdlogin";
		}
		
		@RequestMapping("/gogo")
		public String thirdlogin(HttpServletRequest  request,HttpServletResponse response){
			
			
			String state = "1";
			
			
			String code  = request.getParameter("code");
			if((null != code) && (!"".equals(code))){
				System.out.println("第三方登录返回结果："+code );
				
			}
			if("".equals(code )||null==code){
				System.out.println("回调函数没有执行");
				return "login";
			}else{		
				
				response.addHeader("Access-Control-Allow-Origin", "*");
				User user = new User();
				if(userService.getLoginUser(code, state).size() > 0){
					List<User> users = userService.getLoginUser(code, state);
					for(User u : users){
						user = u;
					}
					if((null != user) & (user.getPassword().equals(code))){
						request.getSession().setAttribute("user", user);
					}
				}else{
					 String url=HttpRequest.sendPost("http://open.51094.com/user/auth.html", "type=get_user_info&code="+code+"&appid="+appid+"&token="+token+"");
			         System.out.println(url);
					 //解析结果
		            // 得到指定json key对象的value对象
			 		//解析封装对象
			        try {
						JSONObject jsonObj = new JSONObject(url);
						System.out.println(jsonObj.toString());
						String name = (String) jsonObj.get("name");
						System.out.println("----------->name = "+jsonObj.get("name"));
						String strUrl = (String) jsonObj.get("img");
						System.out.println("----------->img = "+strUrl);
						 String sex = String.valueOf(jsonObj.get("sex"));
						System.out.println("----------->sex = "+jsonObj.get("sex"));
						byte[] imageFromNetByUrl = GetImage.getImageFromNetByUrl(strUrl);
						String newfilename = UUID.randomUUID().toString()+".jpg";
						GetImage.writeImageToDisk(imageFromNetByUrl, newfilename);
						System.out.println("----------->uniq = "+jsonObj.get("uniq"));
						System.out.println("----------->from = "+jsonObj.get("from"));
						
						User newuser = new User();
						newuser.setUsername(code);
						newuser.setPassword(code);
						newuser.setState(state);
						userService.addUser(newuser);
						Ptuser newptuser = new Ptuser();
						newptuser.setName(name);
						newptuser.setImgurl(newfilename);
						if((null != sex) && (!"".equals(sex.trim()))){
							if("1".equals(sex.trim())){
								newptuser.setSex("男");
							}else{
								newptuser.setSex("女");
							}
						}
						newptuser.setUser(newuser);
						ptuserService.addPtuser(newptuser);
						newuser.setPtuser(newptuser);
						request.getSession().setAttribute("user", newuser);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				}
				return "webpage";//
			}
		}
		}

	
	
	
	
	
