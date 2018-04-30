package com.hfuu.edu.entity;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;


public class MtmTest {
	
	
	private static SessionFactory sessionFactory = new Configuration()//
			.configure()//
			.buildSessionFactory();

	public static void main(String[] args) {

//		 createTable();

//		save();

		 get();
		
//		delete();
		
	}

	public static void createTable() {
		Configuration cfg = new Configuration().configure();
		SchemaExport se = new SchemaExport(cfg);
		se.create(true, true);
	}

	public static void save() {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		// --------------------------------------------

		User u1 = new User();
		u1.setUsername("111");
		u1.setPassword("1111");
		User u2 = new User();
		u2.setUsername("222");
		u2.setPassword("2222");
		
		Business bs1 = new Business();
		bs1.setName("商家1");
		bs1.setContacts("rfrr");
		bs1.setIndustry("efeew");
		bs1.setNature("3r44tr");
		bs1.setPhone("1468468");
		bs1.setScale("dere");
		bs1.setEmail("fwfeewr");
		bs1.setIntroduction("ftrttr");
		Business bs2 = new Business();
		bs2.setName("商家2");
		
		Ptjob pj = new Ptjob();
		pj.setJbname("职位工作1");
		
		
		Ptuser pu1 = new Ptuser();
		pu1.setName("学生1");
		Ptuser pu2 = new Ptuser();
		pu2.setName("学生2");
		
		Comments cm1 = new Comments();
		cm1.setComment("总评论");
		Comments cm2 = new Comments();
		cm2.setComment("子评论1");
		Comments cm3 = new Comments();
		cm3.setComment("子评论2");
		Comments cm4 = new Comments();
		cm3.setComment("子评论3");
		
		
		bs1.setUser(u1);
		pu1.setUser(u2);
		
		pj.setBusiness(bs1);
		
		/*pj.getComments().add(cm1);
		
		cm1.getChilden().add(cm2);
		cm1.getChilden().add(cm3);*/
		
		cm2.setParent(cm1);
		cm3.setParent(cm1);
		cm1.setPtjob(pj);
		
		cm1.setPtuser(pu1);
		cm2.setBussiness(bs1);
		cm3.setPtuser(pu1);
		
		
		JobCollection jc = new JobCollection();
		jc.setPtjob(pj);
		jc.setPtuser(pu1);
		
		JobApply ja = new JobApply();
		ja.setPtjob(pj);
		ja.setPtuser(pu1);
		
//		bs1.getPtjobs().add(pj);
//		pu1.getPtjobs().add(pj);
		
		session.save(u1);
		session.save(u2);
		session.save(bs1);
		session.save(bs2);
		session.save(pj);
		session.save(pu1);
		session.save(pu2);
		session.save(cm1);
		session.save(cm2);
		session.save(cm3);
		session.save(jc);
		session.save(ja);

		// --------------------------------------------
		session.getTransaction().commit();
		session.close();
	}

	public static void get() {

		Session session = sessionFactory.openSession();
		session.beginTransaction();

//		Teacher teacher = (Teacher) session.get(Teacher.class, 1);
		
//		Business bs =  (Business) session.get(Business.class, 2);
//		Ptuser bs =  (Ptuser) session.get(Ptuser.class, 2);
// 		User u = (User) session.get(User.class, 1);
		Ptjob p = (Ptjob) session.get(Ptjob.class, 3);
//		Comments c = (Comments) session.get(Comments.class, 8);
		
		
//		
//		System.out.println(teacher.toString());
//		System.out.println(bs.toString());
		/*for(Ptjob p : u.getBusiness().getPtjobs()){
			for(Comments c : p.getComments()){
				for(Comments c1: c.getChilden()){
					if(null != c1.getPtuser()){
						System.out.println(c1.getPtuser().getName());
					}
					if(null != c1.getBussiness()){
						System.out.println(c1.getBussiness().getName());
					}
					
				}
				
			}
			
		}*/
		
//		System.out.println(u.getBusiness().getPtjobs().size());
//		System.out.println(p.getBusiness().getUser().getUsername());
//		System.out.println(c.getParent().getPtjob().getBusiness().getUser().getUsername());
		System.out.println(p.getJobApplies().size());
		
		session.getTransaction().commit();
		session.close();

	}
	
	public static void delete() {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
//		Business bs =  (Business) session.get(Business.class, 2);
		Ptuser bs =  (Ptuser) session.get(Ptuser.class, 4);
		session.delete(bs);

		session.getTransaction().commit();
		session.close();
		
	}

}
