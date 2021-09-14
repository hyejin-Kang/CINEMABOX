package com.cinemabox.service.theater;

import java.util.List;

import com.cinemabox.dto.theater.TheaterDto;
import com.cinemabox.vo.Theater;

public interface TheaterService {

   /**
    * 지역이름을 전달받아 해당지역의 상영관 정보를 반환한다.
    * @param location 지역이름
    * @return 상영관정보들
    */
   List<Theater> getAllLocation(String location);
   
   /**
    * 전체 지역들의 전체 극장 정보를 반환한다.
    * @return 전체 지역들의 전체 극장 정보
    */
   List<Theater> allLocations();
   
   /**
    * 특별관 이름을 전달받아 해당 상영관들을 반환한다.
    * @param specialHall 특별관 이름
    * @return 전달받은 특별관이 존재 하는 상영관 정보
    */
   List<Theater> specialHallLoca(String specialHall);
   
   /**
    * 극장번호를 전달받아 극장정보 반환
    * @return 극장정보
    */
   Theater getLocationByNo(int no, String number);
   
   /**
    * 극장번호를 전달받아서 극장상세정보를 반환한다.
    * @param no 극장번호
    */
   TheaterDto detailTheaterInfoByJsoup(String number);
}
