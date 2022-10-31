package com.spring.data.view;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.data.Login.BCrypt;
import com.spring.data.Login.LoginService;
import com.spring.data.Login.LoginVo;


@Controller
public class LoginController {
	
	@Autowired
	private LoginService service;
	
	@RequestMapping(value="/logininsert.do")
	public String Memberinsert(LoginVo vo, HttpSession session ) {
			
		try {
		if(session.getAttribute("idck").equals("nch") ) {
			session.setAttribute("idck", "nch1");
			return "/login/join.jsp";
		}else {
		
		if(service.idCheck(vo) != null) {
			session.setAttribute("idck", "nch1");
			return "/login/join.jsp";
		}
			
		Date  today = new Date();
		
		String BC = BCrypt.hashpw(vo.getPwd(), BCrypt.gensalt());
		
		vo.setDate(today);
		vo.setBcrypt(BC);
		vo.setRole("일반회원");
		
		service.insertID(vo);
		
		return "index.do";
		}
		}catch(NullPointerException e) {
			session.setAttribute("idck", "nch1");
			return "/login/join.jsp";
		}
	}
	
	@RequestMapping(value="/idCheck.do")
	public void idcheck(LoginVo vo, HttpServletResponse response, HttpSession session) 
			throws Exception{
		
		LoginVo m = service.idCheck(vo);
		
		int str;
		if(m==null) {
			session.setAttribute("idck", "ch");
			str=0;
		}else {
			session.setAttribute("idck", "nch");
			str=1;
		}
		PrintWriter out = response.getWriter();
		out.print(str);
		
	}
	
	@RequestMapping(value="/login.do")
	public String Login(LoginVo vo, Model model, HttpSession session ) 
			throws Exception{
			
		LoginVo m = service.idLogin(vo);
		if (m==null) {
			session.setAttribute("sw", "F");
			return "/login/login.jsp";
		}else {
			if (BCrypt.checkpw(vo.getPwd(), m.getBcrypt())) {
				session.setAttribute("name", m.getName());
				session.setAttribute("role", m.getRole());
				session.setAttribute("id", m.getId());
				
				return "index.do" ;
				
			}else {
				session.setAttribute("sw", "F");
				return "/login/login.jsp";
			}
		}
		
	}
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) 
			throws Exception{
		
		
		session.invalidate();
		
		return"index.do";
	}
	
	@RequestMapping(value="/member.do")
	public String member(LoginVo vo, Model model) 
			throws Exception{
		model.addAttribute("li",service.idList(vo));
		return"/login/memberList.jsp";
	}

	@RequestMapping(value="/deleteMember.do")
	public void deleteMember(LoginVo vo,HttpServletResponse response) 
			throws Exception{
	    service.deleteId(vo);
	}
	
	@RequestMapping(value="/myinfor.do")
	public String myinfor(LoginVo vo,Model model){
		model.addAttribute("m", service.idLogin(vo));
		
		return "/login/myinfor.jsp";
	}
	
	@RequestMapping(value="/updateMember.do")
	public String updateMember(LoginVo vo,  HttpSession session){
		
		LoginVo m = service.idLogin(vo);
		if(vo.getChpwd() == null || vo.getChpwd() == "") {
			if(m==null) {
				session.setAttribute("sw", "F");
				return "myinfor.do";
			}else{
				if(BCrypt.checkpw(vo.getPwd(), m.getBcrypt())) {
					vo.setBcrypt(m.getBcrypt());
					service.updatenopwd(vo);
					return "index.do";
				}else{
					session.setAttribute("sw", "F");
					return "myinfor.do";
				}
			}
			}else {
		
		if(m==null) {
			session.setAttribute("sw", "F");
			return "myinfor.do";
		}else{
			if(BCrypt.checkpw(vo.getPwd(), m.getBcrypt())) {

				System.out.println(vo.getChpwd());
				String BC = BCrypt.hashpw(vo.getChpwd(), BCrypt.gensalt());
				vo.setChpwd(BC);
				vo.setBcrypt(m.getBcrypt());
				service.updateId(vo);
				
				return "index.do";
			}else{
				session.setAttribute("sw", "F");
				return "myinfor.do";
			}
		}
	}
	}
	
	@RequestMapping(value="/resetsession.do")
	public String resetsession(LoginVo vo,HttpSession session){
		session.removeAttribute("sw");
		return "myinfor.do";
	}
	@RequestMapping(value="/resetsessionid.do")
	public String resetsessionid(HttpSession session){
		session.removeAttribute("sw");
		return "/login/login.jsp";
	}
	
	@RequestMapping(value="/join.do")
	public String resetSession(HttpSession session){
		session.invalidate();
		return "/login/join.jsp";
	}
	
	
	
}
