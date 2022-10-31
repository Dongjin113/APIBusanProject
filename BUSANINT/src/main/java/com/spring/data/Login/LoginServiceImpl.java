package com.spring.data.Login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDao dao;
	
	@Override
	public void updateId(LoginVo vo) {

		dao.updateId(vo);
		
	}

	@Override
	public void deleteId(LoginVo vo) {

		dao.deleteId(vo);
		
	}

	@Override
	public void insertID(LoginVo vo) {

		dao.insertID(vo);
		
	}

	@Override
	public LoginVo idLogin(LoginVo vo) {

		return dao.idLogin(vo);
	}

	@Override
	public List<LoginVo> idList(LoginVo vo) {

		return dao.idList(vo);
	}

	@Override
	public LoginVo idCheck(LoginVo vo) {

		return dao.idCheck(vo);
	}

	@Override
	public void updatenopwd(LoginVo vo) {
		dao.updatenopwd(vo);
		
	}

}
