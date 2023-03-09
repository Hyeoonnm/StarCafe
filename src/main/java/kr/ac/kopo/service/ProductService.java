package kr.ac.kopo.service;

import kr.ac.kopo.model.Product;
import kr.ac.kopo.pager.ProductPager;

import java.util.List;

public interface ProductService {
    List<Product> list(ProductPager pager);

    void add(Product item);

    void update(Product item);

    Product item(int productId);

    void delete(int productId);

    void dummy();

    void init();
}
