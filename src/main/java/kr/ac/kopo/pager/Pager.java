package kr.ac.kopo.pager;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pager {
    private int page = 1;
    private int perPage = 10;
    private float total;
    final int perGroup = 5;

    public int getOffset() {
        return (page - 1) * perPage;
    }

}
