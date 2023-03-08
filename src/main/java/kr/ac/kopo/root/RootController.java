package kr.ac.kopo.root;

import kr.ac.kopo.model.Product;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Slf4j
public class RootController {

    @RequestMapping("/")
    public String index() {

        return "index";
    }

}