package kr.co.literal.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	public ProductDAO()
	{
		System.out.println("----- ProductDAO() 객체 생성");
	} // public ProductDAO() end
	
	@Autowired
	SqlSession sqlSession;

	public void insert(Map<String, Object> map)
	{
		sqlSession.insert("kr.co.literal.product.ProductMapper.insert", map);
	} // public void insert end

    public int generateBookCode(String genreCode) {
        return sqlSession.selectOne("kr.co.literal.product.ProductMapper.generateBookCode", genreCode);
    } // public int generateBookCode() end

    public int getNextBookNumber(String genreCode, String bookCode) {
        return sqlSession.selectOne("kr.co.literal.product.ProductMapper.getNextBookNumber", Map.of("genreCode", genreCode, "bookCode", bookCode));
    } // public int getNextBookNumber() end
    
    public boolean bookCodeExists(String bookCode) {
        int count = sqlSession.selectOne("kr.co.literal.product.ProductMapper.bookCodeExists", bookCode);
        return count > 0;
    }

    public boolean bookNumberExists(String bookNumber) {
        int count = sqlSession.selectOne("kr.co.literal.product.ProductMapper.bookNumberExists", bookNumber);
        return count > 0;
    }
    
	public Map<String, Object> detail(String book_number)
	{
		return sqlSession.selectOne("kr.co.literal.product.ProductMapper.detail", book_number);
	} // public Map<String, Object> detail() end
	
    public List<Map<String, Object>> list(){
        return sqlSession.selectList("kr.co.literal.product.ProductMapper.list");
    }//list() end
    
    public List<Map<String, Object>> search(String book_title) { //검색어
        return sqlSession.selectList("kr.co.literal.product.ProductMapper.search", "%" + book_title + "%");
    }//search() end
    
	public void update(Map<String, Object> map)
	{
		sqlSession.update("kr.co.literal.product.ProductMapper.update", map);
	} // public void update() end
	
	
    public String img(String book_number) {
        return sqlSession.selectOne("kr.co.literal.product.ProductMapper.img", book_number);
    }//filename() end
	
	
	public void delete(String book_number)
	{
		sqlSession.delete("kr.co.literal.product.ProductMapper.delete", book_number);
	} // public void delete() end
	
	
    public List<Map<String, Object>> list_G(){
        return sqlSession.selectList("kr.co.literal.product.ProductMapper.list_G");
    }//list() end
    
    
	
} // public class ProductDAO end
