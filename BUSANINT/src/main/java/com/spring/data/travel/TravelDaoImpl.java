package com.spring.data.travel;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class TravelDaoImpl implements TravelDao{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<TravelVo> travelList(TravelVo vo) {
		
		return mybatis.selectList("TRAVEL.travelList", vo);
	}

	@Override
	public int totalCount(TravelVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("TRAVEL.totalCount", vo);
	}

	@Override
	public List<TravelVo> wardTravelCount(TravelVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("TRAVEL.selectWard", vo);
	}

	@Override
	public TravelVo getTravel(TravelVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("TRAVEL.travelEdit", vo);
	}

	@Override
	public void TravelInsert(TravelVo vo) {
		// TODO Auto-generated method stub
		mybatis.insert("TRAVEL.travelInsert", vo);
	}

	@Override
	public void TravelUpdate(TravelVo vo) {
		mybatis.update("TRAVEL.travelUpdate", vo);
		
	}

	@Override
	public void TravelDelete(TravelVo vo) {
		mybatis.delete("TRAVEL.travelDelete", vo);
		
	}

	@Override
	public void CountCnt(TravelVo vo) {
		mybatis.update("TRAVEL.travelCnt",vo);
		
	}

	@Override
	public List<TravelVo> select3(TravelVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("TRAVEL.travelTop3", vo);
	}

	@Override
	public void TravelUpdate2(TravelVo vo) {
		mybatis.update("TRAVEL.travelUpdate2",vo);
		
	}

	
	
	
	
}


