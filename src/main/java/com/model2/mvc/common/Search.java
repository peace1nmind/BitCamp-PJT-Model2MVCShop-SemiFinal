package com.model2.mvc.common;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import lombok.ToString;

//==>����Ʈȭ���� �𵨸�(�߻�ȭ/ĸ��ȭ)�� Bean
@ToString
public class Search implements Cloneable {
	
	///Field
	private int currentPage = 1;
	private String searchCondition;
	private String searchKeyword;
	private int pageSize;
	//==> ����Ʈȭ�� currentPage�� �ش��ϴ� ȸ�������� ROWNUM ��� SELECT ���� �߰��� Field 
	//==> UserMapper.xml �� 
	//==> <select  id="getUserList"  parameterType="search"	resultMap="userSelectMap">
	//==> ����
	private int endRowNum;
	private int startRowNum;
	
	/* �����߰��׸� */
	int page = 1;
	
	/* �����˻��� ���� �ʵ� */
	private int searchPriceBigger;
	private int searchPriceLess;
	
	/* ��ǰ���Ŀ� ���� �ʵ� */
	private String orderByPrice;
	private String orderByProdName;
	
	public String getOrderByPrice() {
		return orderByPrice;
	}

	public void setOrderByPrice(String orderByPrice) {
		this.orderByPrice = orderByPrice;
	}

	public String getOrderByProdName() {
		return orderByProdName;
	}

	public void setOrderByProdName(String orderByProdName) {
		this.orderByProdName = orderByProdName;
	}
	
	/* ��ǰ���� - tranCode */
	private ArrayList<String> tranCode = new ArrayList<>(Arrays.asList("1"));;
	
	public ArrayList<String> getTranCode() {
		return tranCode;
	}

	public void setTranCode(ArrayList<String> tranCode) {
		
		if (tranCode.isEmpty() || tranCode == null) {
			this.tranCode.add("1");
		} else {
			this.tranCode = tranCode;
		}
		
	}
	
	/* �����̷� ��¥ */
	private String startDate;
	private String endDate;
	
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	///Constructor
	public Search() {
		System.out.println("new "+getClass().getSimpleName()+" Constructor");
		
		DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		LocalDate today = LocalDate.now();
		
		// starDate�� �Ѵ���, endDate�� ����
		startDate = (today.minusMonths(1)).format(dateFormat);
		endDate = today.format(dateFormat);
	}
	
	public Search(int currentPage, int pageSize) {
		this();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
	}

	
	///Method
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int paseSize) {
		this.pageSize = paseSize;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		if (currentPage == 0) {
			currentPage = 1;
		}
		this.currentPage = currentPage;
	}

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if (page==0) {
			page = 1;
		}
		this.page = page;
		currentPage = page;
	}

	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword.trim();
	}
	
	public int getSearchPriceBigger() {
		return searchPriceBigger;
	}

	public void setSearchPriceBigger(int searchPriceBigger) {
		this.searchPriceBigger = searchPriceBigger;
	}

	public int getSearchPriceLess() {
		return searchPriceLess;
	}

	public void setSearchPriceLess(int searchPriceLess) {
		this.searchPriceLess = searchPriceLess;
	}

	//==> Select Query �� ROWNUM ������ �� 
	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}
	//==> Select Query �� ROWNUM ���� ��
	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize();
	}
	
	@Override
    public Search clone() {
        try {
            // ���� ����� Search ��ü ����
            Search cloned = (Search) super.clone();

            // ���� Ÿ���� ArrayList�� ���� ���縦 ����
            cloned.tranCode = new ArrayList<>(this.tranCode);

            return cloned;
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(); // This shouldn't happen
        }
    }
}