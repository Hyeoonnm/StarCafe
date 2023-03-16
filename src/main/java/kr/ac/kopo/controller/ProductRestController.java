package kr.ac.kopo.controller;

import kr.ac.kopo.model.Product;
import kr.ac.kopo.pager.ProductPager;
import kr.ac.kopo.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@RestController
@RequestMapping("/api/product")
@RequiredArgsConstructor
public class ProductRestController {

    private final ProductService productService;

    //
    @GetMapping
    public Map<String, Object> list(ProductPager pager) {
        HashMap<String, Object> map = new HashMap<>();

        List<Product> list = productService.list(pager);

        map.put("list", list);
        map.put("pager", pager);

        return map;
    }
}
