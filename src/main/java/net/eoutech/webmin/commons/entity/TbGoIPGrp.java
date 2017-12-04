
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbGoIPGrp {

  private String keyGoIPDevGrpID;
  private String groupName;
  private String remarks;
  private String idxAgentID;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public String getKeyGoIPDevGrpID() {return keyGoIPDevGrpID;}
  
  public void setKeyGoIPDevGrpID( String keyGoIPDevGrpID ) {this.keyGoIPDevGrpID = keyGoIPDevGrpID;}
  
  public String getGroupName() {return groupName;}
  
  public void setGroupName( String groupName ) {this.groupName = groupName;}
  
  public String getRemarks() {return remarks;}
  
  public void setRemarks( String remarks ) {this.remarks = remarks;}
  
  public Date getMdfTm() {return mdfTm;}
  
  public void setMdfTm( Date mdfTm ) {this.mdfTm = mdfTm;}
  
  public String getMdfBy() {return mdfBy;}
  
  public void setMdfBy( String mdfBy ) {this.mdfBy = mdfBy;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

public String getIdxAgentID() {
	return idxAgentID;
}

public void setIdxAgentID(String idxAgentID) {
	this.idxAgentID = idxAgentID;
}

}
