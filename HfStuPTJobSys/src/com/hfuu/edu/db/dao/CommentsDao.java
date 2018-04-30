package com.hfuu.edu.db.dao;

import java.util.List;
import java.util.Set;

import com.hfuu.edu.entity.Comments;

public interface CommentsDao {
	
	
	public List<Comments> getCommentsByJbId(Integer id,int startindex, int pagesize);
	
	public Comments getOneCommentsByCommentsId(Integer commentsid);
	
	public Comments getOneCommentsByCommentsLast();
	
	public void addComment(Integer ptjobid,Integer userId,String comment);
	
	public void addBsComment(Integer ptjobid,Integer commentsid,String comment);

}
