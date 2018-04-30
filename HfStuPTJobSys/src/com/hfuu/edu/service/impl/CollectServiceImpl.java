package com.hfuu.edu.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hfuu.edu.common.MyCollect;
import com.hfuu.edu.db.dao.CollectDao;
import com.hfuu.edu.entity.JobCollection;
import com.hfuu.edu.service.CollectService;
import com.hfuu.edu.utils.DistanceTime;

@Service
public class CollectServiceImpl implements CollectService {
	
	@Autowired
	private CollectDao collectDao;
	@Autowired
	private DistanceTime distanceTime;

	@Override
	public List<MyCollect> getUserCollectByUserId(Integer Userid) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		List<MyCollect> mycollects = new ArrayList<MyCollect>();
		Set<JobCollection> collections = collectDao.getUserCollectByUserId(Userid);
		for(JobCollection jc : collections){
			
			MyCollect mycollect = new MyCollect();
			mycollect.setId(jc.getId());
			mycollect.setColttime(distanceTime.disTime(new Date(), jc.getColttime()));
			mycollect.setUrlImg(jc.getPtjob().getImgurl());
			mycollect.setJobname(jc.getPtjob().getJbname());
			mycollect.setAddress(jc.getPtjob().getJbadress());//工作地址
			mycollects.add(mycollect);
		}
		
		
		return mycollects;
	}

	@Override
	public void saveOneCollect(Integer ptjobid, Integer ptuserid) {
		
		collectDao.saveOneCollect(ptjobid, ptuserid);
		
	}

	@Override
	public void deleteOneCollect(Integer mycollectid) {
		
		collectDao.deleteOneCollect(mycollectid);
		
	}


}
