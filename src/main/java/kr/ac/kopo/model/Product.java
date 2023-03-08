package kr.ac.kopo.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Product {
    private int productId;
    private String name;
    private int price;
    private int category; // 1 음료, 2 푸드, 3 상품, 4 카드
    private int status; // 0판매중지, 1판매중

    public String getCategory__() {
        if (category == 1)
            return "음료";
        else if (category == 2)
            return "푸드";
        else if (category == 3)
            return "상품";
        else if (category == 4)
            return "카드";
        else
            return "알 수 없음";
    }

    public String getStatus__() {
        if (status == 1)
            return "판매 중";
        else if (status == 0)
            return "판매 중지";
        else
            return "알 수 없음";
    }

    public Product() {
    }

    public Product(int productId, String name, int price, int category, int status) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.category = category;
        this.status = status;
    }
}
