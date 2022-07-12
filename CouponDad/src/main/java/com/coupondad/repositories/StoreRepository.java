package com.coupondad.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import com.coupondad.entities.Store;

public interface StoreRepository extends JpaRepository<Store, Integer> {

	List<Store> findByNameLike(@Param("k") String keyword);
	
//	Store findByAddress_User_UsernameAndId(String username, int postId);
}
