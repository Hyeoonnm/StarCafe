package kr.ac.kopo.dao;

import kr.ac.kopo.model.Product;
import kr.ac.kopo.pager.Pager;

import java.util.List;

public interface ProductDao {
    List<Product> list(Pager pager);

    void add(Product item);

    void update(Product item);

    Product item(int productId);

    void delete(int productId);

    int total(Pager pager);
}
