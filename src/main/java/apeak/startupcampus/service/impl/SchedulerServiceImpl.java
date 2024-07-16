package apeak.startupcampus.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import apeak.startupcampus.model.dao.AnnouncementMapper;
import apeak.startupcampus.service.SchedulerService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("schedulerService")
public class SchedulerServiceImpl extends EgovAbstractServiceImpl implements SchedulerService {
	private static final Logger LOGGER = LoggerFactory.getLogger(SchedulerServiceImpl.class);
	
	@Resource(name="announcementMapper")
	private AnnouncementMapper announcementMapper;
	
	
	public void test() {
		System.out.println("스케쥴러 테스트 service 도작");
	}
	
	public void updateLevel() {
		System.out.println("update Level service 실행");
		
		announcementMapper.updateAnnouncementPostLevel();
		
	}

}
