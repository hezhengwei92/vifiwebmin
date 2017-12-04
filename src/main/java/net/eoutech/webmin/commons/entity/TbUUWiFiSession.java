
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbUUWiFiSession {

  private String keySessID;//编号
//  private String sessType;//
  private String idxVifiID;//设备编号
  private String pwd;
  private String alaisName;
  private String userAct;//
  private String idxSimCIccId;//SIM卡
  private String idxSimPPortId;//卡槽号
  private String idxSimPDevID;//卡池编号
//  private String idxGoipDevID;
//  private Integer idxGoipPortID;
//  private String idxVSWID;
  private Integer status;//
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date lastConnectTime;
  private String lastConnectIP;

//  private Integer expire;
//  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
//  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
//  private Date lastUpdate;
//  private String remarks;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;
//  private String bindType;
//  private String idxUUWiFiAreaID;
//  private String idxSUBindID;
  private String idxAgentID;

  public String getIdxAgentID() {
    return idxAgentID;
  }

  public void setIdxAgentID(String idxAgentID) {
    this.idxAgentID = idxAgentID;
  }

  public String getPwd() {
  return pwd;
}

  public void setPwd(String pwd) {
    this.pwd = pwd;
  }

  public String getAlaisName() {
    return alaisName;
  }

  public void setAlaisName(String alaisName) {
    this.alaisName = alaisName;
  }

  public Date getLastConnectTime() {
    return lastConnectTime;
  }

  public void setLastConnectTime(Date lastConnectTime) {
    this.lastConnectTime = lastConnectTime;
  }

  public String getLastConnectIP() {
    return lastConnectIP;
  }

  public void setLastConnectIP(String lastConnectIP) {
    this.lastConnectIP = lastConnectIP;
  }

  public String getKeySessID() {return keySessID;}
  
  public void setKeySessID( String keySessID ) {this.keySessID = keySessID;}
  
//  public String getSessType() {return sessType;}
//
//  public void setSessType( String sessType ) {this.sessType = sessType;}
  
  public String getIdxVifiID() {return idxVifiID;}
  
  public void setIdxVifiID( String idxVifiID ) {this.idxVifiID = idxVifiID;}
  
  public String getIdxSimCIccId() {return idxSimCIccId;}
  
  public void setIdxSimCIccId( String idxSimCIccId ) {this.idxSimCIccId = idxSimCIccId;}
  
  public String getIdxSimPPortId() {return idxSimPPortId;}
  
  public void setIdxSimPPortId( String idxSimPPortId ) {this.idxSimPPortId = idxSimPPortId;}
  
  public String getIdxSimPDevID() {return idxSimPDevID;}
  
  public void setIdxSimPDevID( String idxSimPDevID ) {this.idxSimPDevID = idxSimPDevID;}
  
  /*public String getIdxGoipDevID() {return idxGoipDevID;}
  
  public void setIdxGoipDevID( String idxGoipDevID ) {this.idxGoipDevID = idxGoipDevID;}
  
  public Integer getIdxGoipPortID() {return idxGoipPortID;}
  
  public void setIdxGoipPortID( Integer idxGoipPortID ) {this.idxGoipPortID = idxGoipPortID;}
  
  public String getIdxVSWID() {return idxVSWID;}
  
  public void setIdxVSWID( String idxVSWID ) {this.idxVSWID = idxVSWID;}*/
  
  public Integer getStatus() {return status;}
  
  public void setStatus( Integer status ) {this.status = status;}
  
//  public Integer getExpire() {return expire;}
//
//  public void setExpire( Integer expire ) {this.expire = expire;}
  
//  public Date getLastUpdate() {return lastUpdate;}
//
//  public void setLastUpdate( Date lastUpdate ) {this.lastUpdate = lastUpdate;}
  
  public String getUserAct() {return userAct;}
  
  public void setUserAct( String userAct ) {this.userAct = userAct;}
  
//  public String getRemarks() {return remarks;}
//
//  public void setRemarks( String remarks ) {this.remarks = remarks;}
  
  public Date getMdfTm() {return mdfTm;}
  
  public void setMdfTm( Date mdfTm ) {this.mdfTm = mdfTm;}
  
  public String getMdfBy() {return mdfBy;}
  
  public void setMdfBy( String mdfBy ) {this.mdfBy = mdfBy;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}

  public String getCrtBy() {return crtBy;}

  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

//public String getBindType() {
//	return bindType;
//}
//
//public void setBindType(String bindType) {
//	this.bindType = bindType;
//}
//
//public String getIdxUUWiFiAreaID() {
//	return idxUUWiFiAreaID;
//}
//
//public void setIdxUUWiFiAreaID(String idxUUWiFiAreaID) {
//	this.idxUUWiFiAreaID = idxUUWiFiAreaID;
//}
//
//public String getIdxSUBindID() {
//	return idxSUBindID;
//}
//
//public void setIdxSUBindID(String idxSUBindID) {
//	this.idxSUBindID = idxSUBindID;
//}

}
