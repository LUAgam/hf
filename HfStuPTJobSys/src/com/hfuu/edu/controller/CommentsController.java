package com.hfuu.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hfuu.edu.common.Commentpojo;
import com.hfuu.edu.db.dao.CommentsDao;
import com.hfuu.edu.entity.Comments;
import com.hfuu.edu.entity.User;
import com.hfuu.edu.service.CommentsService;


@Controller
@RequestMapping("/comments")
public class CommentsController {
	
	@Autowired
	private CommentsService commentsService;
	
	
	@RequestMapping("/getcomments")
	@ResponseBody
	public List<Commentpojo> getAllComments(Integer ptjobid,Integer startindex, Integer pagesize) throws Exception{
		
		return commentsService.getCommentsByPtjbId(ptjobid,startindex,pagesize);

	}
	
	@RequestMapping("/getonecomments")
	@ResponseBody
	public Commentpojo getOneComments(Integer commentsid) throws Exception{
		
		return commentsService.getOneCommentsByCommentsId(commentsid);

	}
	
	@RequestMapping("/getlastonecomments")
	@ResponseBody
	public Commentpojo getOneCommentsByLast() throws Exception{
		
		return commentsService.getOneCommentsByCommentsLast();

	}
	
	
	
	@RequestMapping("/addcomments")
	@ResponseBody
	public Map<String, String> addPtJobCommments(Integer ptjobid,String comment,HttpServletRequest request){
		Map<String, String> map = new HashMap<String, String>();
//		Integer userId = 1;//用session去取出来(此处为学生用户session)
		User user = (User) request.getSession().getAttribute("user");
		
		if((null != user) && (null != user.getPtuser())){
			commentsService.addComment(ptjobid, user.getPtuser().getId(), comment);
			map.put("msg", "1");
			return map;
		}
		
		map.put("msg", "2");
		
		return map;
		
		
	}

	
	@RequestMapping("/addbscomments")
	@ResponseBody
	public Map<String, String> addBsJobCommments(Integer commentsid,String comment,HttpServletRequest request,Integer businessid){
		
		Map<String, String> map = new HashMap<String, String>();
//		Integer businessid = 1;//用session去取出来(此处为学生用户session)
		User user = (User) request.getSession().getAttribute("user");
		if((null != user) && (null != user.getBusiness())){
			if(businessid == user.getBusiness().getId()){
				commentsService.addBsComment(commentsid, user.getBusiness().getId(), comment);
				map.put("msg", "1");
			}else{
				map.put("msg", "3");//当前评论的商家不是发布该条职位的商家
			}
		}else{
			map.put("msg", "2");
		}
		
		
		return map;
	}
	

}
