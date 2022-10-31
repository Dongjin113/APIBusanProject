package com.spring.data.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.data.map.MapService;
import com.spring.data.map.MatjibMapVo;
import com.spring.data.map.TravelMapVo;

@Controller
public class MapController {
	
	@Autowired
	private MapService service;
	
	@RequestMapping(value="/matjibmap.do")
	public String MatjibMap(MatjibMapVo vo, Model model ) {

		model.addAttribute("li", service.getMatjibList(vo));
		
		return "/map/matjibmap.jsp";
		
	}
	
	@RequestMapping(value="/travelmap.do")
	public String TravelMap(TravelMapVo vo, Model model ) {

		model.addAttribute("li", service.getTravelList(vo));
		
		return "/map/travelmap.jsp";
		
	}
	
	
	
	
	

}
