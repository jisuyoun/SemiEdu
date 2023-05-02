package pes.cos.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cos.model.CosVO;

public interface InterProductDAO {

	
	// tbl_category 테이블에서 카테고리코드(categoryCode), 카테고리명(categoryName)을 조회해오기 
	List<HashMap<String, String>> getCategoryList() throws SQLException;
	
	
	// categoryCode가 tbl_category 테이블에 존재하는지 존재하지 않는지 알아오기
	boolean isExist_categoryCode(String categoryCode) throws SQLException;
	
	
	// 제품번호 채번 해오기
	public String getCourseCodeOfProduct() throws SQLException;
	
	
	// tbl_course 테이블에 insert 하기 
	public int productInsert(CosVO cvo) throws SQLException;

		
	// tbl_product_imagefile 테이블에 제품의 추가이미지 파일명 insert 해주기  
	public int product_imagefile_Insert(String courseCode, String attachFileName) throws SQLException;

	
	// 강의코드를 가지고서 해당 제품의 정보를 조회해오기
	public CosVO selectOneProductByCourseCode(String courseCode) throws SQLException;

	
	// 강의코드를 가지고서 해당 제품의 추가된 이미지 정보를 조회해오기
	public List<String> getImagesByCourseCode(String courseCode) throws SQLException;

	
	

	


	


	


	

		
	
	
	
}
