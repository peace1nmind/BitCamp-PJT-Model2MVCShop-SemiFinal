package com.model2.mvc.service.domain;
// W D 

import java.io.File;
import java.sql.Date;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.service.TranCodeMapper;

public class Product {
	
	private int prodNo;
	private String prodName;
	private String prodDetail;
	private String manuDate;
	private int price;
	private String fileName;					// 상품 이미지 파일이름
	private MultipartFile file;
	private Date regDate;
	private String proTranCode = "1";			// 상품 상태코드
	//											  (1:판매중, 2:구매완료, 3:배송중, 4:배송완료)
	
	public Product(){
	}
	
	public Product(int prodNo) {
		this.prodNo = prodNo;
	}
	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		System.out.println(file.getOriginalFilename());
		
		if (file.getSize() != 0) {
			String fileFullName = file.getOriginalFilename();
			
			int index = (fileFullName.contains("\\"))? fileFullName.lastIndexOf("\\")+1 : fileFullName.lastIndexOf("/")+1;
			fileName = fileFullName.substring(index);
		}
		
		this.file = file;
	}

	public String getProTranCode() {
		return proTranCode;
	}
	
	public void setProTranCode(String proTranCode) {
		proTranCode = proTranCode.trim();
		Map<String, String> tranCodeMap = TranCodeMapper.getInstance().getMap();
		
		if (!tranCodeMap.containsKey(proTranCode)) {
			throw new IllegalArgumentException("올바르지 않은 tranCode\n1:판매중, 2:구매완료, 3:배송중, 4:배송완료, 5:최종 판매완료");
		}
		
		this.proTranCode = proTranCode;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName.trim();
	}
	
	public String getManuDate() {
		return manuDate;
	}
	
	public void setManuDate(String manuDate) {
		manuDate = manuDate.trim().replace("-", "");
		this.manuDate = manuDate;
	}
	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getProdDetail() {
		return prodDetail;
	}
	
	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail.trim();
	}
	
	public String getProdName() {
		return prodName;
	}
	
	public void setProdName(String prodName) {
		this.prodName = prodName.trim();
	}
	
	public int getProdNo() {
		return prodNo;
	}
	
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	// Override
	public String toString() {
		
		return String.format("ProductVO : [prodNo] %d [prodName] %s [prodDetail] %s "
				+ "\n\t [manuDate] %s [price] %d [fileName] %s  "
				+ "\n\t [regDate] %s [proTranCode] %s ", 
						prodNo, prodName, prodDetail, manuDate,price, fileName, regDate,proTranCode);
	}

}
// class end
