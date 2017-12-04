
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbUserTopupRcd {

  private Integer keyID;
  private String idxOrderID;
  private String idxUserID;
  private String topupType;
  private String idxExID;
  private String idxAgentID;
  private String pkgType;
  private String pkgInfo;
  private Integer flow;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date effectiveTm;
  private String goodsID;
  private Integer amount;
  private String ipAddr;
  private String status;
  private String remark;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  public String getPkgType() {
    return pkgType;
  }

  public void setPkgType(String pkgType) {
    this.pkgType = pkgType;
  }

  public String getPkgInfo() {
    return pkgInfo;
  }

  public void setPkgInfo(String pkgInfo) {
    this.pkgInfo = pkgInfo;
  }

  public Integer getFlow() {
    return flow;
  }

  public void setFlow(Integer flow) {
    this.flow = flow;
  }

  public Date getEffectiveTm() {
    return effectiveTm;
  }

  public void setEffectiveTm(Date effectiveTm) {
    this.effectiveTm = effectiveTm;
  }

  public Integer getKeyID() {return keyID;}
  
  public void setKeyID( Integer keyID ) {this.keyID = keyID;}
  
  public String getIdxOrderID() {return idxOrderID;}
  
  public void setIdxOrderID( String idxOrderID ) {this.idxOrderID = idxOrderID;}
  
  public String getIdxUserID() {return idxUserID;}
  
  public void setIdxUserID( String idxUserID ) {this.idxUserID = idxUserID;}
  
  public String getTopupType() {return topupType;}
  
  public void setTopupType( String topupType ) {this.topupType = topupType;}
  
  public String getIdxExID() {return idxExID;}
  
  public void setIdxExID( String idxExID ) {this.idxExID = idxExID;}
  
  public String getIdxAgentID() {return idxAgentID;}
  
  public void setIdxAgentID( String idxAgentID ) {this.idxAgentID = idxAgentID;}
  
  public String getGoodsID() {return goodsID;}
  
  public void setGoodsID( String goodsID ) {this.goodsID = goodsID;}
  
  public Integer getAmount() {return amount;}
  
  public void setAmount( Integer amount ) {this.amount = amount;}
  
  public String getIpAddr() {return ipAddr;}
  
  public void setIpAddr( String ipAddr ) {this.ipAddr = ipAddr;}
  
  public String getStatus() {return status;}
  
  public void setStatus( String status ) {this.status = status;}
  
  public String getRemark() {return remark;}
  
  public void setRemark( String remark ) {this.remark = remark;}
  
  public Date getMdfTm() {return mdfTm;}
  
  public void setMdfTm( Date mdfTm ) {this.mdfTm = mdfTm;}
  
  public String getMdfBy() {return mdfBy;}
  
  public void setMdfBy( String mdfBy ) {this.mdfBy = mdfBy;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

}
