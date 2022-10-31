package com.spring.data.map;

import java.util.List;

public interface MapDao {
	
	List<MatjibMapVo> getMatjibList(MatjibMapVo vo);
	List<TravelMapVo> getTravelList(TravelMapVo vo);

}
