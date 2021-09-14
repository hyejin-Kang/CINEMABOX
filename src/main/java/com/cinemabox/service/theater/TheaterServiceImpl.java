package com.cinemabox.service.theater;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinemabox.dao.theater.TheaterDao;
import com.cinemabox.dto.theater.TheaterDto;
import com.cinemabox.vo.Theater;

@Service
public class TheaterServiceImpl implements TheaterService{
	
	int theaterNumber = 0;

	@Autowired
	TheaterDao theaterDao;
	
	// 전체 각 지역들의 극장 정보
	@Override
	public List<Theater> allLocations() {
		return theaterDao.allLocations();
	}
	
	@Override
	public List<Theater> getAllLocation(String location) {
		return theaterDao.getAllLocation(location);
	}
	
	@Override
	public List<Theater> specialHallLoca(String specialHall) {
		List<Theater> allLoactions = theaterDao.allLocations();
		List<Theater> specialHallInfo = new ArrayList<>();
		
		for (Theater theater : allLoactions) {
			String[] str = theater.getTheaterFacility().split(" ");
			for (String strFacility : str) {
				if(specialHall.equals(strFacility)) {
					specialHallInfo.add(theater);
				}
			}
		}
		return specialHallInfo;
	}
	
	@Override
	public Theater getLocationByNo(int no, String number) {
//		theaterNumber = Integer.parseInt(number);
		return theaterDao.getLocationByNo(no);
	}
	
