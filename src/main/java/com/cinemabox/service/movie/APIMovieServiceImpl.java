package com.cinemabox.service.movie;

import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinemabox.dao.movie.MovieDao;
import com.cinemabox.vo.Movie;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

@Service
public class APIMovieServiceImpl implements APIMovieService{
	
	@Autowired MovieDao movieDao;

	String movieListURL = "http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=f5eef3421c602c6cb7ea224104795888";
	String movieDetailURL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd=";
	
	public void saveMoive() throws Exception{
		
		//영화목록정보만 조회
		JsonArray array = getMovieList();
		
		for(int i=0; i<array.size(); i++) {
			//영화목록에서 순서대로 영화정보 조회
			JsonObject movieSimple = (JsonObject) array.get(i);
			
			//영화번호
			int no = movieSimple.get("movieCd").getAsInt();
			//획득한 영화코드로 데이터베이스에서 영화정보 조회
			Movie savedMovie = movieDao.getMovieByNo(no);
			if (savedMovie == null) {
				JsonObject movieInfo = getMovieDetail(no);
				if(movieInfo.getAsJsonArray("directors").size() == 0) {
					continue;
				}
				if(movieInfo.get("showTm").getAsString().isEmpty()) {
					continue;
				}
				
				if(movieInfo.get("openDt").getAsString().isEmpty()) {
					continue;
				}
				
				if(movieInfo.getAsJsonArray("genres").size() == 0 ) {
					continue;
				}
				
				//장르
				String genre = movieSimple.get("genreAlt").getAsString();
			 	if (genre.contains("에로") || genre.contains("성인")) {
			 		continue;
			 	}
			 	
			 	//제목
				String title = movieSimple.get("movieNm").getAsString();
				if(title.contains("섹스") || title.contains("에로")) {
					continue;
				}
				
				//러닝타임
				int runningTime = movieInfo.get("showTm").getAsInt();
				//개봉일
				String rd = movieInfo.get("openDt").getAsString();
				SimpleDateFormat fm = new SimpleDateFormat("yyyyMMdd");
				Date releaseDate = fm.parse(rd); 
				//연령
				JsonArray audits = movieInfo.getAsJsonArray("audits");
				if(audits.size() == 0) {
					continue;
				}
				JsonElement watchGradeNm = audits.get(0);
				String age = watchGradeNm.getAsJsonObject().get("watchGradeNm").getAsString();
				//감독
				JsonArray directors = movieInfo.getAsJsonArray("directors");
				if(directors.size() == 0) {
					continue;
				}
				JsonElement peopleNm = directors.get(0);
				String director = peopleNm.getAsJsonObject().get("peopleNm").getAsString();
				//배우
				JsonArray actors = movieInfo.getAsJsonArray("actors");
				if(actors.size() == 0) {
					continue;
				}
				String casting = "";
				for(int x=0; x<actors.size(); x++) {
					JsonElement peopleName = actors.get(x);
					casting += peopleName.getAsJsonObject().get("peopleNm").getAsString() + ",";
				}
				int castingLength = casting.length();
				String cast = casting.substring(0,castingLength-1);
				
		 		Movie movie = new Movie();
		 		movie.setNo(no);
		 		movie.setTitle(title);
		 		movie.setThumbnail(Integer.toString(no));
		 		movie.setReleaseDate(releaseDate);
		 		movie.setGenre(genre);
		 		movie.setRunningTime(runningTime);
		 		if(age.equals("전체관람가")) {
		 			movie.setAge("ALL");
		 		}else if(age.equals("12세이상관람가")) {
		 			movie.setAge("12");
		 		}else if(age.equals("15세이상관람가")) {
		 			movie.setAge("15");
		 		}else if(age.equals("청소년관람불가")) {
		 			movie.setAge("19");
		 		}
		 		movie.setDirector(director);
		 		movie.setCasting(cast);
		 		movieDao.insertMovie(movie);
		 		System.out.println("등록완료");
			}
		}
	}
	
