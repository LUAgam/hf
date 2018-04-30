package com.hfuu.edu.common;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hfuu.edu.entity.JobApply;
import com.hfuu.edu.service.ApplyService;
import com.hfuu.edu.service.PtJobService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring-*.xml"}) 
public class JunitTest {

	@Resource
	private PtJobService ptJobService;
	@Resource
	private ApplyService applyService;
	
	@Test
	public void testAddOneQuantity(){
		ptJobService.addOneQuantity(1);
	}
	@Test
	public void testSelectOneJobApplyByState(){
		List<JobApply> jobapplys = applyService.selectAllApplyById(1);
		for(JobApply jobapply : jobapplys){
			System.out.println(jobapply.toString());
		}
	}
	
	
	
	
	
}
