package com.jqk.pojo;

import java.util.Date;

public class YiQing {
    private Integer code;

    private Date time;

    private String provincename;

    private String areaname;

    private Integer confirmcount;

    private Integer curedcount;

    private Integer deadcount;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getProvincename() {
        return provincename;
    }

    public void setProvincename(String provincename) {
        this.provincename = provincename;
    }

    public String getAreaname() {
        return areaname;
    }

    public void setAreaname(String areaname) {
        this.areaname = areaname;
    }

    public Integer getConfirmcount() {
        return confirmcount;
    }

    public void setConfirmcount(Integer confirmcount) {
        this.confirmcount = confirmcount;
    }

    public Integer getCuredcount() {
        return curedcount;
    }

    public void setCuredcount(Integer curedcount) {
        this.curedcount = curedcount;
    }

    public Integer getDeadcount() {
        return deadcount;
    }

    public void setDeadcount(Integer deadcount) {
        this.deadcount = deadcount;
    }

    @Override
    public String toString() {
        return "YiQing{" +
                "code=" + code +
                ", time=" + time +
                ", provincename='" + provincename + '\'' +
                ", areaname='" + areaname + '\'' +
                ", confirmcount=" + confirmcount +
                ", curedcount=" + curedcount +
                ", deadcount=" + deadcount +
                '}';
    }
}