	private JsonArray getMovieList() throws Exception{
		//영화목록 주소로 URL 객체 생성
		URL url = new URL(movieListURL);
		//영화목록 정보를 읽어오는 스트림 생성
		Reader reader = new InputStreamReader(url.openStream(), "utf-8");
		
		Gson gson = new Gson();
		//영화정보 읽어와서 JsonObject객체에 저장
		JsonObject obj = gson.fromJson(reader, JsonObject.class);
		reader.close();
		
		//영화목록정보만 조회
		JsonArray array = obj.getAsJsonObject("movieListResult").getAsJsonArray("movieList");
		return array;
	}
	
	private JsonObject getMovieDetail(int movieCd) throws Exception{
		//영화목록 주소로 URL 객체 생성
		URL url = new URL(movieDetailURL + movieCd);
		//영화목록 정보를 읽어오는 스트림 생성
		Reader reader = new InputStreamReader(url.openStream(), "utf-8");
		
		Gson gson = new Gson();
		//영화정보를 읽어와서 JsonObject객체에 저장
		JsonObject obj = gson.fromJson(reader, JsonObject.class);
		reader.close();
	
		//영화목록정보만 조회
		JsonObject movieInfo = obj.getAsJsonObject("movieInfoResult").getAsJsonObject("movieInfo");
		
		return movieInfo;
	}
	
	public void crawler() {
		//url
		String URL = "https://www.kobis.or.kr/kobis/business/stat/boxs/findRealTicketList.do?CSRFToken=HAbm1pDQk2blqieP87xWcsvEnqMKWqYQClGl9q9NBbk&loadEnd=0&repNationCd=&areaCd=0105001%3A0105002%3A0105003%3A0105004%3A0105005%3A0105006%3A0105007%3A0105008%3A0105009%3A0105010%3A0105011%3A0105012%3A0105013%3A0105014%3A0105015%3A0105016%3A&repNationSelected=&totIssuAmtRatioOrder=&totIssuAmtOrder=&addTotIssuAmtOrder=&totIssuCntOrder=&totIssuCntRatioOrder=&addTotIssuCntOrder=&dmlMode=search&repNationChk=&repNationKor=on&repNationKor=on&wideareaAll=ALL&wideareaCd=0105001&wideareaCd=0105011&wideareaCd=0105012&wideareaCd=0105015&wideareaCd=0105016&wideareaCd=0105013&wideareaCd=0105014&wideareaCd=0105002&wideareaCd=0105003&wideareaCd=0105005&wideareaCd=0105004&wideareaCd=0105007&wideareaCd=0105006&wideareaCd=0105009&wideareaCd=0105008&wideareaCd=0105010&allMovieYn=Y&sMultiChk=YNN&sNomal=Y";
		//전체영화목록
		List<Movie> movies = movieDao.getAllmovies();
		
		try {
			//connect
			Connection conn = Jsoup.connect(URL);
			
			//html 파싱
			Document html = conn.post();
			
			//html 출력
			List<String> title = html.select(".tal a").eachText();
			List<String> rate = html.select(".even td:eq(3)").eachText();
			List<String> cnt = html.select(".even td:last-child").eachText();
			
			//사이트에 있는 영화와 db에 등록된 영화 비교 후 예매율, 누적관객 수 가져와서 db 갱신하기
			for(int i=0; i<title.size(); i++) {
				for(Movie item : movies) {
					if(title.get(i).equals(item.getTitle())) {
						double r = Double.parseDouble(rate.get(i).replace("%", ""));
						int c = Integer.parseInt(cnt.get(i).replace(",", ""));
						
						Movie movie = movieDao.getMovieByNo(item.getNo());
						movie.setReservationRate(r);
						movie.setCumulativeAudienceCnt(c);
						movieDao.updateMovieRateCnt(movie);
						System.out.println("----------관객,예매율 갱신완료----------");
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
