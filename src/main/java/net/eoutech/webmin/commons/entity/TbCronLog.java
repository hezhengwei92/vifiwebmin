
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbCronLog {

  private Integer keyCronLogId;
  private Integer state;
  private String cronType;
  private Integer influenceRow;
  private String remarks;
  private String runCycle;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date createTime;

  
  public Integer getKeyCronLogId() {return keyCronLogId;}
  
  public void setKeyCronLogId( Integer keyCronLogId ) {this.keyCronLogId = keyCronLogId;}
  
  public Integer getState() {return state;}
  
  public void setState( Integer state ) {this.state = state;}
  
  public String getCronType() {return cronType;}
  
  public void setCronType( String cronType ) {this.cronType = cronType;}
  
  public Integer getInfluenceRow() {return influenceRow;}
  
  public void setInfluenceRow( Integer influenceRow ) {this.influenceRow = influenceRow;}
  
  public String getRemarks() {return remarks;}
  
  public void setRemarks( String remarks ) {this.remarks = remarks;}
  
  public String getRunCycle() {return runCycle;}
  
  public void setRunCycle( String runCycle ) {this.runCycle = runCycle;}
  
  public Date getCreateTime() {return createTime;}
  
  public void setCreateTime( Date createTime ) {this.createTime = createTime;}

}
