package com.hfuu.edu.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hfuu.edu.entity.JobApply;
import com.hfuu.edu.entity.Ptuser;
import com.hfuu.edu.entity.User;
import com.hfuu.edu.service.PtuserService;
import com.hfuu.edu.service.UserService;
import com.hfuu.edu.utils.FileUploadUtil;

@Controller
@RequestMapping("/ptuser")
public class PtuserController {

	@Autowired
	private PtuserService ptuserService;

	@Autowired
	private UserService userService;

	@RequestMapping("/modifyptuser")
	@ResponseBody
	public Map<String, String> modifyPtuserMsg(Ptuser ptuser, HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		User u = (User) request.getSession().getAttribute("user");

		if ((null != u) && (null != u.getPtuser())) {

			ptuserService.modifyPtuserMsg(ptuser, u.getPtuser().getId());
			if (userService.getLoginUser(u.getUsername(), u.getState()).size() > 0) {
				User user = new User();
				List<User> users = userService.getLoginUser(u.getUsername(), u.getState());
				for (User u1 : users) {
					user = u1;
				}

				request.getSession().setAttribute("user", user);
			}

			map.put("mag", "1");// 修改成功
		} else {
			map.put("mag", "2");
		}
		return map;
	}

	@RequestMapping("/getptuserimg")
	@ResponseBody
	public Map<String, String> getPtuserImg(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		User u = (User) request.getSession().getAttribute("user");

		if ((null != u) && (null != u.getPtuser())) {

			String imgUrl_ = ptuserService.getPtuserImg(u.getPtuser().getId());
			map.put("imgUrl_", imgUrl_);
		}
		return map;
	}

	@RequestMapping("/getFujian")
	@ResponseBody
	public Map<String, String> getFujian(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		User u = (User) request.getSession().getAttribute("user");

		if ((null != u) && (null != u.getPtuser())) {

			map.put("imgUrl_", u.getPtuser().getFujian());
		}
		return map;
	}

	@RequestMapping("/modifyptuserimg")
	@ResponseBody
	public Map<String, String> modifyPtuserImg(MultipartFile imgurl_pic, HttpServletRequest request,
			MultipartHttpServletRequest muRequest) {
		Map<String, String> map = new HashMap<String, String>();

		User u = (User) request.getSession().getAttribute("user");

		if ((null != u) && (null != u.getPtuser())) {
			if (imgurl_pic != null) {
				String originalFilename = imgurl_pic.getOriginalFilename();
				if ((null != originalFilename) && ("" != originalFilename)) {

					String path = FileUploadUtil.getCurrentPath(request) + "/upload/";
					String newfilename = UUID.randomUUID()
							+ originalFilename.substring(originalFilename.lastIndexOf("."));

					File file = new File(path + newfilename);

					try {
						imgurl_pic.transferTo(file);
					} catch (Exception e) {
						e.printStackTrace();
					}

					Ptuser ptuser = new Ptuser();
					ptuser.setImgurl("/upload/" + newfilename);
					ptuserService.modifyPtuserMsg(ptuser, u.getPtuser().getId());

					map.put("mag", "1");// 修改头像成功
				} else {

					map.put("mag", "3");// 头像没了
				}
			}
		} else {
			map.put("mag", "2");// 修改失败
		}

		return map;
	}

	@RequestMapping("/modifyFujian")
	@ResponseBody
	public Map<String, String> modifyFujian(MultipartFile image, HttpServletRequest request,
			MultipartHttpServletRequest muRequest,HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();

		User u = (User) request.getSession().getAttribute("user");

		if ((null != u) && (null != u.getPtuser())) {
			if (image != null) {
				String originalFilename = image.getOriginalFilename();
				if ((null != originalFilename) && ("" != originalFilename)) {

					String path = FileUploadUtil.getCurrentPath(request) + "/upload/";
					String newfilename = FileUploadUtil.getOriginalFilename(muRequest);

					File file = new File(path + newfilename);

					try {
						image.transferTo(file);
					} catch (Exception e) {
						e.printStackTrace();
					}

					Ptuser ptuser = new Ptuser();
					ptuser.setFujian(newfilename);
					ptuserService.modifyPtuserMsg(ptuser, u.getPtuser().getId());
					u.getPtuser().setFujian(newfilename);
					u.setPtuser(u.getPtuser());
					session.setAttribute("user", u);
					map.put("mag", "1");// 修改头像成功
				} else {

					map.put("mag", "3");// 头像没了
				}
			}
		} else {
			map.put("mag", "2");// 修改失败
		}

		return map;
	}

	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public ResponseEntity<byte[]> download(HttpServletRequest request) throws IOException {
		User u = (User) request.getSession().getAttribute("user");
		if ((null != u) && (null != u.getPtuser())) {
			String path = FileUploadUtil.getCurrentPath(request) + "/upload/";
			File file = new File(path + u.getPtuser().getFujian());
			byte[] body = null;
			InputStream is = new FileInputStream(file);
			body = new byte[is.available()];
			is.read(body);
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Disposition", "attchement;filename=" + new String(file.getName().getBytes("gbk"),"iso-8859-1"));
			HttpStatus statusCode = HttpStatus.OK;
			ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(body, headers, statusCode);
			return entity;
		}
		return null;
	}

	@RequestMapping(value = "/download/{id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> downloadById(@PathVariable("id") Integer id, HttpServletRequest request)
			throws IOException {
		if (null != id) {
			Ptuser ptUser = ptuserService.findEntityById(id);
			String path = FileUploadUtil.getCurrentPath(request) + "/upload/";
			File file = new File(path + ptUser.getFujian());
			byte[] body = null;
			InputStream is = new FileInputStream(file);
			body = new byte[is.available()];
			is.read(body);
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Disposition", "attchement;filename=" + new String(file.getName().getBytes("gbk"),"iso-8859-1"));
			HttpStatus statusCode = HttpStatus.OK;
			ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(body, headers, statusCode);
			return entity;
		}
		return null;
	}

}
