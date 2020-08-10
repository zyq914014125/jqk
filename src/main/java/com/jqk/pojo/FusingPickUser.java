package com.jqk.pojo;

import java.util.Date;

/**
 * @author Mr.X
 **/
public class FusingPickUser {
    private Integer userid;

    private String name;

    private String local;

    private String date;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "FusingPickUser{" +
                "userid=" + userid +
                ", name='" + name + '\'' +
                ", local='" + local + '\'' +
                ", date=" + date +
                '}';
    }

}
