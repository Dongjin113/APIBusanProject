package com.spring.data.matjib;

import java.util.List;

public interface FoodService {

	List<FoodVo> getMatjibList(FoodVo vo);
	FoodVo getMatjib(FoodVo vo);
	
	int totalCount(FoodVo vo);

	
	List<FoodVo> wardFoodCount(FoodVo vo);
	List<FoodVo> select5(FoodVo vo);
	
	void matjibInsert(FoodVo vo);
	void matjibUpdate(FoodVo vo);
	void matjibDelete(FoodVo vo);
	void matjibUpdate2(FoodVo vo);
	
	
	void CountCnt(FoodVo vo);
	
	
}
