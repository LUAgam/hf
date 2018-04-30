package com.hfuu.edu.db.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hfuu.edu.common.MessageVo;
import com.hfuu.edu.db.dao.MessageDao;
import com.hfuu.edu.entity.Business;
import com.hfuu.edu.entity.Comments;
import com.hfuu.edu.entity.Message;
import com.hfuu.edu.entity.Ptjob;
import com.hfuu.edu.entity.Ptuser;
import com.hfuu.edu.entity.User;
@Repository
public class MessageDaoImpl implements MessageDao {

	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addoneMessage(Message message) {
		Session session = sessionFactory.openSession();
		Transaction ts = session.beginTransaction();
		
		session.save(message);
		
		ts.commit();
		session.close();
	}

	@Override
	public List<MessageVo> getAllmsg(Integer userid) {
		List<MessageVo> messagevos = new ArrayList<MessageVo>();
		Session session = sessionFactory.openSession();
		Transaction ts = session.beginTransaction();
		
		String hql = " from Message where toUserid = '"+userid+"' order by sendtime desc";
		List<Message> list = session.createQuery(hql).list();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for(Message messsage : list){
			MessageVo messageVo = new MessageVo();
			Integer fromUserid = messsage.getFromUserid();
//			Integer toUserid = messsage.getToUserid();
			User user = (User) session.get(User.class, fromUserid);
			Business business = user.getBusiness();
//			User user1 = (User) session.get(User.class, toUserid);
//			Ptuser ptuser = user1.getPtuser();
			Ptjob ptjob = (Ptjob) session.get(Ptjob.class, messsage.getPtjobid());
			messageVo.setId(messsage.getId());
			messageVo.setBusinesscontact(business.getContacts());
			messageVo.setBusinessid(business.getId());
			messageVo.setBusinessname(business.getName());
			messageVo.setBusinesstel(business.getPhone());
			messageVo.setFromUserid(messsage.getFromUserid());
			messageVo.setMesssage(messsage.getMesssage());
			messageVo.setPtjobid(ptjob.getId());
			messageVo.setPtjobname(ptjob.getJbname());
			messageVo.setSendtime(messsage.getSendtime());
			messageVo.setState(messsage.getState());
			messageVo.setToUserid(userid);
			messageVo.setWorktime(sdf.format(ptjob.getStartdate())+"至"+sdf.format(ptjob.getEnddate()));
			messagevos.add(messageVo);
		}
		
		ts.commit();
		session.close();
		return messagevos;
	}

	@Override
	public void ModifyMassageState(Integer messageid) {
		Session session = sessionFactory.openSession();
		Transaction ts = session.beginTransaction();
		
		Message message = (Message) session.get(Message.class, messageid);
		message.setState("1");
		
		ts.commit();
		session.close();
		
		
	}

	@Override
	public Integer getNotReadMsgCount(Integer userid) {
		Session session = sessionFactory.openSession();
		Transaction ts = session.beginTransaction();
		String hql = "select count(*) from Message where toUserid = '"+userid+"' and state = '0'";
		
		Number count = (Number) session.createQuery(hql).uniqueResult();
		
		
		ts.commit();
		session.close();	
		
		return count.intValue();
	}

}
