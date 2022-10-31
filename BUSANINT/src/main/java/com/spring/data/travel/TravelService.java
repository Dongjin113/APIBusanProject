package com.spring.data.travel;

import java.util.List;



public interface TravelService {

	List<TravelVo> travelList(TravelVo vo); 
	
	int totalCount(TravelVo vo);
	
	List<TravelVo> wardTravelCount(TravelVo vo);
	List<TravelVo> select3(TravelVo vo);
	
	TravelVo getTravel(TravelVo vo);
	void TravelInsert(TravelVo vo);
	void TravelUpdate(TravelVo vo);
	void TravelUpdate2(TravelVo vo);
	void TravelDelete(TravelVo vo);
	
	void CountCnt(TravelVo vo);
	
}
