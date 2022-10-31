package com.spring.data.travel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TravelServiceImpl implements TravelService{

	@Autowired
	private TravelDao dao;
	
	@Override
	public List<TravelVo> travelList(TravelVo vo) {
		// TODO Auto-generated method stub
		return dao.travelList(vo);
	}

	@Override
	public int totalCount(TravelVo vo) {
		// TODO Auto-generated method stub
		return dao.totalCount(vo);
	}

	@Override
	public List<TravelVo> wardTravelCount(TravelVo vo) {
		// TODO Auto-generated method stub
		return dao.wardTravelCount(vo);
	}

	@Override
	public TravelVo getTravel(TravelVo vo) {
		// TODO Auto-generated method stub
		return dao.getTravel(vo);
	}

	@Override
	public void TravelInsert(TravelVo vo) {
		dao.TravelInsert(vo);
		
	}

	@Override
	public void TravelUpdate(TravelVo vo) {
		dao.TravelUpdate(vo);
		
	}

	@Override
	public void TravelDelete(TravelVo vo) {
		dao.TravelDelete(vo);
		
	}

	@Override
	public void CountCnt(TravelVo vo) {
		dao.CountCnt(vo);
		
	}

	@Override
	public List<TravelVo> select3(TravelVo vo) {
		// TODO Auto-generated method stub
		return dao.select3(vo);
	}

	@Override
	public void TravelUpdate2(TravelVo vo) {
		dao.TravelUpdate2(vo);
		
	}

}
