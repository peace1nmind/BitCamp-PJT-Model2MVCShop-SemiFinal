package com.model2.mvc.service.purchase.impl;
// W D 

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserDao;

@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService {

	// Field
	@Autowired
	@Qualifier("purchaseDao")
	private PurchaseDao purchaseDao;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}

	// Constructor
	public PurchaseServiceImpl() {
	}
	
	private RowBounds getRowBounds(Search search) {
		return new RowBounds((search.getCurrentPage()-1) * search.getPageSize(), search.getPageSize());
	}

	@Override
	public Purchase addPurchase(Purchase purchase) {
		
		try {
			purchaseDao.insertPurchase(purchase);
			purchase = purchaseDao.selectPurchaseByProdNo(purchase.getPurchaseProd().getProdNo());
			productService.updateTranCode(purchase.getPurchaseProd().getProdNo(), "2");
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return purchase;
	}

	@Override
	public Purchase getPurchase(int tranNo) {
		
		Purchase purchase = new Purchase();
		
		try {
			purchase = purchaseDao.selectPurchase(tranNo);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return purchase;
	}
	
	@Override
	public Purchase getPurchaseByProdNo(int prodNo) {
		
		Purchase purchase = new Purchase();
		
		try {
			purchase = purchaseDao.selectPurchaseByProdNo(prodNo);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return purchase;
	}

	@Override
	public Map<String, Object> getPurchaseList(Search search, String buyerId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map.put("list", purchaseDao.selectPurchaseList(search, buyerId, getRowBounds(search)));
			map.put("count", purchaseDao.countPurchaseList(search, buyerId));
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return map;
	}

	@Override
	public Map<String, Object> getPurchaseHistoryList(Search search, String buyerId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map.put("list", purchaseDao.selectPurchaseHistoryList(search, buyerId, getRowBounds(search)));
			map.put("count", purchaseDao.countPurchaseHistoryList(search, buyerId));
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return map;
	}

	@Override
	public Map<String, Object> getSaleList(Search search) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map.put("list", purchaseDao.selectSaleList(search, getRowBounds(search)));
			map.put("count", purchaseDao.countSaleList(search));
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return map;
	}

	@Override
	public Purchase updatePurchase(Purchase purchase) {
		
		try {
			purchaseDao.updatePurchase(purchase);
			purchase = purchaseDao.selectPurchase(purchase.getTranNo());
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return purchase;
	}

	@Override
	public void updateTranCode(Purchase purchase, String tranCode) {
		
		purchase.setTranCode(tranCode);
		
		try {
			purchaseDao.updateTranStatusCode(purchase);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}

	@Override
	public void updateTranCode(int tranNo, String tranCode) {
		
		try {
			Purchase purchase = purchaseDao.selectPurchase(tranNo);
			purchase.setTranCode(tranCode);
			purchaseDao.updateTranStatusCode(purchase);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}

}
// class end