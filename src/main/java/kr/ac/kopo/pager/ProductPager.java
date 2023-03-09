package kr.ac.kopo.pager;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProductPager extends Pager {
    private int minPrice;
    private int maxPrice;

    public String getQuery() {
        String query = super.getQuery();

        query += "&minPrice=" + minPrice;

        query += "&maxPrice=" + maxPrice;

        return query;
    }
}
