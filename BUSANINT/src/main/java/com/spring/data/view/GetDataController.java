package com.spring.data.view;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import com.spring.data.Getdata.DataService;
import com.spring.data.Getdata.FoodVo;
import com.spring.data.Getdata.TravelVo;

@Controller
public class GetDataController {

	@Autowired(required=true)
	private DataService service;
	
	@RequestMapping("foodData.do")
	public  String   foodData( FoodVo vo) throws Exception {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/FoodService/getFoodKr"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=jrLHt4JyJ5Ekiiok06JukET40YfK9YrFUNt%2FwVvLdBIt7sZaGbyU%2F9rjGuk0WYaW%2FD5160RFRzdvD7JqpalbKg%3D%3D"); /*Service Key (일반인증키)*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("150", "UTF-8")); /*한 페이지 결과 수 (최소 10, 최대 9999)*/
        urlBuilder.append("&" + URLEncoder.encode("returnType","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*상태갱신 조회 범위(분) (기본값 5, 최소 1, 최대 10)*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        Node data1 = null;   
        Node data2 = null;   
        Node data3 = null;
        Node data4 = null;   
        Node data6 = null;
        Node data7 = null;   
        Node data8 = null;   
        Node data9 = null;
        Node data10 = null;   
        Node data11 = null;  
        
        try {
        	DocumentBuilderFactory	dbFactory = DocumentBuilderFactory.newInstance();
        	DocumentBuilder dBuilder=dbFactory.newDocumentBuilder();
        	
        	FileOutputStream output = new FileOutputStream("./ApiExplorer");
        	output.write(sb.toString().getBytes("UTF-8"));  // 전체 데이터 읽어 오기 
        	output.close();
        	
        	Document doc = dBuilder.parse("./ApiExplorer");
        	doc.getDocumentElement().normalize();
        	
        	Element body =(Element) doc.getElementsByTagName("body").item(0);
        	Element items =(Element) body.getElementsByTagName("items").item(0);
        	int size = items.getElementsByTagName("item").getLength();
        
        
        	for(int i=0 ; i<size; i++ ) {
        	Element item =(Element) items.getElementsByTagName("item").item(i);
        	
        	data1 = item.getElementsByTagName("MAIN_TITLE").item(0);  // 필요한 데이터 값 추출하기 
        	data2 = item.getElementsByTagName("LNG").item(0);
        	data3 = item.getElementsByTagName("CNTCT_TEL").item(0);
        	data4 = item.getElementsByTagName("ITEMCNTNTS").item(0);  
        	data6 = item.getElementsByTagName("USAGE_DAY_WEEK_AND_TIME").item(0);
        	data7 = item.getElementsByTagName("GUGUN_NM").item(0);  
        	data8 = item.getElementsByTagName("ADDR1").item(0);
        	data9 = item.getElementsByTagName("RPRSNTV_MENU").item(0);
        	data10 = item.getElementsByTagName("MAIN_IMG_THUMB").item(0); 
        	data11 = item.getElementsByTagName("LAT").item(0);
         	
        	String main_title = data1.getChildNodes().item(0).getNodeValue();
        	String lng = data2.getChildNodes().item(0).getNodeValue();
        	String tel = data3.getChildNodes().item(0).getNodeValue();
        	String introduce = data4.getChildNodes().item(0).getNodeValue();
        	String business_hours = data6.getChildNodes().item(0).getNodeValue();
        	String ward = data7.getChildNodes().item(0).getNodeValue();
        	String addr = data8.getChildNodes().item(0).getNodeValue();
        	String menu="";
        	try {
        	menu = data9.getChildNodes().item(0).getNodeValue();
        	}catch(NullPointerException e) {
        		menu="";
        	}
        	String imgaddr = data10.getChildNodes().item(0).getNodeValue();
        	String lat = data11.getChildNodes().item(0).getNodeValue();
        	
        	vo.setSEQ(i+1);
        	vo.setMain_title(main_title);
        	vo.setLng(Double.parseDouble(lng));
        	vo.setTel(tel);
        	vo.setIntroduce(introduce);
        	vo.setBusiness_hours(business_hours);
        	vo.setWard(ward);
        	vo.setAddr(addr);
        	vo.setMenu(menu);
        	vo.setImgaddr(imgaddr);
        	vo.setLat(Double.parseDouble(lat));
        	service.getMatjib(vo);
        	
        	
        	System.out.println(i+" main_title:"+main_title + " lng:" + lng + " tel:" + tel );
        	System.out.println(" introduce:" + introduce);
        	System.out.println(" business_hours:" + business_hours +" ward:"+ward);
        	System.out.println( " addr:" + addr + " menu:" +menu + " imgaddr:" + imgaddr );
        	System.out.println(  " lat:" + lat );
        	
        	
        	}        	
        } catch (Exception e) {
        	e.printStackTrace();
        }
		return "index.do";        
    }
	
	@RequestMapping("travelData.do")
	public  String   Test( TravelVo vo) throws Exception {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/AttractionService/getAttractionKr"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=jrLHt4JyJ5Ekiiok06JukET40YfK9YrFUNt%2FwVvLdBIt7sZaGbyU%2F9rjGuk0WYaW%2FD5160RFRzdvD7JqpalbKg%3D%3D"); /*Service Key (일반인증키)*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("125", "UTF-8")); /*한 페이지 결과 수 (최소 10, 최대 9999)*/
        urlBuilder.append("&" + URLEncoder.encode("returnType","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*상태갱신 조회 범위(분) (기본값 5, 최소 1, 최대 10)*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        try {
        	DocumentBuilderFactory	dbFactory = DocumentBuilderFactory.newInstance();
        	DocumentBuilder dBuilder=dbFactory.newDocumentBuilder();
        	
        	FileOutputStream output = new FileOutputStream("./ApiExplorer");
        	output.write(sb.toString().getBytes("UTF-8"));  // 전체 데이터 읽어 오기 
        	output.close();
        	
        	Document doc = dBuilder.parse("./ApiExplorer");
        	doc.getDocumentElement().normalize();
        	
        	Element body =(Element) doc.getElementsByTagName("body").item(0);
        	Element items =(Element) body.getElementsByTagName("items").item(0);
        	int size = items.getElementsByTagName("item").getLength();
        
        
        	for(int i=0 ; i<size; i++ ) {
        	Element item =(Element) items.getElementsByTagName("item").item(i);
        	
        	
        	
        	Node []data = {
        	item.getElementsByTagName("MAIN_TITLE").item(0), 	
        	item.getElementsByTagName("TITLE").item(0),			
        	item.getElementsByTagName("LNG").item(0), 		
        	item.getElementsByTagName("LAT").item(0),		
        	item.getElementsByTagName("MIDDLE_SIZE_RM1").item(0),		 
        	item.getElementsByTagName("USAGE_AMOUNT").item(0),		
        	item.getElementsByTagName("CNTCT_TEL").item(0)	, 		
        	item.getElementsByTagName("TRFC_INFO").item(0),		
        	item.getElementsByTagName("HLDY_INFO").item(0), 		
        	item.getElementsByTagName("SUBTITLE").item(0),		
        	item.getElementsByTagName("ITEMCNTNTS").item(0)	,		
        	item.getElementsByTagName("USAGE_DAY/").item(0),		
        	item.getElementsByTagName("USAGE_DAY_WEEK_AND_TIME").item(0),		
        	item.getElementsByTagName("GUGUN_NM").item(0),		
        	item.getElementsByTagName("ADDR1").item(0),		
        	item.getElementsByTagName("HOMEPAGE_URL").item(0),		
        	item.getElementsByTagName("MAIN_IMG_THUMB").item(0)		
        	};
        	
        	
        	
        	int a = 0;
    		String[] strData= new String[17];
    		
    		for(a=0; a<data.length;a++) {
        	try {
        			strData[a] = (String)data[a].getChildNodes().item(0).getNodeValue();
            		
        	}catch(NullPointerException e) {
        		strData[a]="";
        	}
    		}
    		vo.setSEQ(i+1);
        	vo.setPlace(strData[0]);
        	vo.setTitle(strData[1]);
        	vo.setLng(Double.parseDouble(strData[2]));
        	vo.setLat(Double.parseDouble(strData[3]));
        	vo.setDisabled(strData[4]);
        	vo.setPrice(strData[5]);
        	vo.setTel(strData[6]);
        	vo.setPublic_transport(strData[7]);
        	vo.setDayoff(strData[8]);
        	vo.setSubtitle(strData[9]);
        	vo.setIntroduce(strData[10]);
        	vo.setBusiness_hours(strData[12]);
        	vo.setWard(strData[13]);
        	vo.setAddr(strData[14]);
        	vo.setHomepage(strData[15]);
        	vo.setImgaddr(strData[16]);
        	service.getTravel(vo);
        	
        	}        	
        } catch (Exception e) {
        	e.printStackTrace();
        }
		return "index.do";        
    }


}
