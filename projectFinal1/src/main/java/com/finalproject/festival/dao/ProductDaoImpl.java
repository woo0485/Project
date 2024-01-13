package com.finalproject.festival.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Product;

@Repository
public class ProductDaoImpl implements ProductDao {
	
	private final String NAME_SPACE = "com.finalproject.festival.mapper.ProductMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}	

	@Override
	public List<Product> productList (
			int startRow, int num, String type, String keyword) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("num", num);
		params.put("type", type);
		params.put("keyword", keyword);

		return sqlSession.selectList(NAME_SPACE + ".productList", params);
	}
	
	@Override
	public void readCount(int productno) {
		sqlSession.update(NAME_SPACE + ".readCount", productno);
	}

	// 상세보기
	@Override
	public Product getProduct(int productno) {
		return sqlSession.selectOne(NAME_SPACE + ".getProduct", productno);
	}

	// 게시 글 수 계산
	@Override
	public int getProductCount(String type, String keyword) {
		Map<String, String> params = new HashMap<String, String>();		
		params.put("type", type);
		params.put("keyword", keyword);
		
		return sqlSession.selectOne(NAME_SPACE + ".getProductCount", params);
	}

	@Override
	public void insertProduct(Product p) {
		sqlSession.insert(NAME_SPACE + ".insertProduct", p);
	}

	@Override
	public boolean isPassCheck(int productno, String adminpassword) {
		boolean result = false;
		String dbPass = sqlSession.selectOne(NAME_SPACE + ".isPassCheck", productno);
		
		if(dbPass.equals(adminpassword)) {
			result = true;
		}
		return result;
	}

	@Override
	public void updateProduct(Product p) {
		sqlSession.update(NAME_SPACE + ".updateProduct", p);
	}

	@Override
	public void deleteProduct(int productno) {
		sqlSession.delete(NAME_SPACE + ".deleteProduct", productno);
		
	}
	
///////////////// 여기서부터는 북마크 기능  /////////////////
// 북마크기능 -1월 4일
@Override
public Product getBookmark(int productno) {
return sqlSession.selectOne(NAME_SPACE + ".getBookmark", productno);
}

@Override
public void updateBookmark(int productno, int productbookmarkcount) {
Map<String, Object> params = new HashMap<String, Object>();
params.put("productno", productno);
params.put("productbookmarkcount", productbookmarkcount);
sqlSession.update(NAME_SPACE + ".updateBookmark", params);
}

////////////////     장바구니 결제되면서 상품 남은 티켓수 조정해주기     ///////////////
@Override
public void updateProductRemainTicketCount(int productno, int productremainticketcount) {
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("productno", productno);
	map.put("productremainticketcount", productremainticketcount);
	sqlSession.update(NAME_SPACE + ".updateProductRemainTicketCount", map);
}

@Override
public void productnoCheckRemainticketcount(int productno) {
	sqlSession.update(NAME_SPACE + ".productnoCheckRemainticketcount", productno);
}
	
}
