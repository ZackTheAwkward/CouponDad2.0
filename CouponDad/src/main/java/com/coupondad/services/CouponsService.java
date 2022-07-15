package com.coupondad.services;

import java.util.List;

import com.coupondad.entities.Coupons;

public interface CouponsService {

	public List<Coupons> index();

	public Coupons addCoupon(Coupons coupons, String username);
	
	public Coupons updateCoupons(Coupons coupons, int id, String username);
	
	public Coupons disableCoupons(Coupons coupons, int id, String username);
	
	public List<Coupons> listCouponsByKeyword(String keyword);
	
}
