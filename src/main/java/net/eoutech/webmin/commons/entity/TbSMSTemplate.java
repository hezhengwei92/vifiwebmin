
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbSMSTemplate {

  private Integer keySmsTemplateId;
  private String name;
  private String lang;
  private String msgTmpl;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public Integer getKeySmsTemplateId() {return keySmsTemplateId;}
  
  public void setKeySmsTemplateId( Integer keySmsTemplateId ) {this.keySmsTemplateId = keySmsTemplateId;}
  
  public String getName() {return name;}
  
  public void setName( String name ) {this.name = name;}
  
  public String getLang() {return lang;}
  
  public void setLang( String lang ) {this.lang = lang;}
  
  public String getMsgTmpl() {return msgTmpl;}
  
  public void setMsgTmpl( String msgTmpl ) {this.msgTmpl = msgTmpl;}
  
  public Date getMdfTm() {return mdfTm;}
  
  public void setMdfTm( Date mdfTm ) {this.mdfTm = mdfTm;}
  
  public String getMdfBy() {return mdfBy;}
  
  public void setMdfBy( String mdfBy ) {this.mdfBy = mdfBy;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

}
