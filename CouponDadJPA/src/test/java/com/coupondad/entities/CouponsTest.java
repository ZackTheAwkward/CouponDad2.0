package com.coupondad.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class CouponsTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Coupons coupons;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("CouponDadJPA");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		coupons = em.find(Coupons.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		coupons = null;
	}

	@Test
	@DisplayName("Testing entity coupons to database")
	void test() {
		assertNotNull(coupons);
		assertEquals("Test", coupons.getTitle());
		assertEquals("Test", coupons.getDescription());
		assertEquals(06, coupons.getCreateDate().getMonthValue());
		assertEquals(13, coupons.getCreateDate().getDayOfMonth());
	}
}
