package apeak.startupcampus.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;


import apeak.startupcampus.common.Utils;

@Controller
@Component
public class SchedulerController {
	private static final Logger LOGGER = LoggerFactory.getLogger(SchedulerController.class);
	
	@Scheduled(cron="10 * * * *")
	public void test() {
		System.out.println("스케쥴러 테스트");
	}
	
	
	
	
	
}
