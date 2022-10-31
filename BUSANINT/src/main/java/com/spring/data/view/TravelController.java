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

import com.spring.data.travel.TravelService;
import com.spring.data.travel.TravelVo;


@Controller
public class TravelController {
	
	@Autowired
	private TravelService service;
	
	String path ="";	
	String timeStr ="";
	
	public TravelController(){
		long time = System.currentTimeMillis();
		SimpleDateFormat daytime =new SimpleDateFormat("HHmmss");
		timeStr=daytime.format(time);
	}
	
	@RequestMapping(value="/travel.do")
	public String Memberinsert(TravelVo vo, Model model ) {
		
		if (vo.getStartIdx() ==0) {
			  vo.setStartIdx(1);
			} else {
			  vo.setStartIdx(vo.getStartIdx());
			}
			System.out.println( "처음값" + " startidx : " +vo.getStartIdx());
			
			vo.setEndIdx(vo.getStartIdx()+2);	
			System.out.println( "처음값" + " endidx : "+ vo.getEndIdx());
			
			int k = service.totalCount(vo);
			int pageSize= 3;
			int totalPage =(int) Math.ceil( k / (double)pageSize);
			int nowPage =  ( vo.getStartIdx() / pageSize ) +  1 ;
			
			int endPage = ( totalPage - 1 ) * pageSize + 1 ;
			

			System.out.println( "둘째값" + "startidx : " +vo.getStartIdx() + " ,endidx : "+ vo.getEndIdx());

			System.out.println( "둘째값" + "nowPage" + nowPage +" ,endPage"+ endPage);

			System.out.println( "셋째값" + "SearchConditon" + nowPage +" ,endPage"+ endPage);
			System.out.println("searchCondition" + vo.getSearchCondition());
			System.out.println("searchKeyword" + vo.getSearchKeyword());
			
			model.addAttribute("startIdx",vo.getStartIdx());
			model.addAttribute("totalPage",totalPage); // 전체페이지
			model.addAttribute("nowPage",nowPage);  // 현재페이지
			model.addAttribute("endPage",endPage);  // 현재페이지

			// 검색추가
			model.addAttribute("searchCondition",vo.getSearchCondition());
			model.addAttribute("searchKeyword",vo.getSearchKeyword());
			
			
			
			model.addAttribute("totalCount",service.totalCount(vo)); // 전체레코드 수 
			
			model.addAttribute("wd", service.wardTravelCount(vo));		
		
			model.addAttribute("li", service.travelList(vo));
		
		return "/travel/travel.jsp";
	}
	
	@RequestMapping(value="/travelwrite.do")
	public String Travelwrite(TravelVo vo, Model model, HttpSession session ) {

		 
		model.addAttribute("li", service.wardTravelCount(vo));
		
		
		if(session.getAttribute("role")==null) {
			return "/home/error.jsp";
		}else if(session.getAttribute("role").equals("관리자")) {
			
			return "/travel/travelwrite.jsp";
		}else{
			return "/home/error.jsp";
		}
		
	}
	
	@RequestMapping(value="/travelInsert.do")
	public String TravelInsert(TravelVo vo,HttpServletRequest request, HttpSession session) throws Exception{
		
		path=request.getSession().getServletContext().getRealPath("/TravelIMG/");
		System.out.println("확인 path:" + path);
		System.out.println(vo);
		MultipartFile updateFile =vo.getImgFile(); // 실제파일
		String fileName = updateFile.getOriginalFilename(); // 넘어온 파일명
		
		File f = new File(path+fileName);
		
		if(!updateFile.isEmpty()) {  // 파일이 있으면
			
			if (f.exists()) {  // 중복파일이 있으면 처리
				String onlyFileName= fileName.substring(0, fileName.lastIndexOf("."));
				String extension = fileName.substring(fileName.lastIndexOf("."));
				System.out.println("확장자 확인" + extension);
				fileName = onlyFileName+"_"+timeStr+extension;
				updateFile.transferTo(new File(path + fileName));
			} else { // 중복 파일이 없으면 처리하는 영역
				updateFile.transferTo(new File(path + fileName));
			}
		}else {
			fileName = "둘리.png";
		} 		
		vo.setImgaddr(fileName);		
		
		if(session.getAttribute("role")==null) {
			return "/home/error.jsp";
		}else if(session.getAttribute("role").equals("관리자")) {
			
			service.TravelInsert(vo);
			
			return "travel.do";
		}else{
			return "/home/error.jsp";
		}
		
		
	}
	
	
	
