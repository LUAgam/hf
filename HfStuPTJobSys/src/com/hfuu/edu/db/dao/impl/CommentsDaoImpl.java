package com.hfuu.edu.db.dao.impl;

import java.util.List;
import java.util.Set;














import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hfuu.edu.db.dao.CommentsDao;
import com.hfuu.edu.entity.Business;
import com.hfuu.edu.entity.Comments;
import com.hfuu.edu.entity.Ptjob;
import com.hfuu.edu.entity.Ptuser;

@Repository
public class CommentsDaoImpl implements CommentsDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Comments> getCommentsByJbId(Integer id,int startindex, int pagesize) {
		
		
		String hql = "from Comments where ptjob_id = '"+ id +"' order by id desc";
		
		Session session = sessionFactory.openSession();
		Transaction ts = session.beginTransaction();
		
		Query query = session.createQuery(hql);
		
		query.setFirstResult(startindex);
		query.setMaxResults(pagesize);
		
		List<Comments> comments = query.list();
		for(Comments comment : comments){
			System.out.println(comment.getChilden().size());
			comment.getChilden().size();
			comment.getPtuser();
//			comment.getBussiness();
			
		}
		ts.commit();
		session.close();
		
		System.out.println("commentsDao-------------------------"+comments.size());
		return comments;
	}
	
	@Override
	public Comments getOneCommentsByCommentsId(Integer commentsid) {
		
		Session session = sessionFactory.openSession();
		Transaction ts = session.beginTransaction();
		
		Comments comments = (Comments) session.get(Comments.class, commentsid);
		comments.getChilden().size();
		comments.getPtuser();
		
		ts.commit();
		session.close();
		
		return comments;
	}
	
	
	@Override
	public Comments getOneCommentsByCommentsLast() {
		
		Session session = sessionFactory.openSession();
		Transaction ts = session.beginTransaction();
		
//		StringBuffer hql = new StringBuffer();
//		hql.append("from Comments where 1=1 order by id desc");
//		Query query = session.createQuery(hql.toString());
//		query.setFirstResult(1);
//		query.setMaxResults(1);
		
		Number num =  (Number)(session.createQuery("select max(id) from Comments").uniqueResult());
		Integer max = num.intValue();
		
		Comments comments = (Comments) session.get(Comments.class, max);
		comments.getChilden().size();
		comments.getPtuser();
		
		ts.commit();
		session.close();
		
		
		
		return comments;
	}
	
	

	@Override
	public void addComment(Integer ptjobid, Integer userId, String comment) {
		
		Comments comments = new Comments();
		comments.setComment(comment);
		Session session = sessionFactory.openSession();
		Transaction ts = session.beginTransaction();
		
		Ptjob pj = (Ptjob) session.get(Ptjob.class, ptjobid);
		Ptuser ptuser = (Ptuser) session.get(Ptuser.class, userId);
		comments.setPtjob(pj);
		comments.setPtuser(ptuser);
		session.save(comments);
		ts.commit();
		session.close();
	}

	@Override
	public void addBsComment(Integer commentsid, Integer businessid, String comment) {
		Comments comments = new Comments();
		comments.setComment(comment);
		Session session = sessionFactory.openSession();
		Transaction ts = session.beginTransaction();
		
		Comments commentsparent = (Comments) session.get(Comments.class, commentsid);
		Business business = (Business) session.get(Business.class, businessid);
		comments.setParent(commentsparent);
		comments.setBussiness(business);
		session.save(comments);
		ts.commit();
		session.close();
		
		
	}


	
	

}
