package com.hfuu.edu.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hfuu.edu.common.Commentpojo;
import com.hfuu.edu.db.dao.CommentsDao;
import com.hfuu.edu.entity.Comments;
import com.hfuu.edu.service.CommentsService;

@Service
public class CommentsServiceImpl implements CommentsService {
	
	@Autowired
	private CommentsDao commentsDao;

	@Override
	public List<Commentpojo> getCommentsByPtjbId(Integer id,int startindex, int pagesize) {
		
		List<Comments> comments = commentsDao.getCommentsByJbId(id, startindex, pagesize);
		List<Commentpojo> commentspojo = new ArrayList<Commentpojo>();
		for(Comments comment : comments){
			Commentpojo cpj = new Commentpojo();
			cpj.setId(comment.getId());
//			cpj.setBsname(bsname);
			cpj.setPtusername(comment.getPtuser().getName());
			cpj.setComment(comment.getComment());
			Set<Commentpojo> cms = new HashSet<Commentpojo>();
			for(Comments cm : comment.getChilden()){
				Commentpojo cp = new Commentpojo();
				cp.setId(cm.getId());
				cp.setComment(cm.getComment());
				cms.add(cp);
			}
			
			cpj.setComments(cms);
			/*System.out.println(cpj.toString());*/
			commentspojo.add(cpj);
		}
		
		return commentspojo;
		
	}
	
	@Override
	public Commentpojo getOneCommentsByCommentsId(Integer commentsid) {
		
		Comments comment = commentsDao.getOneCommentsByCommentsId(commentsid);
		
		Commentpojo cpj = new Commentpojo();
		cpj.setId(comment.getId());
		cpj.setPtusername(comment.getPtuser().getName());
		cpj.setComment(comment.getComment());
		Set<Commentpojo> cms = new HashSet<Commentpojo>();
		for(Comments cm : comment.getChilden()){
			Commentpojo cp = new Commentpojo();
			cp.setId(cm.getId());
			cp.setComment(cm.getComment());
			cms.add(cp);
		}
		cpj.setComments(cms);
		System.out.println(cpj.toString());
		return cpj;
	}

	@Override
	public Commentpojo getOneCommentsByCommentsLast() {
		
		Comments comment = commentsDao.getOneCommentsByCommentsLast();
		Commentpojo cpj = new Commentpojo();
		cpj.setId(comment.getId());
		cpj.setPtusername(comment.getPtuser().getName());
		cpj.setComment(comment.getComment());
		Set<Commentpojo> cms = new HashSet<Commentpojo>();
		for(Comments cm : comment.getChilden()){
			Commentpojo cp = new Commentpojo();
			cp.setId(cm.getId());
			cp.setComment(cm.getComment());
			cms.add(cp);
		}
		cpj.setComments(cms);
		System.out.println(cpj.toString());
		return cpj;
	}
	
	

	@Override
	public void addComment(Integer ptjobid, Integer userId, String comment) {
		
		commentsDao.addComment(ptjobid, userId, comment);
		
	}

	@Override
	public void addBsComment(Integer commentsid, Integer businessid, String comment) {
		
		commentsDao.addBsComment(commentsid, businessid, comment);
		
	}



	
	
	
}
