package com.hfuu.edu.db.dao;

import java.util.List;

import com.hfuu.edu.common.MessageVo;
import com.hfuu.edu.entity.Message;

public interface MessageDao {

	public void addoneMessage(Message message);
	
	public List<MessageVo> getAllmsg(Integer userid);
	
	public void ModifyMassageState(Integer messageid);
	
	public Integer getNotReadMsgCount(Integer userid);
}
