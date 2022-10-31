package com.spring.data.Login;

import java.util.Date;

import lombok.Data;

@Data
public class LoginVo {

	private String id;
	private String pwd;
	private String chpwd;
	private String bcrypt;
	private String name;
	private String postcode;
	private String roadAddress;
	private String detailAddress;
	private String tel;
	private String role;
	
	private Date date;
	private Date datestr;	
	
}
