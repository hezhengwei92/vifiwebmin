
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbConfigure {

  private Integer keyConfigureId;
  private String name;
  private String type;
  private String value;
  private String description;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public Integer getKeyConfigureId() {return keyConfigureId;}
  
  public void setKeyConfigureId( Integer keyConfigureId ) {this.keyConfigureId = keyConfigureId;}
  
  public String getName() {return name;}
  
  public void setName( String name ) {this.name = name;}
  
  public String getType() {return type;}
  
  public void setType( String type ) {this.type = type;}
  
  public String getValue() {return value;}
  
  public void setValue( String value ) {this.value = value;}
  
  public String getDescription() {return description;}
  
  public void setDescription( String description ) {this.description = description;}
  
  public Date getMdfTm() {return mdfTm;}
  
  public void setMdfTm( Date mdfTm ) {this.mdfTm = mdfTm;}
  
  public String getMdfBy() {return mdfBy;}
  
  public void setMdfBy( String mdfBy ) {this.mdfBy = mdfBy;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

}
