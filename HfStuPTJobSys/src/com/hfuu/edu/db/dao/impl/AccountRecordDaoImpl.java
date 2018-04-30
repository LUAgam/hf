package com.hfuu.edu.db.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hfuu.edu.common.AccountRecordpojo;
import com.hfuu.edu.common.QueryResult;
import com.hfuu.edu.db.dao.AccountRecordDao;
import com.hfuu.edu.entity.AccountRecord;
import com.hfuu.edu.entity.Business;
import com.hfuu.edu.entity.JobApply;

@Repository
public class AccountRecordDaoImpl implements AccountRecordDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addMoneyRecord(AccountRecord accountRecord) {
		
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		session.save(accountRecord);
		
		tr.commit();
		session.close();

	}

	@Override
	public QueryResult getAccountRecordByBusinessId(Integer businessid,int startindex,
			int pagesize) {
		QueryResult qr = new QueryResult();
		Session session = sessionFactory.openSession();
		
		StringBuffer hql = new StringBuffer();
		hql.append("from AccountRecord where business_id = "+businessid+" order by changetime desc");
		StringBuffer hql1 = new StringBuffer();
		 hql1.append("select count(*) from AccountRecord where business_id = "+businessid+"");
		 
		 
		Query query = session.createQuery(hql.toString());
		query.setFirstResult(startindex);
		query.setMaxResults(pagesize);
		List<AccountRecord> list = query.list();
		qr.setList(list);
		
		Number num =  (Number)(session.createQuery(hql1.toString()).uniqueResult());
		qr.setTotalrecord(num.intValue());
		session.close();
		return qr;
	}

}
