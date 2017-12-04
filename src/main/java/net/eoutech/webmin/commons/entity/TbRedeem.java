package net.eoutech.webmin.commons.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by wei on 2017/9/20.
 */
public class TbRedeem {
    private Integer exchangeId;//兑换编号
    private Integer integral;//兑换积分
    private Integer exContent;//兑换流量
    private String introduction;//兑换简介
    private String method;//兑换方法
    private String contentType;//兑换类型，LIMITED，LEND，NORMAL
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date effectiveTm;//流量有效期
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date activityTm;//活动时间
    private String image;//内部图片链接
    private String bigImage;//外部图片链接
    private Integer exchangeTimes;//可兑换次数
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date crtTm;

    public Integer getExchangeId() {
        return exchangeId;
    }

    public void setExchangeId(Integer exchangeId) {
        this.exchangeId = exchangeId;
    }

    public Integer getIntegral() {
        return integral;
    }

    public void setIntegral(Integer integral) {
        this.integral = integral;
    }

    public Integer getExContent() {
        return exContent;
    }

    public void setExContent(Integer exContent) {
        this.exContent = exContent;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public Date getEffectiveTm() {
        return effectiveTm;
    }

    public void setEffectiveTm(Date effectiveTm) {
        this.effectiveTm = effectiveTm;
    }

    public Date getActivityTm() {
        return activityTm;
    }

    public void setActivityTm(Date activityTm) {
        this.activityTm = activityTm;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getBigImage() {
        return bigImage;
    }

    public void setBigImage(String bigImage) {
        this.bigImage = bigImage;
    }

    public Integer getExchangeTimes() {
        return exchangeTimes;
    }

    public void setExchangeTimes(Integer exchangeTimes) {
        this.exchangeTimes = exchangeTimes;
    }

    public Date getCrtTm() {
        return crtTm;
    }

    public void setCrtTm(Date crtTm) {
        this.crtTm = crtTm;
    }
}
