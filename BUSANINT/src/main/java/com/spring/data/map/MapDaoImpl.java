package com.spring.data.map;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MapDaoImpl implements MapDao{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<MatjibMapVo> getMatjibList(MatjibMapVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("MAP.matjib", vo);
	}

	@Override
	public List<TravelMapVo> getTravelList(TravelMapVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("MAP.travel", vo);
	}

}
