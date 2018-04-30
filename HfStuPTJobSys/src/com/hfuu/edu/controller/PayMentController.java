package com.hfuu.edu.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hfuu.edu.entity.AccountRecord;
import com.hfuu.edu.entity.User;
import com.hfuu.edu.service.AccountRecordService;
import com.hfuu.edu.service.BusinessService;
import com.hfuu.edu.utils.PayConfig;
import com.hfuu.edu.utils.PaymentUtil;


@Controller
public class PayMentController {
	
	@Autowired
	private AccountRecordService accountRecordService;
	
	@Autowired
	private BusinessService businessService;
	
	@RequestMapping("/servlet/pay")
	private String gotoPayMent(){
		return "pay";
	}	
	
	@RequestMapping("/servlet/returnbankjsp")
	private ModelAndView returnBankJsp(String orderid,String money,HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("orderid", orderid);
		session.setAttribute("money", money);
		mav.setViewName("bank");
		return mav;
		
	}	
	
	@RequestMapping("/servlet/PaymentResponse")
	private String PaymentResponse(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String money = (String) request.getSession().getAttribute("money");
		AccountRecord ar = new AccountRecord();
		ar.setChangetime(new Date());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Double random = Math.random()*100000000;
		String serialnumber = sdf.format(new Date())+String.valueOf(random.intValue());
		ar.setSerialnumber(serialnumber);
		ar.setChangemoney(String.valueOf(Double.parseDouble(money)*1000));
		ar.setMoneymsg("钱包充值");
		User user = (User) request.getSession().getAttribute("user");
		if((null != user) && (null != user.getBusiness())){
			ar.setBusiness(user.getBusiness());
			accountRecordService.addMoneyRecord(ar);
			if(!"".equals(money))
				businessService.changeBusinessMoneyById(user.getBusiness().getId(), Double.parseDouble(money)*1000);
		}
		
		/*response.setCharacterEncoding("gb2312");
		response.setContentType("text/html;charset=gb2312");
		
		String p1_MerId = PayConfig.getValue("p1_MerId");
		String r0_Cmd = request.getParameter("r0_Cmd");
		String r1_Code = request.getParameter("r1_Code");
		String r2_TrxId = request.getParameter("r2_TrxId");
		String r3_Amt = request.getParameter("r3_Amt");
		String r4_Cur = request.getParameter("r4_Cur");
		String r5_Pid = request.getParameter("r5_Pid");
		String r6_Order = request.getParameter("r6_Order");
		String r7_Uid = request.getParameter("r7_Uid");
		String  r8_MP= request.getParameter("r8_MP");
		String r9_BType = request.getParameter("r9_BType");
		String hmac = request.getParameter("hmac");
		
		String keyValue = PayConfig.getValue("keyValue");
		
		boolean b = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, keyValue);
		if(!b){
			response.getWriter().write("交易签名已被修改！！！");
//			return;
		}
		
		
		if("1".equals(r1_Code)){  //处理支付成功
			//---------------------向数据库插入一条余额变动记录
			if("1".equals(r9_BType)){
				response.getWriter().write("支付成功！！");
//				response.sendRedirect("index.jsp");
				return "redirect:/index";
			}
			if("2".equals(r9_BType)){
//				response.getWriter().write("success");
				return "redirect:/success";
			}
		}*/
		return "";
		
	}
	
	@RequestMapping("/servlet/PayRequestServlet")
	private String PayRequestServlet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		String p0_Cmd = "Buy";
		String p1_MerId = PayConfig.getValue("p1_MerId");
		String p2_Order = request.getParameter("orderid");
		String p3_Amt = request.getParameter("money");
		String p4_Cur = "CNY";
		String p5_Pid = "";
		String p6_Pcat = "";
		String p7_Pdesc = "";
		String p8_Url = PayConfig.getValue("responseURL");
		String p9_SAF = "";
		String pa_MP = "";
		String pd_FrpId = request.getParameter("pd_FrpId");
		String pr_NeedResponse = "1";
		String keyValue = PayConfig.getValue("keyValue");
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, keyValue);
		
	
		request.setAttribute("p0_Cmd", p0_Cmd);
		request.setAttribute("p1_MerId", p1_MerId);
		request.setAttribute("p2_Order", p2_Order);
		request.setAttribute("p3_Amt", p3_Amt);
		request.setAttribute("p4_Cur", p4_Cur);
		request.setAttribute("p5_Pid", p5_Pid);
		request.setAttribute("p6_Pcat",p6_Pcat);
		request.setAttribute("p7_Pdesc", p7_Pdesc);
		request.setAttribute("p8_Url", p8_Url);
		request.setAttribute("p9_SAF", p9_SAF);
		request.setAttribute("pa_MP", pa_MP);
		request.setAttribute("pd_FrpId", pd_FrpId);
		request.setAttribute("pr_NeedResponse", pr_NeedResponse);
		request.setAttribute("hmac", hmac);

//		request.getRequestDispatcher("/payconfirm.jsp").forward(request, response);
		return "payconfirm";
		
		
	}
	

}
