package com.spring.data.matjib;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FoodVo {
	
	private int SEQ;
	private String main_title; // MAIN_TITLE 음식점이름
	private double lng; //<LNG> 경도
	private double lat;//<LAT> 위도
	private String tel; //<CNTCT_TEL> 음식점 번호
	private String introduce; //ITEMCNTNTS 음식점소개
	private String business_hours;//<USAGE_DAY_WEEK_AND_TIME> 영업시간
	private String ward;//<GUGUN_NM> 지역구
	private String addr;//<ADDR1> 주소
	private String menu;//<RPRSNTV_MENU> 대표메뉴명
	private String imgaddr;//<MAIN_IMG_THUMB> 이미지주소
	private MultipartFile imgFile;
	
	private  String   searchCondition; 
	private  String   searchKeyword; 
	  
	private  int   totalCount;
	private  int   startIdx;
	private  int   endIdx;
	private  int   wardFoodCount;
	
	private  int   cnt;
	
	private String id;
}
