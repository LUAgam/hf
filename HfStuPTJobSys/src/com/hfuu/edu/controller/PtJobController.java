package com.hfuu.edu.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hfuu.edu.common.ManagerPtjobBean;
import com.hfuu.edu.common.PageBean;
import com.hfuu.edu.common.PtJobPage;
import com.hfuu.edu.common.QueryInfo;
import com.hfuu.edu.entity.Ptjob;
import com.hfuu.edu.entity.User;
import com.hfuu.edu.service.PtJobService;

@Controller
@RequestMapping("/ptjob")
public class PtJobController {
	
	@Autowired
	private PtJobService ptJobService;
	
	@RequestMapping("/getall")
	public void getAllPtJob() {
		
	}
	@RequestMapping("/gogo")
	public String gogo() {
		return "webpage";
	}
	@RequestMapping("/gogo1")
	public String gogo1() {
		return "jobdetails";
	}
	@RequestMapping("/gogo2")
	public String gogo2() {
		return "jobrelease";
	}
	@RequestMapping("/gogo3")
	public String gogo3() {
		return "myapply";
	}
	@RequestMapping("/gogo4")
	public String gogo4() {
		return "mycollect";
	}
	@RequestMapping("/gogo5")
	public String gogo5() {
		return "myrelease";
	}
	/**
	 * 管理员获取审核职位的数量
	 * @param state
	 * @return
	 */
	@RequestMapping("/getjobcount")
	@ResponseBody
	public Map<String,String> getPtjobfCountByState(String state) {
		Map<String,String> map = new HashMap<String, String>();
		Integer ptjobfCountByState = ptJobService.getPtjobfCountByState(state);
		map.put("count",String.valueOf(ptjobfCountByState));
		return map;
	}
	/**
	 * 
	 * @param ptjobid
	 * @param state 需要改变的职位状态     若改为2  则传2
	 * @param jobverifyMsg  驳回的原因
	 * @return
	 */
	@RequestMapping("/changejbstate")
	@ResponseBody
	public Map<String,String> changePtjobfByState(Integer ptjobid,String state,String jobverifyMsg) {
		Map<String,String> map = new HashMap<String, String>();
		ptJobService.changePtjobfByState(ptjobid, state, jobverifyMsg);
		map.put("msg","1");
		return map;
	}
	/**
	 * 获取管理员审的核职位   
	 * @param startindex
	 * @param pagesize
	 * @param state
	 * @return
	 */
	@RequestMapping("/getjobbystate")
	@ResponseBody
	public List<ManagerPtjobBean> getPtjobfByState(Integer startindex, Integer pagesize, String state) {
		return ptJobService.getPtjobfByState(startindex, pagesize, state);
	}
	
	
	
	@RequestMapping("/getById")
	public ModelAndView getjobById(Integer id,String jbadress,String jbtype,String jbkind,String condition) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ptjob", ptJobService.getPtjobById(id));
		ptJobService.addOneQuantity(id);
		mav.addObject("ptjobrecommend", ptJobService.getRecommendPtJob(0, 5, jbadress, jbtype, jbkind, "0"));
		
		/*System.out.println(ptJobService.getRecommendPtJob(0, 5, jbadress, jbtype, jbkind, "0").size());*/
		
		mav.setViewName("jobdetails");
		
