package com.spring.data.map;

import java.util.List;

public interface MapService {
	
	List<MatjibMapVo> getMatjibList(MatjibMapVo vo);
	List<TravelMapVo> getTravelList(TravelMapVo vo);

}
