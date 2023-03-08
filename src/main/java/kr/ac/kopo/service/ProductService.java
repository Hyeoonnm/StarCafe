package kr.ac.kopo.service;

import kr.ac.kopo.model.Product;
import kr.ac.kopo.pager.Pager;

import java.util.List;

public interface ProductService {
    List<Product> list(Pager pager);

    void add(Product item);

    void update(Product item);

    Product item(int productId);

    void delete(int productId);

    void dummy();

    void init();
}