	// 각 극장별 기본정보 크롤링
	@Override
	public TheaterDto detailTheaterInfoByJsoup(String number) {
//		theaterNumber = Integer.parseInt(number);
//		System.out.println("인티저 넘버 확인 : " + theaterNumber);
		
		// TheaterVO/dto 에 값 저장 
		TheaterDto theaterDto = new TheaterDto();
		Theater theater = new Theater();
		try {
			Document doc = Jsoup.connect("https://www.megabox.co.kr/on/oh/ohc/Brch/infoPage.do?brchNo=" + number).get();
//			System.out.println(doc);
			// 크롤링 값 변수 저장 시작
			Elements theaterAddress;
			theaterAddress = doc.select("ul:nth-of-type(2) li");
			String theaterAddressJ = theaterAddress.text();
			System.out.println("=================== 주소 : "+ theaterAddressJ);
			
			Elements theaterFacility;
			theaterFacility = doc.select(".theater-facility");
			String[] theaterFacilities = theaterFacility.text().split(" ");
			String theaterFacilityJsoup = "";
			for (String str : theaterFacilities) {
				theaterFacilityJsoup += (str+" ");
			}
			System.out.println("=================== 시설물 스플릿 : "+ theaterFacilityJsoup);
			
			Elements theaterLatLng;
			String lng ="";
			String lat ="";
			theaterLatLng = doc.select(".left [href^=\"http\"]");
			String theaterLatLngJsoup = theaterLatLng.attr("href");
			int lngX = theaterLatLngJsoup.indexOf("=") +1;
			int lngY = theaterLatLngJsoup.indexOf("&");
			if("4001".equals(number)) {
				lng = "126.4987797";
			} else if("0021".equals(number)) {
				lng = "127.0605142";
			} else {
				lng = theaterLatLngJsoup.substring(lngX, lngY);
			}
			System.out.println("경도 추출 : " + lng);
			int latX = theaterLatLngJsoup.lastIndexOf("t")+2;
			int latY = theaterLatLngJsoup.lastIndexOf("&");
			if("4001".equals(number)) {
				lat = "37.4922651";
			} else if("0021".equals(number)) {
				lat = "35.8390606";
			} else {
				lat = theaterLatLngJsoup.substring(latX , latY);
			}
			System.out.println("위도 추출 : " + lat);
			
			Elements content;
			content = doc.select(".big");
			String contentJsoup = content.text();
			System.out.println("극장설명 : "+contentJsoup);
			
			Elements contentMerit;
			contentMerit = doc.select(".theater-info-text p:last-child");
			String contentMeritJsoup = contentMerit.text();
			System.out.println("극장 메리트 : " + contentMeritJsoup);
			
			Elements floor1;
			floor1 = doc.select("h3 ~ ul:nth-of-type(1) li:nth-child(1)");
			String floorJsoup1 = floor1.text();
			System.out.println("=== 층 안내 : " + floorJsoup1);
			
			Elements floor2;
			floor2 = doc.select("h3 ~ ul:nth-of-type(1) li:nth-child(2)");
			String floorJsoup2 = floor2.text();
			System.out.println("=== 층 안내 : " + floorJsoup2);
			
			Elements floor3;
			floor3 = doc.select("h3 ~ ul:nth-of-type(1) li:nth-child(3)");
			String floorJsoup3 = floor3.text();
			System.out.println("=== 층 안내 : " + floorJsoup3);
			
			Elements floor4;
			floor4 = doc.select("h3 ~ ul:nth-of-type(1) li:nth-child(4)");
			String floorJsoup4 = floor4.text();
			System.out.println("=== 층 안내 : " + floorJsoup4);
			
			Elements floor5;
			floor5 = doc.select("h3 ~ ul:nth-of-type(1) li:nth-child(5)");
			String floorJsoup5 = floor5.text();
			System.out.println("=== 층 안내 : " + floorJsoup5);
			
			Elements floor6;
			floor6 = doc.select("h3 ~ ul:nth-of-type(1) li:nth-child(6)");
			String floorJsoup6 = floor6.text();
			System.out.println("=== 층 안내 : " + floorJsoup6);
			
			Elements floor7;
			floor7 = doc.select("h3 ~ ul:nth-of-type(1) li:nth-child(7)");
			String floorJsoup7 = floor7.text();
			System.out.println("=== 층 안내 : " + floorJsoup7);
			
			Elements parkingInfo;
			parkingInfo = doc.select(".parking-section:nth-child(1) li");
			String parkingInfoJsoup = parkingInfo.text();
			System.out.println("주차장 정보 : " + parkingInfoJsoup);
			
			Elements parkingConfirm;
			parkingConfirm = doc.select(".parking-section:nth-child(2) li");
			String parkingConfirmJsoup = parkingConfirm.text();
			System.out.println("주차확인증 : " + parkingConfirmJsoup);
			
			Elements parkingPrice;
			parkingPrice = doc.select(".parking-section:nth-child(3) li");
			String parkingPriceJsoup = parkingPrice.text();
			System.out.println("주차요금 : " + parkingPriceJsoup);
			
			Elements publicTransportName;
			publicTransportName = doc.select(".transportation-section .tit");
			String publicTransportNameJsoup = publicTransportName.text();
			System.out.println("대중교통 이름 : " + publicTransportNameJsoup);
			
			Elements publicTransportInfo;
			publicTransportInfo = doc.select(".transportation-section li:first-child");
			String publicTransportInfoJsoup = publicTransportInfo.text();
			System.out.println("대중교통 정보 : " + publicTransportInfoJsoup);
			// 크롤링 값 변수 저장 끝
			
			theater.setTheaterAddress(theaterAddressJ);
			theaterDto.setTheaterAddress(theaterAddressJ);
			
			theater.setTheaterFacility(theaterFacilityJsoup);
			theaterDto.setTheaterFacility(theaterFacilityJsoup);
			
			boolean specialHallflag = false;
			for (String str : theaterFacilityJsoup.split(" ")) {
				if ("돌비".equals(str) || "부티크".equals(str) || "컴포트".equals(str) || "스폐셜석".equals(str) || "스위트룸".equals(str) || "MX".equals(str)) {
					System.out.println("==== 특별관 유무  Y");
					specialHallflag = true;
				}
			}
			if (specialHallflag) {
				theater.setTheaterHallExist("Y");
			} else {
				theater.setTheaterHallExist("N");
			}
			
			theater.setTheaterLongitude(lng);
			theaterDto.setTheaterLongitude(lng);
			theater.setTheaterLatitude(lat);
			theaterDto.setTheaterLatitude(lat);
			
			theater.setContentFirst(contentJsoup);
			theaterDto.setContent(contentJsoup);
			
			theater.setContentMerit(contentMeritJsoup);
			theaterDto.setContentMerit(contentMeritJsoup);
			
			theater.setTheaterNumber(number);
			theaterDto.setTheaterNumber(number);
			
			theaterDto.setFloor1(floorJsoup1);
			theaterDto.setFloor2(floorJsoup2);
			theaterDto.setFloor3(floorJsoup3);
			theaterDto.setFloor4(floorJsoup4);
			theaterDto.setFloor5(floorJsoup5);
			theaterDto.setFloor6(floorJsoup6);
			theaterDto.setFloor7(floorJsoup7);
			theaterDto.setParkingInfo(parkingInfoJsoup);
			theaterDto.setParkingConfirm(parkingConfirmJsoup);
			theaterDto.setParkingPrice(parkingPriceJsoup);
			
			theaterDao.updateTheaterDetail(theater);
			
		} catch (Exception e) {
			System.out.println("Crwaling Error!");
		}
		return theaterDto;
	}
	
}
