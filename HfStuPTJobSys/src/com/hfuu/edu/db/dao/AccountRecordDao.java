package com.hfuu.edu.db.dao;

import com.hfuu.edu.common.AccountRecordpojo;
import com.hfuu.edu.common.QueryResult;
import com.hfuu.edu.entity.AccountRecord;
import com.hfuu.edu.entity.Business;

public interface AccountRecordDao {
	
	public void addMoneyRecord(AccountRecord accountRecord);
	
	public QueryResult getAccountRecordByBusinessId(Integer businessid,int startindex,
			int pagesize);

}
