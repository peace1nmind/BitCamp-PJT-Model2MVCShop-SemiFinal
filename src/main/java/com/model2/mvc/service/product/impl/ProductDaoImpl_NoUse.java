package com.model2.mvc.service.product.impl;
// W D 

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;

@Repository("productDaoImpl")
public class ProductDaoImpl_NoUse implements ProductDao {

	// Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// Constructor
	public ProductDaoImpl_NoUse() {
	}

	@Override
	public List<Product> selectProductList(Search search, RowBounds rowBounds) {

		return sqlSession.selectList("ProductMapper.selectProductList", 
									 search, 
									 new RowBounds((search.getCurrentPage()-1) * search.getPageSize(), search.getPageSize()));
	}

	@Override
	public int selectTotalCount(Search search) {

		return sqlSession.selectOne("ProductMapper.selectTotalCount", search);
	}

	@Override
	public Product selectProduct(int prodNo) {

		return sqlSession.selectOne("ProductMapper.selectProduct", prodNo);
	}

	@Override
	public Product selectCurrentProduct() {

		return sqlSession.selectOne("ProductMapper.selectCurrentProduct");
	}

	@Override
	public int insertProduct(Product product){

		return sqlSession.insert("ProductMapper.insertProduct", product);
	}

	@Override
	public int updateProduct(Product product){

		return sqlSession.update("ProductMapper.updateProduct", product);
	}

	@Override
	public int updateProTranCode(Product product){

		return sqlSession.update("ProductMapper.updateTranCode", product);
	}

	@Override
	public List<Product> selectManageProductList(Search search, RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectManageTotalCount(Search search) {
		// TODO Auto-generated method stub
		return 0;
	}

}
// class end