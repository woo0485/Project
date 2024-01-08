package com.finalproject.festival.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.BasketDao;
import com.finalproject.festival.domain.Basket;

@Service
public class BasketServiceImpl implements BasketService {
	
	@Autowired
	private BasketDao BD;
	
	public void setBasketDao (BasketDao bd) {
		this.BD = bd;
	}

	@Override
	public 	List<Map<String,Object>> basketList(String id, int productno) {
		return BD.basketList(id, productno);
	}
	
	/*
	// 장바구니 확인 - 1월 3일
	@Override
	public Basket checkBasket(Basket b) {
		return BD.checkBasket(b);
	} */

	/////////////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public void insertBasket(Basket b) {
		
		boolean isExist = BD.isDupBasketCheck(b.getProductno(), b.getId());
		System.out.println("basketdao에서 service로 넘어가는 productno 전부 카운트한 갯수의 boolean "+isExist );
		  // DAO에서=> productno가 존재하면 >0 이고 true 없으면 false

        if (isExist) {
        	// 장바구니에 productno가 이미 존재하면 수량만 업데이트
        	//BD.updateBasketProductCount(id, productno, incrementcount);
        	Basket basket = new Basket();
            basket.setId(b.getId());
            basket.setProductno(b.getProductno());
            basket.setBasketproductcount(b.getBasketproductcount());
            System.out.println("service에서 updateproductcount가 실행될 때: " + basket.getBasketproductcount() );
 
        	BD.updateBasketProductCount(basket);
        	//BD.updateBasketProductCount(b.getId(), b.getProductno(), b.getBasketproductcount());
        	System.out.println(basket.getBasketproductcount());
       
        } else {
        	 // 장바구니에 productno가 존재하지 않으면 insert
            Basket basket = new Basket();
            basket.setId(b.getId());
            basket.setProductno(b.getProductno());
            basket.setBasketproductcount(b.getBasketproductcount());
            
            System.out.println("basketService에서 insertBasket - id:  " +basket.getId() );
            System.out.println("basketService에서 insertBasket - productno:  " +basket.getProductno() );
            System.out.println("basketService에서 insertBasket - basketproductcount:  " + basket.getBasketproductcount() );
            System.out.println("service에서 insert(중복된 productno가 없을때)가 실행될 때: " + basket.getBasketproductcount() );
            BD.insertBasket(basket);
        	System.out.println(basket.getBasketproductcount());
        } 
        
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// 장바구니 제품 삭제 - 1월 5일 수정함
	@Override
	public void deletdBasket(int basketno, String id) {
		BD.deleteBasket(basketno, id);
	}
}