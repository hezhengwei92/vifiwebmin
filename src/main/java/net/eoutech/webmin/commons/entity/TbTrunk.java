
package net.eoutech.webmin.commons.entity;
import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;


public class TbTrunk {

  private Integer keyTrunkID;
  private String idxTrunkName;
  private Integer trusty;
  private Integer dynamic;
  private String username;
  private String realm;
  private String host;
  private Integer expires;
  private Integer port;
  private String Prefix;
  private Integer replaceUsername;
  private Integer state;
  private Integer callingNum;
  private Integer maxCallNum;
  private Integer mcSupport;
  private String VPXID;
  private String idxSalerID;
  private String Remarks;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date mdfTm;
  private String mdfBy;
  @JSONField(format = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date crtTm;
  private String crtBy;

  
  public Integer getKeyTrunkID() {return keyTrunkID;}
  
  public void setKeyTrunkID( Integer keyTrunkID ) {this.keyTrunkID = keyTrunkID;}
  
  public String getIdxTrunkName() {return idxTrunkName;}
  
  public void setIdxTrunkName( String idxTrunkName ) {this.idxTrunkName = idxTrunkName;}
  
  public Integer getTrusty() {return trusty;}
  
  public void setTrusty( Integer trusty ) {this.trusty = trusty;}
  
  public Integer getDynamic() {return dynamic;}
  
  public void setDynamic( Integer dynamic ) {this.dynamic = dynamic;}
  
  public String getUsername() {return username;}
  
  public void setUsername( String username ) {this.username = username;}
  
  public String getRealm() {return realm;}
  
  public void setRealm( String realm ) {this.realm = realm;}
  
  public String getHost() {return host;}
  
  public void setHost( String host ) {this.host = host;}
  
  public Integer getExpires() {return expires;}
  
  public void setExpires( Integer expires ) {this.expires = expires;}
  
  public Integer getPort() {return port;}
  
  public void setPort( Integer port ) {this.port = port;}
  @JSONField(name = "Prefix")
  public String getPrefix() {return Prefix;}
  @JSONField(name = "Prefix")
  public void setPrefix( String Prefix ) {this.Prefix = Prefix;}
  
  public Integer getReplaceUsername() {return replaceUsername;}
  
  public void setReplaceUsername( Integer replaceUsername ) {this.replaceUsername = replaceUsername;}
  
  public Integer getState() {return state;}
  
  public void setState( Integer state ) {this.state = state;}
  
  public Integer getCallingNum() {return callingNum;}
  
  public void setCallingNum( Integer callingNum ) {this.callingNum = callingNum;}
  
  public Integer getMaxCallNum() {return maxCallNum;}
  
  public void setMaxCallNum( Integer maxCallNum ) {this.maxCallNum = maxCallNum;}
  
  public Integer getMcSupport() {return mcSupport;}
  
  public void setMcSupport( Integer mcSupport ) {this.mcSupport = mcSupport;}
  @JSONField(name = "VPXID")
  public String getVPXID() {return VPXID;}
  @JSONField(name = "VPXID")
  public void setVPXID( String VPXID ) {this.VPXID = VPXID;}
  
  public String getIdxSalerID() {return idxSalerID;}
  
  public void setIdxSalerID( String idxSalerID ) {this.idxSalerID = idxSalerID;}
  @JSONField(name = "Remarks")
  public String getRemarks() {return Remarks;}
  @JSONField(name = "Remarks")
  public void setRemarks( String Remarks ) {this.Remarks = Remarks;}
  
  public Date getMdfTm() {return mdfTm;}
  
  public void setMdfTm( Date mdfTm ) {this.mdfTm = mdfTm;}
  
  public String getMdfBy() {return mdfBy;}
  
  public void setMdfBy( String mdfBy ) {this.mdfBy = mdfBy;}
  
  public Date getCrtTm() {return crtTm;}
  
  public void setCrtTm( Date crtTm ) {this.crtTm = crtTm;}
  
  public String getCrtBy() {return crtBy;}
  
  public void setCrtBy( String crtBy ) {this.crtBy = crtBy;}

}
