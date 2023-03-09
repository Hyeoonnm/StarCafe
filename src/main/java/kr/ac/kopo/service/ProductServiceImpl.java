package kr.ac.kopo.service;

import kr.ac.kopo.dao.ProductDao;
import kr.ac.kopo.model.Product;
import kr.ac.kopo.pager.ProductPager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductDao productDao;

    @Override
    public List<Product> list(ProductPager pager) {
        int total = productDao.total(pager);

        pager.setTotal(total);

        return productDao.list(pager);
    }

    @Override
    public void add(Product item) {
        productDao.add(item);
    }

    @Override
    public void update(Product item) {
        productDao.update(item);
    }

    @Override
    public Product item(int productId) {
        return productDao.item(productId);
    }

    @Override
    public void delete(int productId) {
        productDao.delete(productId);
    }

    @Override
    public void dummy() {
        for (int index = 1; index < 100; index++) {
            Product item = new Product();

            item.setName("제품명" + index);
            item.setPrice(index);
            item.setCategory(1);

            productDao.add(item);
        }

    }

    @Override
    public void init() {
        while (true) {
            List<Product> list = productDao.list(new ProductPager());

            if (list.size() < 1)
                break;

            for (Product item : list) {
                productDao.delete(item.getProductId());
            }
        }
    }
}
