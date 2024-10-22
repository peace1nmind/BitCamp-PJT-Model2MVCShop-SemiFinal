package com.model2.mvc.service;
// W D 

import java.util.HashMap;
import java.util.Map;

public class TranCodeMapper {

	// Field
	private static TranCodeMapper tranCodeMapper;
	private Map<String, String> map;
	private Map<String, String> colorMap;
	
	
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
		map.put("1", "�Ǹ���");
		map.put("2", "���ſϷ�");
		map.put("3", "�����");
		map.put("4", "��ۿϷ�");
		map.put("5", "�ǸſϷ�");
		
		return map;
	}
	
	public Map<String, String> getColorMap() {
		
		map = new HashMap<String, String>();
		map.put("1", "primary");
		map.put("2", "success");
		map.put("3", "info");
		map.put("4", "warning");
		map.put("5", "default");
		
		return map;
	}
	
}
// class end
