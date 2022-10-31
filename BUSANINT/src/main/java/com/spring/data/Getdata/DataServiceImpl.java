package com.spring.data.Getdata;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DataServiceImpl implements DataService{

	@Autowired
	private DataDao dao;
	
	@Override
	public void getMatjib(FoodVo vo) {

		dao.getMatjib(vo);
		
	}

	@Override
	public void getTravel(TravelVo VO) {

		dao.getTravel(VO);
	}
	
	

}
