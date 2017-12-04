package net.eoutech.webmin.commons.vo;


/**
 * 状态数量
 */
public class StatusCountVO {
    private String status; // 状态码

    private Integer count = 0; // 数量

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }



    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
