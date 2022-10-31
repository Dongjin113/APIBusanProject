package com.spring.data.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MapServiceImpl implements MapService{
	
	@Autowired
	private MapDao dao;

	@Override
	public List<MatjibMapVo> getMatjibList(MatjibMapVo vo) {
		// TODO Auto-generated method stub
		return dao.getMatjibList(vo);
	}

	@Override
	public List<TravelMapVo> getTravelList(TravelMapVo vo) {
		// TODO Auto-generated method stub
		return dao.getTravelList(vo);
	}

}
