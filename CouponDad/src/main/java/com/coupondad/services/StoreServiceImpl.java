package com.coupondad.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.coupondad.entities.Store;
import com.coupondad.repositories.StoreRepository;

public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreRepository storeRepo;

	@Override
	public List<Store> index(String username) {
		return storeRepo.findAll();
	}

	@Override
	public List<Store> findByKeyword(String keyword) {
		keyword = "%" + keyword + "%";
		return storeRepo.findByNameLike(keyword);
	}

	@Override
	public Store findById(int storeId) {
		Optional <Store> op = storeRepo.findById(storeId);
		Store result = null;
		if(op.isPresent()) {
			result = op.get();
			return result;
			}
		
		return null ;
	}

	@Override
	public Store addStore(String username, Store store) {
		return storeRepo.saveAndFlush(store);
	}

	@Override
	public Store updateStore(String username, Store store, int storeId) {
		return null;
	}

}
