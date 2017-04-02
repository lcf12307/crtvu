package com.crtvu.dto.Manager;

/**
 * Created by lcf12 on 2017/3/25.
 */
public class deletejson {

    private int page;//返回当前页数，暂时不用
    private long id;//学生学号

    @Override
    public String toString() {
        return "deletejson{" +
                "page=" + page +
                ", id=" + id +
                '}';
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public deletejson(int page, long id) {

        this.page = page;
        this.id = id;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public deletejson(int page) {

        this.page = page;
    }

    public deletejson() {

    }
}
