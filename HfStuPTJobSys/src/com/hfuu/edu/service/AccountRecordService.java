package com.hfuu.edu.service;

import com.hfuu.edu.common.AccountRecordpojo;
import com.hfuu.edu.common.PageBean;
import com.hfuu.edu.common.QueryInfo;
import com.hfuu.edu.entity.AccountRecord;
import com.hfuu.edu.entity.Business;

public interface AccountRecordService {
	
	public void addMoneyRecord(AccountRecord accountRecord);
	
	public PageBean getAccountRecordByBusinessId(Integer businessid,QueryInfo info);

}
