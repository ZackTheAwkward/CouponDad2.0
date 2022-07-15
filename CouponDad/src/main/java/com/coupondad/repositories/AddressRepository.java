package com.coupondad.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.coupondad.entities.Address;

public interface AddressRepository extends JpaRepository {
	
	List<Address> findByStreetLikeOrStateOrCityLike(String keyword, String keyword2, String keyword3);

}
