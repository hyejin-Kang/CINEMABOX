package com.cinemabox.web.controller;

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

import com.cinemabox.dto.shop.ShopPurchaseDto;
import com.cinemabox.service.shop.ShopService;
import com.cinemabox.vo.Gift;
import com.cinemabox.vo.Snack;

@Controller
public class ShopController {

	@Autowired ShopService shopService;
	
	@GetMapping("/gift")
	public String giftShop(Model model) {
		// 전체 gift정보 조회하기
		List<Gift> giftList = shopService.getAllGiftInfo();
		
		// 뷰 페이지에 gift 목록 전달하기
		model.addAttribute("gifts", giftList);
		return "shop/giftShop";	
	}
	
	@GetMapping("/giftInsert")
	public String giftInsert() {
		return "shop/giftInsert";	
	}
	
	@GetMapping("/snackInsert")
	public String snackInsert() {
		return "shop/snackInsert";	
	}
	
	@GetMapping("/snack")
	public String snackShop(Model model) {
		// 전체 snack정보 조회하기
		List<Snack> snackList = shopService.getAllSnackInfo();
		
		// 뷰 페이지에 snack 목록 전달하기
		model.addAttribute("snacks", snackList);
		return "shop/snackShop";	
	}
	
	@GetMapping(path = {"giftDetail"})
	public String giftDetail(Model model, @RequestParam("giftNo") int giftNo) {
		Gift giftInfo = shopService.getGiftByNo(giftNo);
		model.addAttribute("giftInfo", giftInfo);
		return "shop/giftDetail";	
	}
	
	@GetMapping(path = {"snackDetail"})
	public String itemDetail(Model model, @RequestParam("snackNo") int snackNo) {
		Snack snackInfo = shopService.getSnackByNo(snackNo);
		model.addAttribute("snackInfo", snackInfo);
		return "shop/snackDetail";	
	}
	
	@RequestMapping("/purchase")
	public @ResponseBody ResponseEntity<ShopPurchaseDto> purchase(ShopPurchaseDto shopPurchase) {
		
		shopService.shopPurchase(shopPurchase);
		return new ResponseEntity<ShopPurchaseDto>(HttpStatus.OK);
	}
	
	@PostMapping("/insertGift")
	public String insert(Gift gift, @RequestParam("file") MultipartFile multipartFile) throws IOException {
		
		shopService.insertGift(gift);
		Gift savedGift = shopService.getGiftByNo(gift.getGiftNo());
		
		if (!multipartFile.isEmpty()) {
			String originalname = multipartFile.getOriginalFilename();
			String folderName = "C:\\eclipse\\eGovFrameDev-3.10.0-64bit\\workspace\\cinemabox\\src\\main\\webapp\\resources\\images\\gift";
			// 전달받은 정보에서 no를 가져옴
			String StringGiftNo = String.valueOf(gift.getGiftNo());
			// 지정된 폴더에 지정된 이름을 파일을 기록
			OutputStream out = new FileOutputStream(new File(folderName, StringGiftNo + ".jpg"));
			// multipartFile객체에서 파일을 읽어옴
			InputStream in = multipartFile.getInputStream();
			// 파일이름을 영화no로 변경
			String changeFileName = originalname.replaceAll(originalname, StringGiftNo);
			// 파일이 정해진 폴더에 기록됨
			FileCopyUtils.copy(in, out);
			savedGift.setThumbnail(changeFileName);
		}
		shopService.updateGift(savedGift);
		return "redirect:gift";
	}		
		
		@PostMapping("/insertSnack")
		public String insert(Snack snack, @RequestParam("file") MultipartFile multipartFile) throws IOException {
			
			shopService.insertSnack(snack);
			Snack savedSnack = shopService.getSnackByNo(snack.getSnackNo());
			
			if (!multipartFile.isEmpty()) {
				String originalname = multipartFile.getOriginalFilename();
				String folderName = "C:\\eclipse\\eGovFrameDev-3.10.0-64bit\\workspace\\cinemabox\\src\\main\\webapp\\resources\\images\\snack";
				// 전달받은 정보에서 no를 가져옴
				String StringSnackNo = String.valueOf(snack.getSnackNo());
				// 지정된 폴더에 지정된 이름을 파일을 기록
				OutputStream out = new FileOutputStream(new File(folderName, StringSnackNo + ".jpg"));
				// multipartFile객체에서 파일을 읽어옴
				InputStream in = multipartFile.getInputStream();
				// 파일이름을 영화no로 변경
				String changeFileName = originalname.replaceAll(originalname, StringSnackNo);
				// 파일이 정해진 폴더에 기록됨
				FileCopyUtils.copy(in, out);
				savedSnack.setThumbnail(changeFileName);
			}
			shopService.updateSnack(savedSnack);
			return "redirect:snack";
	}
}
