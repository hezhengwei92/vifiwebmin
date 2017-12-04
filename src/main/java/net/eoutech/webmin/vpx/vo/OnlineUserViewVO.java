package net.eoutech.webmin.vpx.vo;

/**
 * Created by Administrator on 2015/11/6.
 */
public class OnlineUserViewVO {
    private String ip;
    private Long count;
    private String country;
    private String operators;

    public OnlineUserViewVO() {
    }

    public OnlineUserViewVO(String ip, Long count) {
        this.ip = ip;
        this.count = count;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public String getOperators() {
        return operators;
    }

    public void setOperators(String operators) {
        this.operators = operators;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
