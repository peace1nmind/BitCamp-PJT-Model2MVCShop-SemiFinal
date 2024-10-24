package com.model2.mvc.service.purchase;
// W D 

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

@Mapper
public interface PurchaseDao {

	// 구매정보 조회
	public Purchase selectPurchase(int tranNo);
	
	// prodNo로 구매정보 조회
	public Purchase selectPurchaseByProdNo(int prodNo);
	
	// 구매
	public int insertPurchase(Purchase purchase);
	
	// 유저 구매이력 조회 (구매완료~배송중)
	public List<Purchase> selectPurchaseList(Search search, String buyerId, RowBounds rowBounds);
	
	// 구매이력 (구매완료~배송중) count
	public int countPurchaseList(Search search, String buyerId);
	
	// 유저 구매이력 조회 (배송완료~)
	public List<Purchase> selectPurchaseHistoryList(Search search, String buyerId, RowBounds rowBounds);
	
	// 구매이력 (배송완료~) count
	public int countPurchaseHistoryList(Search search, String buyerId);
	
	// 판매완료 상품리스트 조회 (관리자)
	// RowBounds 사용하기
	public List<Purchase> selectSaleList(Search search, RowBounds rowBounds);
	
	// 판매완료 상품리스트 count
	public int countSaleList(Search search);
	
	// 구매정보 수정
	public void updatePurchase(Purchase purchase);
	
	// tranCode 수정
	public void updateTranStatusCode(Purchase purchase);
	
}
// class end