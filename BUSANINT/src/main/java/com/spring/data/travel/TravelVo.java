package com.spring.data.travel;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TravelVo {
	
	private int SEQ;
	private String place;//PLACE
	private String title;//TITLE
	private double lng;//<LNG> 경도
	private double lat;//<LAT> 위도
	private String disabled;//<MIDDLE_SIZE_RM1> 장애인 접근 시설
	private String price;//<USAGE_AMOUNT> 가격
	private String tel;//<CNTCT_TEL> 시설 전화번호
	private String public_transport;//<TRFC_INFO> 대중교통
	private String dayoff;//<HLDY_INFO> 휴일
	private String subtitle;//<SUBTITLE> 부제목
	private String introduce; //<ITEMCNTNTS> 관광지소개
	
	private String business_hours;//<USAGE_DAY_WEEK_AND_TIME> 영업시간
	private String ward;//<GUGUN_NM> 지역
	private String addr;//<ADDR1> 주소
	private String homepage;//<HOMEPAGE_URL> 홈페이지 주소
	private String imgaddr;// <MAIN_IMG_THUMB> 이미지주소
	private MultipartFile imgFile;
	
	
	private  String   searchCondition; 
	private  String   searchKeyword; 
	  
	private  int   totalCount;
	private  int   startIdx;
	private  int   endIdx;
	

	private  int   wardTravelCount;
	private  int   cnt;
	

}
