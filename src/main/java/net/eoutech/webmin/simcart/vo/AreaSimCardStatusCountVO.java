package net.eoutech.webmin.simcart.vo;

import org.springframework.data.annotation.Transient;

import java.util.Map;

public class AreaSimCardStatusCountVO {

    private Double statusSum;
    private String areaName;

    private String statusCountJSON;
    @Transient
    private Map<String, Integer> statusCountMap;

    // 卡数量
    private Integer simcardCount;

    private String continent;
    private String areaCode;


    public Double getStatusSum() {
        return statusSum;
    }

    public void setStatusSum(Double statusSum) {
        this.statusSum = statusSum;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }


    public String getContinent() {
        return continent;
    }

    public void setContinent(String continent) {
        this.continent = continent;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public String getStatusCountJSON() {
        return statusCountJSON;
    }

    public void setStatusCountJSON(String statusCountJSON) {
        this.statusCountJSON = statusCountJSON;
    }

    public Map<String, Integer> getStatusCountMap() {
        return statusCountMap;
    }

    public void setStatusCountMap(Map<String, Integer> statusCountMap) {
        this.statusCountMap = statusCountMap;
    }

    public Integer getSimcardCount() {
        return simcardCount;
    }

    public void setSimcardCount(Integer simcardCount) {
        this.simcardCount = simcardCount;
    }

}
    