
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbSupplier {

  private String idxSupplierId;
  private String name;
  private String phoneNumber;
  private Integer supplierLevel;
  private Integer status;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public String getIdxSupplierId() {return idxSupplierId;}
  
  public void setIdxSupplierId( String idxSupplierId ) {this.idxSupplierId = idxSupplierId;}
  
  public String getName() {return name;}
  
  public void setName( String name ) {this.name = name;}
  
  public String getPhoneNumber() {return phoneNumber;}
  
  public void setPhoneNumber( String phoneNumber ) {this.phoneNumber = phoneNumber;}
  
  public Integer getSupplierLevel() {return supplierLevel;}
  
  public void setSupplierLevel( Integer supplierLevel ) {this.supplierLevel = supplierLevel;}
  
  public Integer getStatus() {return status;}
  
  public void setStatus( Integer status ) {this.status = status;}
  
  public Date getMdfTm() {return mdfTm;}
  
  public void setMdfTm( Date mdfTm ) {this.mdfTm = mdfTm;}
  
  public String getMdfBy() {return mdfBy;}
  
  public void setMdfBy( String mdfBy ) {this.mdfBy = mdfBy;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

}
