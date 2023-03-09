package kr.ac.kopo.dao;

import kr.ac.kopo.model.Product;
import kr.ac.kopo.pager.Pager;
import kr.ac.kopo.pager.ProductPager;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDaoImpl implements ProductDao {

    @Autowired
    SqlSession sql;

    @Override
    public List<Product> list(ProductPager pager) {
        return sql.selectList("product.list", pager);
    }

    @Override
    public void add(Product item) {
        sql.insert("product.add", item);
    }

    @Override
    public void update(Product item) {
        sql.update("product.update", item);
    }

    @Override
    public Product item(int productId) {
        return sql.selectOne("product.item", productId);
    }

    @Override
    public void delete(int productId) {
        sql.delete("product.delete", productId);

    }

    @Override
    public int total(Pager pager) {
        return sql.selectOne("product.total", pager);
    }
}
