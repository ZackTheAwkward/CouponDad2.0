package com.coupondad.services;

import java.util.List;

import com.coupondad.entities.Store;

public interface StoreService {
	
	public List<Store> index (String username);
	
	public List<Store> findByKeyword(String keyword);
	
	public Store findById(int storeId);
	
	public Store addStore(String username, Store store);
	
	public Store updateStore(String username, Store store, int storeId);

}
