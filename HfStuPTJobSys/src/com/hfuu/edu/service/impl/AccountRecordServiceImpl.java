package com.hfuu.edu.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hfuu.edu.common.AccountRecordpojo;
import com.hfuu.edu.common.ChectList;
import com.hfuu.edu.common.PageBean;
import com.hfuu.edu.common.QueryInfo;
import com.hfuu.edu.common.QueryResult;
import com.hfuu.edu.db.dao.AccountRecordDao;
import com.hfuu.edu.entity.AccountRecord;
import com.hfuu.edu.entity.Business;
import com.hfuu.edu.entity.JobApply;
import com.hfuu.edu.service.AccountRecordService;

@Service
public class AccountRecordServiceImpl implements AccountRecordService {
	
	@Autowired
	private AccountRecordDao accountRecordDao;

	@Override
	public void addMoneyRecord(AccountRecord accountRecord) {
		
		accountRecordDao.addMoneyRecord(accountRecord);
		
	}

	@Override
	public PageBean getAccountRecordByBusinessId(Integer businessid,QueryInfo info) {
		
		QueryResult qr = accountRecordDao.getAccountRecordByBusinessId(businessid, info.getStartindex(), info.getPagesize());
		PageBean bean = new PageBean();
		bean.setCurrentpage(info.getCurrentpage());
		
		List<AccountRecord> accountRecords = qr.getList();
		List<AccountRecordpojo> accountRecordpojos = new ArrayList<AccountRecordpojo>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		  for(AccountRecord accountRecord : accountRecords){
			  AccountRecordpojo accountRecordpojo = new AccountRecordpojo();
			  accountRecordpojo.setId(accountRecord.getId());
			  accountRecordpojo.setSerialnumber(accountRecord.getSerialnumber());
			  accountRecordpojo.setChangemoney(accountRecord.getChangemoney());
			  accountRecordpojo.setChangetime(sdf.format(accountRecord.getChangetime()));
			  accountRecordpojo.setMoneymsg(accountRecord.getMoneymsg());
			  accountRecordpojos.add(accountRecordpojo);
		  }
		
		bean.setList(accountRecordpojos);
		bean.setPagesize(info.getPagesize());
		bean.setTotalrecord(qr.getTotalrecord());
		return bean;
	}



}
