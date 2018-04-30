package com.hfuu.edu.service;

import java.util.List;

import com.hfuu.edu.common.Commentpojo;
import com.hfuu.edu.entity.Comments;

public interface CommentsService {
	
	
	public List<Commentpojo> getCommentsByPtjbId(Integer id,int startindex, int pagesize);
	
	public Commentpojo getOneCommentsByCommentsId(Integer commentsid);
	
	public Commentpojo getOneCommentsByCommentsLast();
	
	public void addComment(Integer ptjobid,Integer userId,String comment);

	public void addBsComment(Integer commentsid,Integer businessid,String comment);
}
