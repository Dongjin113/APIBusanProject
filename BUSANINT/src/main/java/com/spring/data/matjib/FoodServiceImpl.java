package com.spring.data.matjib;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FoodServiceImpl implements FoodService{

	@Autowired
	private FoodDao dao;
	
	@Override
	public List<FoodVo> getMatjibList(FoodVo vo) {
		return dao.getMatjibList(vo);
	}

	@Override
	public int totalCount(FoodVo vo) {
		return dao.totalCount(vo);
	}

	@Override
	public List<FoodVo> wardFoodCount(FoodVo vo) {

		
		return dao.wardFoodCount(vo);
	}

	@Override
	public void matjibInsert(FoodVo vo) {
		dao.matjibInsert(vo);
	}

	@Override
	public void matjibUpdate(FoodVo vo) {
		dao.matjibUpdate(vo);
	}

	@Override
	public void matjibDelete(FoodVo vo) {
		dao.matjibDelete(vo);
	}

	@Override
	public FoodVo getMatjib(FoodVo vo) {
		// TODO Auto-generated method stub
		return dao.getMatjib(vo);
	}
	
	@Override
	public void CountCnt(FoodVo vo) {
		dao.CountCnt(vo);
		
	}

	@Override
	public List<FoodVo> select5(FoodVo vo) {
		// TODO Auto-generated method stub
		return dao.select5(vo);
	}

	@Override
	public void matjibUpdate2(FoodVo vo) {	
		dao.matjibUpdate2(vo);
		
	}

	

}
