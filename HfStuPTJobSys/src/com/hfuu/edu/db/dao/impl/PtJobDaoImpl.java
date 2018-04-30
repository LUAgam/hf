package com.hfuu.edu.db.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hfuu.edu.common.QueryResult;
import com.hfuu.edu.db.dao.PtJobDao;
import com.hfuu.edu.entity.Business;
import com.hfuu.edu.entity.JobVerify;
import com.hfuu.edu.entity.Ptjob;

@Repository
public class PtJobDaoImpl implements PtJobDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Ptjob> getAllPtJob(Ptjob ptjob) {
		
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		String hql = "select * from ptjob";
		
		List<Ptjob> p = (List<Ptjob>) session.createQuery(hql);
		
		tr.commit();
		session.close();
		return p;
		
		
	}
	
	public QueryResult getPageAll(int startindex, int pagesize,String jbadress,String jbtype,String jbkind,
			String condition,String searchtxt){
		
		QueryResult qr = new QueryResult();
		Session session = sessionFactory.openSession();
		
		StringBuffer hql = new StringBuffer();
		hql.append("select p,ROUND(6378.138*2*ASIN(SQRT(POW(SIN((31.758363*PI()/180-p.lat*PI()/180)/2),2)+COS(31.758363*PI()/180)*COS(p.lat*PI()/180)*POW(SIN((117.259996*PI()/180-p.lng*PI()/180)/2),2)))*1000) AS distance from Ptjob p where 1=1 and state='1'");
		StringBuffer hql1 = new StringBuffer();
		 hql1.append("select count(*) from Ptjob where 1=1 and state='1'");
		if(null != jbadress && !"".equals(jbadress.trim()) && !"不限".equals(jbadress) && !"区域不限".equals(jbadress.trim())){
		  hql.append(" AND jbadress ='"+jbadress.trim()+"'");
		  hql1.append(" AND jbadress ='"+jbadress.trim()+"'");
		}
		if(null != jbtype && !"".equals(jbtype.trim()) && !"不限".equals(jbtype) && !"类型不限".equals(jbtype.trim())){
			  hql.append(" AND jbtype ='"+jbtype.trim()+"'");
			  hql1.append(" AND jbtype ='"+jbtype.trim()+"'");
		}
		if(null != jbkind && !"".equals(jbkind.trim()) && !"不限".equals(jbkind) && !"种类不限".equals(jbkind)){
			  hql.append(" AND jbkind ='"+jbkind.trim()+"'");
			  hql1.append(" AND jbkind ='"+jbkind.trim()+"'");
		}
		if(null != searchtxt && !"".equals(searchtxt.trim())){
			  hql.append(" AND jbname like'%"+searchtxt.trim()+"%'");
			  hql1.append(" AND jbname like'%"+searchtxt.trim()+"%'");
		}
		if(condition.trim().equals("0")){
			  hql.append(" order by releasetime desc ");
		}
		if(condition.trim().equals("1")){
			  hql.append(" order by salary desc");
		}
		if(condition.trim().equals("2")){
			  hql.append(" order by quantity desc ");
		}
		if(condition.trim().equals("3")){
			  hql.append(" order by distance asc ");
		}
			
		 
		Query query = session.createQuery(hql.toString());
		query.setFirstResult(startindex);
		query.setMaxResults(pagesize);
		List list = query.list();
		List<Ptjob> ptjobs = new ArrayList<Ptjob>();
		for(int i = 0; i<list.size(); i++){
			
			Object[] object = (Object[]) list.get(i);
			Ptjob ptjob = (Ptjob) object[0];
			double distance = (double) object[1];
			
			ptjob.setDistance(String.format("%.2f", distance/1000));
			ptjobs.add(ptjob);
		}
		
		qr.setList(ptjobs);
		Number num =  (Number)(session.createQuery(hql1.toString()).uniqueResult());
		qr.setTotalrecord(num.intValue());
		session.close();
		
		/*for(int i=0;i<list.size();i++){
			System.out.println("-------------------------dao"+list.get(i).toString());
		}*/
		
		
//		System.out.println("这事是dao层-------------------"+sbdwbm+"------"+mc+"--------"+cjyhmcstart);
		return qr;
		
	}

	@Override
	public void addPtjob(Ptjob ptjob) {
		
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		session.save(ptjob);
		
		tr.commit();
		session.close();
		
	}

	@Override
	public Ptjob getPtjobById(Integer id) {
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		Ptjob pj =  (Ptjob) session.get(Ptjob.class, id);
		
		tr.commit();
		session.close();
		
		return pj;
	}

	@Override
	public List<Ptjob> getRecommendPtJob(int startindex, int pagesize,
			String jbadress, String jbtype, String jbkind, String condition) {
		Session session = sessionFactory.openSession();
		StringBuffer hql = new StringBuffer();
		hql.append("from Ptjob where 1=1");
		StringBuffer hql1 = new StringBuffer();
		 hql1.append("select count(*) from Ptjob where 1=1");
		if(null != jbadress && !"".equals(jbadress.trim()) && !"不限".equals(jbadress)){
		  hql.append(" AND jbadress ='"+jbadress.trim()+"'");
		  hql1.append(" AND jbadress ='"+jbadress.trim()+"'");
		}
		if(null != jbtype && !"".equals(jbtype.trim()) && !"不限".equals(jbtype)){
			  hql.append(" AND jbtype ='"+jbtype.trim()+"'");
			  hql1.append(" AND jbtype ='"+jbtype.trim()+"'");
		}
		if(null != jbkind && !"".equals(jbkind.trim()) && !"不限".equals(jbkind)){
			  hql.append(" AND jbkind ='"+jbkind.trim()+"'");
			  hql1.append(" AND jbkind ='"+jbkind.trim()+"'");
		}
		if(condition.trim().equals("0")){
			  hql.append(" order by releasetime desc ");
		}
		if(condition.trim().equals("1")){
			  hql.append(" order by salary desc ");
		}
		if(condition.trim().equals("2")){
			  hql.append(" order by quantity desc ");
		}
		Query query = session.createQuery(hql.toString());
		query.setFirstResult(startindex);
		query.setMaxResults(pagesize);
		List<Ptjob> list = query.list();
		session.close();
		return list;
	}

	@Override
	public void addPtjob(Ptjob ptjob, Integer businessid) {
		
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		Business business = (Business) session.get(Business.class,businessid);
		
		ptjob.setBusiness(business);
		
		JobVerify jv = new JobVerify();
		jv.setEmployeenum("0");
		jv.setPtjob(ptjob);
		
		session.save(ptjob);
		session.save(jv);
		
		tr.commit();
		session.close();
		
		
	}

	@Override
	public void addOneQuantity(Integer ptjobid) {
		// TODO Auto-generated method stub
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		Ptjob ptjob	= (Ptjob) session.get(Ptjob.class, ptjobid);
		ptjob.setQuantity(ptjob.getQuantity()+1);
		session.save(ptjob);
		tr.commit();
		session.close();
		
		
	}

	@Override
	public void modifyPtjobState() {
		// TODO Auto-generated method stub
		
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		Date nowdate = new Date();
		String hql = "from Ptjob where state = 1";
		List<Ptjob> list = session.createQuery(hql).list();
		
		for(Ptjob p : list){
			if(null != p.getEnddate()){
				if(nowdate.compareTo(p.getEnddate())>0){
					
					p.setState("2");
					if(null == p.getJobverify()){
						JobVerify jv = new JobVerify();
						jv.setUndercarriagemsg("该职位已经过期0.0");
						jv.setEmployeenum("0");
						jv.setPtjob(p);
						session.save(jv);
					}else{
						p.getJobverify().setUndercarriagemsg("该职位已经过期啦");
					}
					System.out.println("------------------------------------------------------------------------职位过期啦");
				}
					
					
			}
		}
		
		
		tr.commit();
		session.close();
		
		
		
	}

	@Override
	public Integer getPtjobfCountByState(String state) {
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
	
		String hql = "select count(*) from Ptjob where state='"+state.trim()+"'";
		Number count = (Number) session.createQuery(hql).uniqueResult();
			
			
		tr.commit();
		session.close();
		
		return count.intValue();
	}

	@Override
	public List<Ptjob> getPtjobfByState(Integer startindex, Integer pagesize,String state) {
		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
		
		String hql = "from Ptjob where state='"+state.trim()+"'";
		Query query = session.createQuery(hql);
		query.setFirstResult(startindex);
		query.setMaxResults(pagesize);
		List<Ptjob> ptjobs = query.list();
		tr.commit();
		session.close();
		
		return ptjobs;
	}

	@Override
	public void changePtjobfByState(Integer ptjobid, String state,
			String jobverifyMsg) {

		Session session =  sessionFactory.openSession();
		Transaction tr = session.beginTransaction();
			if("2".equals(state.trim())){
				Ptjob ptjob = (Ptjob) session.get(Ptjob.class, ptjobid);
				ptjob.setState(state);
				if(null != jobverifyMsg){
					Integer verify = ptjob.getJobverify().getId();
					JobVerify jobVerify = (JobVerify) session.get(JobVerify.class, verify);
					jobVerify.setUndercarriagemsg(jobverifyMsg);
				}
			}
			if("1".equals(state.trim())){
				Ptjob ptjob = (Ptjob) session.get(Ptjob.class, ptjobid);
				ptjob.setState(state);
			}
			
		tr.commit();
		session.close();
		
	}

	
	
	
	
	
	
	
	
	
	

}
