package com.spring.data.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.data.matjib.FoodService;
import com.spring.data.matjib.FoodVo;
import com.spring.data.travel.TravelService;
import com.spring.data.travel.TravelVo;

@Controller
public class IndexController {
	
	@Autowired
	private FoodService foodservice;
	
	@Autowired
	private TravelService travelservice;
	
	@RequestMapping("index.do")
	public  String   select5 ( FoodVo vo, TravelVo m ,Model model) {
		
	model.addAttribute("li", foodservice.select5(vo));
	model.addAttribute("m", travelservice.select3(m));
		
	return "/home/index.jsp";
	}

}
