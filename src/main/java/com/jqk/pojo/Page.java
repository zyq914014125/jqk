package com.jqk.pojo;

/**
 * ClassName: Page <br/>
 * Description: <br/>
 * date: 2020/7/22 18:59<br/>
 *
 * @author Acer-pc<br/>
 * @since JDK 1.8
 */
public class Page {
    private int page = 1;
    private int row = 10;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }
}
