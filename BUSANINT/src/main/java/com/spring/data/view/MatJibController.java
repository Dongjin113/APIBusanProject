package com.spring.data.view;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.data.matjib.FoodService;
import com.spring.data.matjib.FoodVo;


@Controller
public class MatJibController {
	
	@Autowired
	private FoodService service;
	
	String path ="";	
	String timeStr ="";
	
	public MatJibController(){
		long time = System.currentTimeMillis();
		SimpleDateFormat daytime =new SimpleDateFormat("HHmmss");
		timeStr=daytime.format(time);
	}
	
	@RequestMapping(value="/matjib.do")
	public String MatjibList(FoodVo vo, Model model ) {

		if (vo.getStartIdx() ==0) {
			  vo.setStartIdx(1);
			} else {
			  vo.setStartIdx(vo.getStartIdx());
			}
			
			vo.setEndIdx(vo.getStartIdx()+4);	
			int k = service.totalCount(vo);
			int pageSize= 5;
			int totalPage =(int) Math.ceil( k / (double)pageSize);
			int nowPage =  ( vo.getStartIdx() / pageSize ) +  1 ;
			int endPage = ( totalPage - 1 ) * pageSize + 1 ;
			
			
			model.addAttribute("startIdx",vo.getStartIdx());
			model.addAttribute("totalPage",totalPage); 
			model.addAttribute("nowPage",nowPage);  
			model.addAttribute("endPage",endPage);  
			model.addAttribute("pageSize",pageSize);
			
			model.addAttribute("searchCondition",vo.getSearchCondition());
			model.addAttribute("searchKeyword",vo.getSearchKeyword());
						
			model.addAttribute("totalCount",service.totalCount(vo));
			model.addAttribute("wd", service.wardFoodCount(vo));
			model.addAttribute("li", service.getMatjibList(vo));
		
		return "/matjib/matjib.jsp";
	}
	
	@RequestMapping(value="/matjibwrite.do")
	public String Matjibwrite(FoodVo vo, Model model, HttpSession session ) {

		
		model.addAttribute("li", service.wardFoodCount(vo));
		
		
		if(session.getAttribute("role")==null) {
			return "/home/error.jsp";
		}else if(session.getAttribute("role").equals("?????????")) {
			return "/matjib/matjibwrite.jsp";
		}else{
			return "/home/error.jsp";
		}
	}
	
	@RequestMapping(value="/matjibInsert.do")
	public String MatjibInsert(FoodVo vo,HttpServletRequest request, HttpSession session) throws Exception{
		
		path=request.getSession().getServletContext().getRealPath("/FoodIMG/");
		
		MultipartFile updateFile =vo.getImgFile(); // ????????????
		String fileName = updateFile.getOriginalFilename(); // ????????? ?????????
		
		File f = new File(path+fileName);
		
		if(!updateFile.isEmpty()) {  // ????????? ?????????
			
			if (f.exists()) {  // ??????????????? ????????? ??????
				String onlyFileName= fileName.substring(0, fileName.lastIndexOf("."));
				String extension = fileName.substring(fileName.lastIndexOf("."));
				fileName = onlyFileName+"_"+timeStr+extension;
				updateFile.transferTo(new File(path + fileName));
			} else { // ?????? ????????? ????????? ???????????? ??????
				updateFile.transferTo(new File(path + fileName));
			}
		}else {
			fileName = "??????.png";
		} 		
		vo.setImgaddr(fileName);		
		service.matjibInsert(vo);
		
		if(session.getAttribute("role")==null) {
			return "/home/error.jsp";
		}else if(session.getAttribute("role").equals("?????????")) {
			return "matjib.do";
		}else{
			return "/home/error.jsp";
		}
		
	}
	
	
	
	@RequestMapping(value="/matjibEdit.do")
	public String matjibEdit(FoodVo vo, Model model, HttpSession session){
		
		model.addAttribute("li", service.wardFoodCount(vo));
		model.addAttribute("m", service.getMatjib(vo));
		
		
		if(session.getAttribute("role")==null) {
			return "/home/error.jsp";
		}else if(session.getAttribute("role").equals("?????????")) {
			return "/matjib/matjibEdit.jsp";
		}else{
			return "/home/error.jsp";
		}
	}
	
	
	
	@RequestMapping(value="/UpdateMatjib.do")
	public String UpdateMatjib(FoodVo vo, Model model, HttpServletRequest request,HttpSession session) throws Exception{
		
		
		path=request.getSession().getServletContext().getRealPath("/FoodIMG/");
		
		MultipartFile updateFile =vo.getImgFile(); // ????????????
		String fileName = updateFile.getOriginalFilename(); // ????????? ?????????
		FoodVo m= service.getMatjib(vo);
		
		File f = new File(path+fileName);
		
		if(!updateFile.isEmpty()) { // ??????????????? ?????? ????????? ??????
			 File fileDel = new File(path + m.getImgaddr());
			 //?????? ?????? ??????
			 if (!m.getImgaddr().equals("??????.png")) {
			   if(fileDel.exists()) {
				  fileDel.delete() ;
			   }
			 }
			   // ??????????????? ????????? ??????
			   if (f.exists()) {  
					String onlyFileName= fileName.substring(0, fileName.lastIndexOf("."));
					String extension = fileName.substring(fileName.lastIndexOf("."));
					fileName = onlyFileName+"_"+timeStr+extension;
					updateFile.transferTo(new File(path + fileName));
					vo.setImgaddr(fileName);
					
				} else { 
					// ?????? ????????? ????????? ??????
					updateFile.transferTo(new File(path + fileName));
					vo.setImgaddr(fileName);
				}			 
			
		}else {
			 //????????? ??????????????? ??????????????? ??????
			 vo.setImgaddr(m.getImgaddr());
		}
		
				
				if(session.getAttribute("role")==null) {
					return "/home/error.jsp";
				}else if(session.getAttribute("role").equals("?????????")) {
					if(vo.getSEQ() <= 150) {
						if(!updateFile.isEmpty()) {
							service.matjibUpdate2(vo);
						}else {
							service.matjibUpdate(vo);
						}
					}else {
					service.matjibUpdate(vo);
					}
					return "matjib.do";
				}else{
					return "/home/error.jsp";
				}
		
	}
	
	@RequestMapping(value="/delFood.do")
	public String DelFood(FoodVo vo,HttpServletRequest request,HttpSession session){
		
		path=request.getSession().getServletContext().getRealPath("/FoodIMG/");

		System.out.println(vo.getSEQ());
		System.out.println(path);
		 vo = service.getMatjib(vo);  // ????????? ???????????? 
		 String delFile = vo.getImgaddr();
		 
		 File f = new File(path + delFile);
		 if (!delFile.equals("??????.png")) {
			 if(f.exists()) {
				f.delete() ;
			 }
		 }
		 	
		 if(session.getAttribute("role")==null) {
				return "/home/error.jsp";
			}else if(session.getAttribute("role").equals("?????????")) {
				service.matjibDelete(vo);
				return "matjib.do";
			}else{
				return "/home/error.jsp";
			}
		 
			
		 		
		
		
	}
	
	@RequestMapping(value="/matjibdetail.do")
	public String matjibdetail(FoodVo vo, Model model){
		
		service.CountCnt(vo);
		model.addAttribute("m", service.getMatjib(vo));
		
		return "/matjib/matjibDetail.jsp";
	}
	
	
	
	
}