	@RequestMapping(value="/travelEdit.do")
	public String travelEdit(TravelVo vo, Model model, HttpSession session){
		
		model.addAttribute("li", service.wardTravelCount(vo));
		model.addAttribute("m", service.getTravel(vo));
		
		
		if(session.getAttribute("role")==null) {
			return "/home/error.jsp";
		}else if(session.getAttribute("role").equals("관리자")) {
			return "/travel/travleEdit.jsp";
		}else{
			return "/home/error.jsp";
		}
	}
	
	
	
	@RequestMapping(value="/UpdateTravel.do")
	public String UpdateTravel(TravelVo vo, Model model, HttpServletRequest request, HttpSession session) throws Exception{
		System.out.println(vo);
		
		path=request.getSession().getServletContext().getRealPath("/TravelIMG/");
		
		MultipartFile updateFile =vo.getImgFile(); // 실제파일
		String fileName = updateFile.getOriginalFilename(); // 넘어온 파일명
		TravelVo m= service.getTravel(vo);
		
		
		System.out.println("m의 값: "+m);
		
		File f = new File(path+fileName);
		System.out.println("path: "+path);
		System.out.println("updateFile: " +updateFile);
		System.out.println("fileName: " +fileName);
		System.out.println("f: " +f);
		
		if(!updateFile.isEmpty()) { // 첨부파일이 넘어 왔으면 실행
			 // 기존 레코드의 파일을 체크 시작
			System.out.println("===> 확인 :" + m);
			 File fileDel = new File(path + m.getImgaddr());
			 System.out.println("fileDel : " +fileDel);
			 System.out.println("m.getImgaddr"+m.getImgaddr());
			 if (!m.getImgaddr().equals("둘리.png")) {
			   if(fileDel.exists()) {
				  fileDel.delete() ;
			   }
			 }// 기존 레코드의 파일을 체크 끝
			  
			 
			   if (f.exists()) {  // 중복파일이 있으면 처리
					String onlyFileName= fileName.substring(0, fileName.lastIndexOf("."));
					String extension = fileName.substring(fileName.lastIndexOf("."));
					fileName = onlyFileName+"_"+timeStr+extension;
					updateFile.transferTo(new File(path + fileName));
					vo.setImgaddr(fileName);
					
				} else { // 중복 파일이 없으면 처리하는 영역

					updateFile.transferTo(new File(path + fileName));
					vo.setImgaddr(fileName);
				}			 
			
		}else {
			System.out.println(m.getImgaddr());
			 vo.setImgaddr(m.getImgaddr());
		}
		
		if(session.getAttribute("role")==null) {
			return "/home/error.jsp";
		}else if(session.getAttribute("role").equals("관리자")) {
			if(vo.getSEQ() <=120) {
				if(!updateFile.isEmpty()) {
					service.TravelUpdate2(vo);
				}else {
					service.TravelUpdate(vo);
				}
			}else {
			service.TravelUpdate(vo);
			}
			return "travel.do";
		}else{
			return "/home/error.jsp";
		}
				
		
	}
	
	@RequestMapping(value="/deltravel.do")
	public String DelTravel(TravelVo vo,HttpServletRequest request, HttpSession session){
		
		path=request.getSession().getServletContext().getRealPath("/TravelIMG/");

		System.out.println(vo.getSEQ());
		System.out.println(path);
		 vo = service.getTravel(vo);  // 삭제할 파일찾기 
		 String delFile = vo.getImgaddr();
		 
		 File f = new File(path + delFile);
		 if (!delFile.equals("둘리.png")) {
			 if(f.exists()) {
				f.delete() ;
			 }
		 }
		 
		if(session.getAttribute("role")==null) {
				return "/home/error.jsp";
		}else if(session.getAttribute("role").equals("관리자")) {
				service.TravelDelete(vo);
				return "travel.do";
		}else{
				return "/home/error.jsp";
		}
		 	
		
	}
	
	@RequestMapping(value="/traveldetail.do")
	public String TravelDetail(TravelVo vo, Model model){
		
		service.CountCnt(vo);
		model.addAttribute("m", service.getTravel(vo));
		
		return "/travel/travelDetail.jsp";
	}
	
	
	
}
