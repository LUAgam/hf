package com.hfuu.edu.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hfuu.edu.common.PtJobPage;
import com.hfuu.edu.entity.Business;
import com.hfuu.edu.entity.Ptuser;
import com.hfuu.edu.entity.User;
import com.hfuu.edu.service.BusinessService;
import com.hfuu.edu.utils.FileUploadUtil;

@Controller
@RequestMapping("/business")
public class BusinessController {

	@Autowired
	private BusinessService businessService;

	@RequestMapping("/getjblist")
	@ResponseBody
	public List<PtJobPage> getPtJobList(Integer id) {

		List<PtJobPage> pjp = businessService.getBusinessPtjob(id);
		System.out.println(pjp.size());
		return pjp;
	}

	@RequestMapping("/getcurrentjblist")
	@ResponseBody
	public List<PtJobPage> getCurrentPtJobList(HttpSession session) {
		List<PtJobPage> pjp = new ArrayList<PtJobPage>();
		User user = (User) session.getAttribute("user");
		if ((null != user) && (null != user.getBusiness())) {
			pjp = businessService.getCurrentBusinessPtjob(user.getBusiness().getId());
		}
		return pjp;
	}

	@RequestMapping("/modifybusinessmsg")
	public ModelAndView modifyBusinessMsg(Business business, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		User user = (User) session.getAttribute("user");
		if ((null != user) && (null != user.getBusiness())) {
			String newfilename = "";
			if (business.getLicenseForm() != null) {
				String originalFilename = business.getLicenseForm().getOriginalFilename();
				if ((null != originalFilename) && ("" != originalFilename)) {

					String path = FileUploadUtil.getCurrentPath(request) + "/upload/";
					newfilename = UUID.randomUUID()
							+ originalFilename.substring(originalFilename.lastIndexOf("."));

					File file = new File(path + newfilename);

					try {
						business.getLicenseForm().transferTo(file);
					} catch (Exception e) {
						e.printStackTrace();
					}

					Ptuser ptuser = new Ptuser();
					ptuser.setImgurl("/upload/" + newfilename);

				}
			}
			businessService.modifyBusinessMsg(business, user.getBusiness().getId(), newfilename);
			map.put("msg", "1");
		} else {
			map.put("msg", "2");
		}
		mav.setViewName("editorbusiness");
		return mav;
	}

}
