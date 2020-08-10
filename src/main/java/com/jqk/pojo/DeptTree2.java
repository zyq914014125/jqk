package com.jqk.pojo;

public class DeptTree2 {
    private Long dId;

    private Long pId;

    private String name;

    public DeptTree2() {
    }

    @Override
    public String toString() {
        return "{" +
                "\"dId\":" + dId +
                ", \"pId\":" + pId +
                ", \"name\":\"" + name + '\"' +
                '}';
    }

    public Long getdId() {
        return dId;
    }

    public void setdId(Long dId) {
        this.dId = dId;
    }

    public Long getpId() {
        return pId;
    }

    public void setpId(Long pId) {
        this.pId = pId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public DeptTree2(Long dId, Long pId, String name) {
        this.dId = dId;
        this.pId = pId;
        this.name = name;
    }
}