		return mav;
	}
	/**
	 * 根据手机端传过来的职位工作id返回职位的具体信息
	 * @param id
	 * @param response
	 * @return PtJobPage
	 * @throws Exception
	 */
	@RequestMapping("/getByIdPhone")
	@ResponseBody
	public PtJobPage getjobByIdPhone(Integer ptjobid,HttpServletResponse response) throws Exception {
		response.addHeader("Access-Control-Allow-Origin", "*");
		ptJobService.addOneQuantity(ptjobid);
		PtJobPage ptJobPage = ptJobService.getPtjobByIdPhone(ptjobid);
		return ptJobPage;
	}
	
	@RequestMapping("/getpage")
	@ResponseBody
	private PageBean gatPageAll(QueryInfo info,String jbadress,String jbtype,String jbkind,
			 String condition,String searchtxt,HttpServletResponse response) {
		response.addHeader("Access-Control-Allow-Origin", "*");
	/*	Enumeration<String> names = request.getParameterNames();
		while(names.hasMoreElements()){
			String name = names.nextElement();
			System.out.println(name+":"+request.getParameter(name));
		}*/
		
		PageBean pb = ptJobService.pageQuery(info, jbadress, jbtype, jbkind, condition,searchtxt);

		return pb;
	}
	
	
	
	
	@RequestMapping("/addptjob")
	@ResponseBody
	public Map<String, String> getAddPtJob(Ptjob ptjob,String inpstart,String inpend,String starttime,String endtime,HttpServletRequest request,Double[] lngandlat) throws Exception {
		
		ptjob.setState("0");
		Map<String, String> map = new HashMap<String, String>();
		User user = (User) request.getSession().getAttribute("user");
		
		if((null != user) && (null != user.getBusiness())){
			
			ptjob.setLng(lngandlat[0]);
			ptjob.setLat(lngandlat[1]);
			ptJobService.addPtjob(ptjob, inpstart, inpend, starttime, endtime, user.getBusiness().getId());
			map.put("msg", "1");
			return map;
		}
		map.put("msg", "2");
		return map;
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*StringBuffer sb = new StringBuffer();
		sb.append("我们班上有位同学叫李维昊，她有一双明亮的眼睛，一张长长的脸，还有一条辫子。");
		sb.append("她的同桌贺挺，数学成绩很不理想。无奈，数学老师只好把教贺挺这个艰巨的任务交给李维昊。");
		sb.append("我们每次都为她着急，但她却不急，她耐心教：乘法，小数乘法，分数乘法。直到满意为止。");
		sb.append("别人一次次的说她不值得：“花出宝贵的时间教贺挺这个笨蛋。”她却一言不发，默默的教贺挺。贺挺在李维昊的教导下，越来越进步。");
		sb.append("我们班上有位同学叫李维昊，她有一双明亮的眼睛，一张长长的脸，还有一条辫子。");
		sb.append("她的同桌贺挺，数学成绩很不理想。无奈，数学老师只好把教贺挺这个艰巨的任务交给李维昊。");
		sb.append("我们每次都为她着急，但她却不急，她耐心教：乘法，小数乘法，分数乘法。直到满意为止。");
		sb.append("别人一次次的说她不值得：“花出宝贵的时间教贺挺这个笨蛋。”她却一言不发，默默的教贺挺。贺挺在李维昊的教导下，越来越进步。");
		sb.append("我们班上有位同学叫李维昊，她有一双明亮的眼睛，一张长长的脸，还有一条辫子。");
		sb.append("她的同桌贺挺，数学成绩很不理想。无奈，数学老师只好把教贺挺这个艰巨的任务交给李维昊。");
		sb.append("我们每次都为她着急，但她却不急，她耐心教：乘法，小数乘法，分数乘法。直到满意为止。");
		sb.append("别人一次次的说她不值得：“花出宝贵的时间教贺挺这个笨蛋。”她却一言不发，默默的教贺挺。贺挺在李维昊的教导下，越来越进步。");
		sb.append("我们班上有位同学叫李维昊，她有一双明亮的眼睛，一张长长的脸，还有一条辫子。");
		sb.append("她的同桌贺挺，数学成绩很不理想。无奈，数学老师只好把教贺挺这个艰巨的任务交给李维昊。");
		sb.append("我们每次都为她着急，但她却不急，她耐心教：乘法，小数乘法，分数乘法。直到满意为止。");
		sb.append("别人一次次的说她不值得：“花出宝贵的时间教贺挺这个笨蛋。”她却一言不发，默默的教贺挺。贺挺在李维昊的教导下，越来越进步。");
		
		for(int i=0;i<20;i++){
			Ptjob p = new Ptjob();
			p.setJbname("百得思维有限公司"+i);
			p.setJbadress("蜀山区");
			p.setJbkind("其他");
			p.setJbtype("短期职位");
			p.setQuantity(1000+i);
			p.setImgurl("qita.png");
			p.setJbdetails(sb.toString());
			p.setReleasetime(new Date());
			ptJobService.addPtjob(p);
			
		}*/
		
		
		
		
		
		
	}
	
	
	

}
