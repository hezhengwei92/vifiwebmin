
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbUser {

  private String keyUserID;//编号
  private String idxAppId;//用户ID
  private String nickname;//昵称
  private String idxPhoneNumber;//手机号
  private String idxAreaCode;
  private String password;//密码
  private String language;
  private String roamAreaCode;
  private Integer roamTimeZone;
  private String idxDomain;
  private String displayNumber;
  private String accountState;
  private Integer appState;//app状态： [["10","离线"],["11","在线"]]
  private Integer sex;//性别 ： 0:女、1:男
  private Integer vifiState;
  private String idxViFiID;
  private String idxVPXID;
  private String idxVSWID;
  private String idxGoIPPortID;
  private String idxSimpPortID;
  private String idxSimCardID;
  private Integer userBalance;
  private Integer voiceBalance;
  private Integer dataBalance;
  private Integer credit;//积分
  private String idxAgentID;
  private Integer sipExpire;
  private Integer lastUUWiFiData;
  private String lastUUWiFiSessId;
  private Integer todayUUWiFiData;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date lastUUWiFiDate;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date lastAPPOnlineDate;//离线时间
  private String lastAPPPublicIP;
  private Integer lastAPPPublicPort;
  private String lastAPPDevInfo;//机型
  private String lastAPPVer;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date lastViFiDate;
  private String lastViFiID;
  private String lastViFiPublicIP;
  private Integer userType;//用户类型  0:三方注册 1:手机号注册
  private String reqCodeMine;//邀请码
  private String reqCodeOther;//输入的邀请码
  private String avatar;//头像地址
  private String addrMAC;//MAC地址
  private String idxWechatId;//微信凭证
  private String idxQQId;//QQ凭证
  private String idxMicroblogId;//微博凭证
  private String remarks;//APP版本号
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  public String getIdxAppId() {
    return idxAppId;
  }

  public void setIdxAppId(String idxAppId) {
    this.idxAppId = idxAppId;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public Integer getSex() {
    return sex;
  }

  public void setSex(Integer sex) {
    this.sex = sex;
  }

  public String getReqCodeMine() {
    return reqCodeMine;
  }

  public void setReqCodeMine(String reqCodeMine) {
    this.reqCodeMine = reqCodeMine;
  }

  public String getReqCodeOther() {
    return reqCodeOther;
  }

  public void setReqCodeOther(String reqCodeOther) {
    this.reqCodeOther = reqCodeOther;
  }

  public String getAvatar() {
    return avatar;
  }

  public void setAvatar(String avatar) {
    this.avatar = avatar;
  }

  public String getAddrMAC() {
    return addrMAC;
  }

  public void setAddrMAC(String addrMAC) {
    this.addrMAC = addrMAC;
  }

  public String getIdxWechatId() {
    return idxWechatId;
  }

  public void setIdxWechatId(String idxWechatId) {
    this.idxWechatId = idxWechatId;
  }

  public String getIdxQQId() {
    return idxQQId;
  }

  public void setIdxQQId(String idxQQId) {
    this.idxQQId = idxQQId;
  }

  public String getIdxMicroblogId() {
    return idxMicroblogId;
  }

  public void setIdxMicroblogId(String idxMicroblogId) {
    idxMicroblogId = idxMicroblogId;
  }

  public String getKeyUserID() {return keyUserID;}
  
  public void setKeyUserID( String keyUserID ) {this.keyUserID = keyUserID;}
  
  public String getIdxPhoneNumber() {return idxPhoneNumber;}
  
  public void setIdxPhoneNumber( String idxPhoneNumber ) {this.idxPhoneNumber = idxPhoneNumber;}
  
  public String getIdxAreaCode() {return idxAreaCode;}
  
  public void setIdxAreaCode( String idxAreaCode ) {this.idxAreaCode = idxAreaCode;}
  
  public String getPassword() {return password;}
  
  public void setPassword( String password ) {this.password = password;}
  
  public String getLanguage() {return language;}
  
  public void setLanguage( String language ) {this.language = language;}
  
  public String getRoamAreaCode() {return roamAreaCode;}
  
  public void setRoamAreaCode( String roamAreaCode ) {this.roamAreaCode = roamAreaCode;}
  
  public Integer getRoamTimeZone() {return roamTimeZone;}
  
  public void setRoamTimeZone( Integer roamTimeZone ) {this.roamTimeZone = roamTimeZone;}
  
  public String getIdxDomain() {return idxDomain;}
  
  public void setIdxDomain( String idxDomain ) {this.idxDomain = idxDomain;}
  
  public String getDisplayNumber() {return displayNumber;}
  
  public void setDisplayNumber( String displayNumber ) {this.displayNumber = displayNumber;}
  
  public String getAccountState() {return accountState;}
  
  public void setAccountState( String accountState ) {this.accountState = accountState;}
  
  public Integer getAppState() {return appState;}
  
  public void setAppState( Integer appState ) {this.appState = appState;}
  
  public Integer getVifiState() {return vifiState;}
  
  public void setVifiState( Integer vifiState ) {this.vifiState = vifiState;}
  
  public String getIdxViFiID() {return idxViFiID;}
  
  public void setIdxViFiID( String idxViFiID ) {this.idxViFiID = idxViFiID;}
  
  public String getIdxVPXID() {return idxVPXID;}
  
  public void setIdxVPXID( String idxVPXID ) {this.idxVPXID = idxVPXID;}
  
  public String getIdxVSWID() {return idxVSWID;}
  
  public void setIdxVSWID( String idxVSWID ) {this.idxVSWID = idxVSWID;}
  
  public String getIdxGoIPPortID() {return idxGoIPPortID;}
  
  public void setIdxGoIPPortID( String idxGoIPPortID ) {this.idxGoIPPortID = idxGoIPPortID;}
  
  public String getIdxSimpPortID() {return idxSimpPortID;}
  
  public void setIdxSimpPortID( String idxSimpPortID ) {this.idxSimpPortID = idxSimpPortID;}
  
  public String getIdxSimCardID() {return idxSimCardID;}
  
  public void setIdxSimCardID( String idxSimCardID ) {this.idxSimCardID = idxSimCardID;}
  
  public Integer getUserBalance() {return userBalance;}
  
  public void setUserBalance( Integer userBalance ) {this.userBalance = userBalance;}
  
  public Integer getVoiceBalance() {return voiceBalance;}
  
  public void setVoiceBalance( Integer voiceBalance ) {this.voiceBalance = voiceBalance;}
  
  public Integer getDataBalance() {return dataBalance;}
  
  public void setDataBalance( Integer dataBalance ) {this.dataBalance = dataBalance;}
  
  public Integer getCredit() {return credit;}
  
  public void setCredit( Integer credit ) {this.credit = credit;}
  
  public String getIdxAgentID() {return idxAgentID;}
  
  public void setIdxAgentID( String idxAgentID ) {this.idxAgentID = idxAgentID;}
  
  public Integer getSipExpire() {return sipExpire;}
  
  public void setSipExpire( Integer sipExpire ) {this.sipExpire = sipExpire;}
  
  public Integer getLastUUWiFiData() {return lastUUWiFiData;}
  
  public void setLastUUWiFiData( Integer lastUUWiFiData ) {this.lastUUWiFiData = lastUUWiFiData;}
  
  public String getLastUUWiFiSessId() {return lastUUWiFiSessId;}
  
  public void setLastUUWiFiSessId( String lastUUWiFiSessId ) {this.lastUUWiFiSessId = lastUUWiFiSessId;}
  
  public Integer getTodayUUWiFiData() {return todayUUWiFiData;}
  
  public void setTodayUUWiFiData( Integer todayUUWiFiData ) {this.todayUUWiFiData = todayUUWiFiData;}
  
  public Date getLastUUWiFiDate() {return lastUUWiFiDate;}
  
  public void setLastUUWiFiDate( Date lastUUWiFiDate ) {this.lastUUWiFiDate = lastUUWiFiDate;}
  
  public Date getLastAPPOnlineDate() {return lastAPPOnlineDate;}
  
  public void setLastAPPOnlineDate( Date lastAPPOnlineDate ) {this.lastAPPOnlineDate = lastAPPOnlineDate;}
  
  public String getLastAPPPublicIP() {return lastAPPPublicIP;}
  
  public void setLastAPPPublicIP( String lastAPPPublicIP ) {this.lastAPPPublicIP = lastAPPPublicIP;}
  
  public Integer getLastAPPPublicPort() {return lastAPPPublicPort;}
  
  public void setLastAPPPublicPort( Integer lastAPPPublicPort ) {this.lastAPPPublicPort = lastAPPPublicPort;}
  
  public String getLastAPPDevInfo() {return lastAPPDevInfo;}
  
  public void setLastAPPDevInfo( String lastAPPDevInfo ) {this.lastAPPDevInfo = lastAPPDevInfo;}
  
  public String getLastAPPVer() {return lastAPPVer;}
  
  public void setLastAPPVer( String lastAPPVer ) {this.lastAPPVer = lastAPPVer;}
  
  public Date getLastViFiDate() {return lastViFiDate;}
  
  public void setLastViFiDate( Date lastViFiDate ) {this.lastViFiDate = lastViFiDate;}
  
  public String getLastViFiID() {return lastViFiID;}
  
  public void setLastViFiID( String lastViFiID ) {this.lastViFiID = lastViFiID;}
  
  public String getLastViFiPublicIP() {return lastViFiPublicIP;}
  
  public void setLastViFiPublicIP( String lastViFiPublicIP ) {this.lastViFiPublicIP = lastViFiPublicIP;}
  
  public Integer getUserType() {return userType;}
  
  public void setUserType( Integer userType ) {this.userType = userType;}
  
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

}
