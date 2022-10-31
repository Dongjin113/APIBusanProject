package com.spring.data.Getdata;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DataDaoImpl implements DataDao{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void getMatjib(FoodVo vo) {
		
		mybatis.insert("GETDATA.food", vo);
		
	}

	@Override
	public void getTravel(TravelVo vo) {
		mybatis.insert("GETDATA.travel", vo);
		
	}

}
