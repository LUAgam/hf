package com.hfuu.edu.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hfuu.edu.common.MessageVo;
import com.hfuu.edu.db.dao.MessageDao;
import com.hfuu.edu.entity.Message;
import com.hfuu.edu.service.MessageService;
@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageDao messageDao;
	
	@Override
	public void addoneMessage(Message message) {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		message.setSendtime(sdf.format(new Date()));
		message.setState("0");
		messageDao.addoneMessage(message);
		
	}

	@Override
	public List<MessageVo> getAllmsg(Integer userid) {
		// TODO Auto-generated method stub
		
		
		return messageDao.getAllmsg(userid);
	}

	@Override
	public void ModifyMassageState(Integer messageid) {
		// TODO Auto-generated method stub
		messageDao.ModifyMassageState(messageid);
	}

	@Override
	public Integer getNotReadMsgCount(Integer userid) {
		// TODO Auto-generated method stub
		return messageDao.getNotReadMsgCount(userid);
	}
	
	
}
