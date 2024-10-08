package com.model2.mvc.service;
// W D 

import java.util.HashMap;
import java.util.Map;

public class TranCodeMapper {

	// Field
	private static TranCodeMapper tranCodeMapper;
	private Map<String, String> map;
	
	
	// Constructor
	private TranCodeMapper() {
		System.out.println("\t:: "+getClass().getSimpleName()+" default constructor call");
	}

	
	// Method
	public static TranCodeMapper getInstance() {
		
		if (tranCodeMapper == null) {
			tranCodeMapper = new TranCodeMapper();
		}
		
		return tranCodeMapper;
	}

	public Map<String, String> getMap() {
		
		map = new HashMap<String, String>();
		map.put("1", "판매중");
		map.put("2", "구매완료");
		map.put("3", "배송중");
		map.put("4", "배송완료");
		map.put("5", "최종 판매완료");
		
		return map;
	}
	
}
// class end
