package com.hfuu.edu.db.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hfuu.edu.db.dao.TopJobRecordDao;
import com.hfuu.edu.entity.Business;
import com.hfuu.edu.entity.Ptjob;
import com.hfuu.edu.entity.TopJobRecord;

@Repository
public class TopJobRecordDaoImpl implements TopJobRecordDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Map<String, String> payForTopJob(Double paymoney,Integer ptjobid, TopJobRecord topJobRecord,
			Integer businessid) {
		Map<String,String> map = new HashMap<String, String>();
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		Business business = (Business) session.get(Business.class, businessid);
		Ptjob ptjob = (Ptjob) session.get(Ptjob.class, ptjobid);
		if(null != ptjob.getTopJobRecord()){
			map.put("msg", "3");//已经职位制置顶了
		}else{
			if(business.getBalance() > paymoney){
				topJobRecord.setPtjob(ptjob);
				session.save(topJobRecord);
				business.setBalance(business.getBalance()-paymoney);
				map.put("msg", "1");//置顶成功
			}else{
				map.put("msg", "2");//余额不足
			}
		}
		tr.commit();
		session.close();
		
		return map;
	}

	@Override
	public void ModifyTopJobMsg() {
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		Date nowdate = new Date();
			String hql = "from Ptjob where state='1'";
			List<Ptjob> list = session.createQuery(hql).list();
			System.out.println(list.size());
				for(Ptjob ptjob : list){
					if(null != ptjob.getTopJobRecord()){
						TopJobRecord topJobRecord = ptjob.getTopJobRecord();
						if(((topJobRecord.getStartdate().compareTo(nowdate))<=0) && ((topJobRecord.getEnddate().compareTo(nowdate))>=0)){
							//当前时间在置顶职位时间之间则将该职位发布时间改为当前时间，以便完成置顶
							ptjob.setReleasetime(nowdate);
						}else if((topJobRecord.getStartdate().compareTo(nowdate))>=0){
							//如果指定的置顶时间还未到就不执行任何操作
						}else{
							//如果置顶的时间过期了  则不再置顶该职位工作
							topJobRecord.setPtjob(null);
						}
					}
				}
			
		tr.commit();
		session.close();
		
	}
	
	




}
