package com.spring.data.matjib;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FoodDaoImpl implements FoodDao{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<FoodVo> getMatjibList(FoodVo vo) {
		
		return mybatis.selectList("MATJIB.matjibList", vo);
	}

	@Override
	public int totalCount(FoodVo vo) {
		
		return mybatis.selectOne("MATJIB.totalCount", vo);
	}

	@Override
	public List<FoodVo> wardFoodCount(FoodVo vo) {

		return mybatis.selectList("MATJIB.selectWard",vo);
	}

	@Override
	public void matjibInsert(FoodVo vo) {
		mybatis.insert("MATJIB.matjibInsert", vo);
		
	}

	@Override
	public void matjibUpdate(FoodVo vo) {
		mybatis.update("MATJIB.matjibUpdate", vo);
		
	}

	@Override
	public void matjibDelete(FoodVo vo) {
		mybatis.insert("MATJIB.matjibDelete", vo);
		
	}

	@Override
	public FoodVo getMatjib(FoodVo vo) {
		return mybatis.selectOne("MATJIB.matjibEdit", vo);
	}


	@Override
	public void CountCnt(FoodVo vo) {
		mybatis.update("MATJIB.matjibCnt", vo);
		
	}

	@Override
	public List<FoodVo> select5(FoodVo vo) {
		
		return mybatis.selectList("MATJIB.matjibTop5",vo);
	}

	@Override
	public void matjibUpdate2(FoodVo vo) {
		mybatis.update("MATJIB.matjibUpdate2", vo);
		
	}
	
	


	
	
}
