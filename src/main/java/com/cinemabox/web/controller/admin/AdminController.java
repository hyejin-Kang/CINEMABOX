package com.cinemabox.web.controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cinemabox.service.admin.AdminService;
import com.cinemabox.vo.Hall;
import com.cinemabox.vo.Movie;
import com.cinemabox.vo.Screening;
import com.cinemabox.vo.Theater;
import com.cinemabox.web.utils.Paging;

@Controller
public class AdminController {

	@Autowired AdminService adminService;

	@GetMapping(path = {"/admin"})
	public String main() {
		return "admin/main";	
	}
	
	@GetMapping(path = {"/movieInsert"})
	public String movieInsert() {
		return "admin/movieInsert";
	}
	
	@GetMapping("/deleteList")
	public String deleteMovieList(Model model) {
		// 상영중인 전체 영화정보 조회하기
		List<Movie> deltelist = adminService.getAllDeleteMovies();
		
		// 뷰 페이지에 영화정보 목록 전달하기
		model.addAttribute("delteMovies", deltelist);
		
		// 뷰페이지로 내부이동하기
		return "admin/deleteMovieList";
	}
	
	@GetMapping("/movieModify")
	public String movieModify(Model model, @RequestParam("movieNo") int movieNo) {
		// 상영중인 영화정보 조회하기
		Movie savedmovie = adminService.getMovieByNo(movieNo);
		
		// 뷰 페이지에 영화정보 목록 전달하기
		model.addAttribute("movie", savedmovie);
		
		// 뷰페이지로 내부이동하기
		return "admin/movieModify";
	}
	
	@GetMapping("movieList")
	public String boardList(Paging page, Model model
			, @RequestParam(value="nowPage", required=false) String nowPage
			, @RequestParam(value="cntPerPage", required=false) String cntPerPage) {
		int total = adminService.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		page = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<Movie> list = adminService.selectMoivePaging(page);
		List<Theater> theaterList = adminService.getAllTheaterInfo();
		List<Hall> hallList = adminService.getAllHallInfo();
		model.addAttribute("paging", page);
		model.addAttribute("movies", list);
		model.addAttribute("theaters", theaterList);
		model.addAttribute("halls", hallList);
					
		// 뷰페이지로 내부이동하기
		return "admin/movieList";
	}
	
	@GetMapping("searchMovie")
	public String getAllSearchMovies(Model model, @RequestParam("movieTitle") String movieTitle) {
		List<Movie> list = adminService.getAllSearchMovies(movieTitle);
		List<Theater> theaterList = adminService.getAllTheaterInfo();
		List<Hall> hallList = adminService.getAllHallInfo();
		model.addAttribute("movies", list);
		model.addAttribute("theaters", theaterList);
		model.addAttribute("halls", hallList);
					
		// 뷰페이지로 내부이동하기
		return "admin/searchMovie";
	}
	
	@GetMapping(path = {"/screening"})
	public String screeningList(Model model, @RequestParam("movieNo") int movieNo) {
		List<Screening> savedScreens = adminService.getScreeningsByMovieNo(movieNo);
		List<Theater> theaters = adminService.getAllTheaterInfo();
		List<Hall> halls = adminService.getAllHallInfo();
		model.addAttribute("screens", savedScreens);
		model.addAttribute("theaters", theaters);
		model.addAttribute("halls", halls);
		return "admin/screeningList";
	}
	
	@PostMapping("/insert")
	public String insert(Movie movie, @RequestParam("file") MultipartFile multipartFile) throws IOException {
		
		adminService.addMovie(movie);
		Movie savedMovie = adminService.getMovieByNo(movie.getNo());
		
		if (!multipartFile.isEmpty()) {
			String originalname = multipartFile.getOriginalFilename();
			String folderName = "C:\\eclipse\\eGovFrameDev-3.10.0-64bit\\workspace\\cinemabox\\src\\main\\webapp\\resources\\images\\movie";
			// 전달받은 movie정보에서 no를 가져옴
			String StringMovieNo = String.valueOf(movie.getNo());
			// 지정된 폴더에 지정된 이름을 파일을 기록
			OutputStream out = new FileOutputStream(new File(folderName, StringMovieNo + ".jpg"));
			// multipartFile객체에서 파일을 읽어옴
			InputStream in = multipartFile.getInputStream();
			// 파일이름을 영화no로 변경
			String changeFileName = originalname.replaceAll(originalname, StringMovieNo);
			// 파일이 정해진 폴더에 기록됨
			FileCopyUtils.copy(in, out);
			savedMovie.setThumbnail(changeFileName);
		}
		adminService.updateMovie(savedMovie);
		return "redirect:movieList";
	}
	
	@PostMapping("/update")
	public String update(Movie movie, @RequestParam("file") MultipartFile multipartFile) throws IOException {
		if (!multipartFile.isEmpty()) {
			String originalname = multipartFile.getOriginalFilename();
			String folderName = "C:\\eclipse\\eGovFrameDev-3.10.0-64bit\\workspace\\cinemabox\\src\\main\\webapp\\resources\\images\\movie";
			// 지정된 폴더에 지정된 이름을 파일을 기록
			OutputStream out = new FileOutputStream(new File(folderName, originalname));
			// multipartFile객체에서 파일을 읽어옴
			InputStream in = multipartFile.getInputStream();
			// 전달받은 movie정보에서 no를 가져옴
			String StringMovieNo = String.valueOf(movie.getNo());
			// 파일이름을 영화no로 변경
			String changeFileName = originalname.replaceAll(originalname, StringMovieNo);
			// 파일이 정해진 폴더에 기록됨
			FileCopyUtils.copy(in, out);
			System.out.println("바뀐영화이름" + changeFileName);
			movie.setThumbnail(changeFileName);
		}
		adminService.updateMovie(movie);
		
		return "redirect:movieList";
	}
	
	// ajax 기반 컨트롤러
	
	@RequestMapping("/insertScreen")
	public @ResponseBody ResponseEntity<Screening> insertScreen(Screening screening) {
		adminService.addScreening(screening);
		Screening savedScreening = adminService.getScreeningByNo(screening.getScreeningNo());
		adminService.addSeat(savedScreening);
		return new ResponseEntity<Screening>(savedScreening, HttpStatus.OK);
	}
	
	@RequestMapping("/delete")
	public @ResponseBody ResponseEntity<Void> delete(@RequestParam("movieNo") int movieNo) {
		adminService.deleteMovie(movieNo);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	@RequestMapping("/recovery")
	public @ResponseBody ResponseEntity<Void> recovery(@RequestParam("movieNo") int movieNo) {
		adminService.recoveryMovie(movieNo);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
}	
