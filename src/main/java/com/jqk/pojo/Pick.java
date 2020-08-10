package com.jqk.pojo;


import java.util.Date;

public class Pick {
    private Integer pickid;

    private Integer userid;

    private String name;

    private String local;

    private String wechatname;

    private Date date;

    @Override
    public String toString() {
        return "Pick{" +
                "pickid=" + pickid +
                ", userid=" + userid +
                ", name='" + name + '\'' +
                ", local='" + local + '\'' +
                ", wechatname='" + wechatname + '\'' +
                ", date=" + date +
                '}';
    }

    public Integer getPickid() {
        return pickid;
    }

    public void setPickid(Integer pickid) {
        this.pickid = pickid;
    }

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

    public String getWechatname() {
        return wechatname;
    }

    public void setWechatname(String wechatname) {
        this.wechatname = wechatname;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}