package com.spring.data.Login;

import java.util.List;

public interface LoginDao {
	
	void updateId(LoginVo vo);
	void updatenopwd(LoginVo vo);
	void deleteId(LoginVo vo);
	void insertID(LoginVo vo);
	
	LoginVo idLogin(LoginVo vo);
	List<LoginVo> idList(LoginVo vo);
	
	LoginVo idCheck(LoginVo vo);

}
