package com.hfuu.edu.db.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hfuu.edu.common.ComplainRecordVo;
import com.hfuu.edu.db.dao.ComplainRecordDao;
import com.hfuu.edu.entity.ComplainRecord;
import com.hfuu.edu.entity.JobCollection;
import com.hfuu.edu.entity.Ptjob;
import com.hfuu.edu.entity.Ptuser;
import com.hfuu.edu.entity.User;

@Repository
public class ComplainRecordDaoImpl implements ComplainRecordDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public void addOneComplain(ComplainRecord complainRecord) {


		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		session.save(complainRecord);
		
		tr.commit();
		session.close();
		
		
		
	}

	@Override
	public void ModifyComplainState(Integer complainid) {


		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
			ComplainRecord complainRecord = (ComplainRecord) session.get(ComplainRecord.class, complainid);
			complainRecord.setState("1");
		
		tr.commit();
		session.close();
		
	}

	@Override
	public List<ComplainRecordVo> getAllComplainRecord(String State) {

		List<ComplainRecordVo> complainRecordVos = new ArrayList<ComplainRecordVo>();
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
			String hql = "from ComplainRecord where state = '"+State+"' order by complaintime desc";
			
			List<ComplainRecord> complains = session.createQuery(hql).list();
			if(null != complains){
				for(ComplainRecord cr : complains){
					Integer ptjobid = cr.getPtjobid();
					Integer ptuserid = cr.getPtuserid();
					Ptjob ptjob = (Ptjob) session.get(Ptjob.class, ptjobid);
					Ptuser ptuser = (Ptuser) session.get(Ptuser.class, ptuserid);
					ComplainRecordVo crv = new ComplainRecordVo();
					crv.setComplain(cr.getComplain());
					crv.setComplaintime(cr.getComplaintime());
					crv.setId(cr.getId());
					crv.setPtjobid(cr.getPtjobid());
					if(null != cr.getHandletime())
						crv.setHandletime(cr.getHandletime());
					if(null != ptjob){
						if(null != ptjob.getBusiness().getName())
							crv.setBusinessname(ptjob.getBusiness().getName());
						if(null != ptjob.getJbname())
							crv.setPtjobname(ptjob.getJbname());
					}
					if(null != ptuser){
						if(null != ptuser.getName())
							crv.setPtusername(ptuser.getName());
						if(null != ptuser.getPhone())
							crv.setPtusertel(ptuser.getPhone());
					}
					crv.setPtuserid(ptuserid);
					crv.setState(cr.getState());
					complainRecordVos.add(crv);
				}
			}
		
		tr.commit();
		session.close();
		
		return complainRecordVos;
	}

	@Override
	public int getComplainTrueOrFalseAlready(Integer ptuserid,
			Integer ptjobid) {
		int complainrecord = 0;
		
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		String hql = "from ComplainRecord where ptuserid = '"+ptuserid+"' and ptjobid = '"+ptjobid+"'";;
		
		 List<ComplainRecord> list = session.createQuery(hql).list();
		 if(null != list){
			 if(list.size() > 0){
				 complainrecord = 1;//表示已经申诉，不能再进行申诉 list
			 }
		 }
		 
		
		tr.commit();
		session.close();
		
		return complainrecord;
	}

	@Override
	public Integer getCountByState(String State) {
		
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
			String hql = "select count(*) from ComplainRecord where state = '"+State+"'";
			
			Number number = (Number) session.createQuery(hql).uniqueResult();
			
		
		tr.commit();
		session.close();
		return number.intValue();
	}

	@Override
	public void changeComplainRecordState(Integer complainid, String state) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Session session = sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		ComplainRecord complainRecord = (ComplainRecord) session.get(ComplainRecord.class, complainid);
		if("1".equals(state.trim())){
			complainRecord.setState(state);
			complainRecord.setHandletime(sdf.format(new Date()));
		}
		if("0".equals(state.trim()))
			complainRecord.setState(state);
		tr.commit();
		session.close();
	}

}
