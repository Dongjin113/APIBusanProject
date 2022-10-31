package com.spring.data.Login;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDaoImpl implements LoginDao{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void updateId(LoginVo vo) {
		mybatis.update("LOGIN.update", vo);
		
	}

	@Override
	public void deleteId(LoginVo vo) {
		mybatis.delete("LOGIN.delete", vo);
		
	}

	@Override
	public void insertID(LoginVo vo) {
		mybatis.insert("LOGIN.insert", vo);
		
	}

	@Override
	public LoginVo idLogin(LoginVo vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("LOGIN.login", vo);
	}

	@Override
	public List<LoginVo> idList(LoginVo vo) {
		return mybatis.selectList("LOGIN.list");
	}

	@Override
	public LoginVo idCheck(LoginVo vo) {
		return mybatis.selectOne("LOGIN.idck", vo);
	}

	@Override
	public void updatenopwd(LoginVo vo) {
		mybatis.update("LOGIN.updatenopwd", vo);
		
	}
	
}
