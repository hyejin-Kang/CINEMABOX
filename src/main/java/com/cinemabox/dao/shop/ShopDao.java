package com.cinemabox.dao.shop;

import java.util.List;

import com.cinemabox.dto.shop.ShopPurchaseDto;
import com.cinemabox.vo.Gift;
import com.cinemabox.vo.Snack;

public interface ShopDao {

	void insertShopPurchase(ShopPurchaseDto shopPurchase);
	void insertGift(Gift gift);
	void insertSnack(Snack snack);
	void updateGift(Gift gift);
	void updateSnack(Snack snack);
	Gift getGiftByNo(int giftNo);
	Snack getSnackByNo(int snackNo);
	List<Snack> getAllSnackInfo();
	List<Gift> getAllGiftInfo();
}
