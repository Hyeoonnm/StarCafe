package kr.ac.kopo.controller;

import kr.ac.kopo.model.Product;
import kr.ac.kopo.pager.Pager;
import kr.ac.kopo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    ProductService productService;

    @GetMapping("/list")
    public String list(Model model, Pager pager) {
        List<Product> list = productService.list(pager);

        model.addAttribute("list", list);

        return "product/list";
    }

    @GetMapping("/add")
    public String add() {
        return "product/add";
    }

    @PostMapping("/add")
    public String add(Product item) {
        productService.add(item);

        return "redirect:list";
    }

    @GetMapping("/update/{productId}")
    public String update(@PathVariable int productId, Model model) {
        Product item = productService.item(productId);

        model.addAttribute("item", item);

        return "product/update";
    }

    @PostMapping("/update/{productId}")
    public String update(@PathVariable int productId, Product item) {
        item.setProductId(productId);

        productService.update(item);

        return "redirect:../list";
    }

    @GetMapping("/delete/{productId}")
    public String delete(@PathVariable int productId) {
        productService.delete(productId);

        return "redirect:../list";
    }

    @GetMapping("/dummy")
    public String dummy() {
        productService.dummy();

        return "redirect:list";
    }

    @GetMapping("/init")
    public String init() {
        productService.init();

        return "redirect:list";
    }
}
