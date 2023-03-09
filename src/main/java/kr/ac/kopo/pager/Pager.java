package kr.ac.kopo.pager;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class Pager {
    private int page = 1;
    private int perPage = 10;
    private float total;
    final int perGroup = 5;
    public int search;
    public String keyword;

    public String getQuery() {
        String query = "?";

        query += "&search=" + search;

        query += "&keyword=" + keyword;

        return query;
    }

    public List<Integer> getList() {
        ArrayList<Integer> list = new ArrayList<Integer>();

        int startPage = ((page - 1) / perGroup) * perGroup + 1;

        for (int index = startPage; index < (startPage + perGroup) && index <= getLast(); index++) {
            list.add(index);
        }

        if (list.isEmpty()) {
            list.add(1);
        }

        return list;
    }

    public int getPrev() {
        return page <= perGroup ? 1 : ((page - 1) / perGroup) * perGroup;
    }

    public int getNext() {
        int next = (((page - 1) / perGroup) + 1) * perGroup + 1;

        int last = getLast();

        return next < last ? next : last;
    }

    public int getLast() {
        return (int) Math.ceil(total / perPage);
    }

    public int getOffset() {
        return (page - 1) * perPage;
    }

}
