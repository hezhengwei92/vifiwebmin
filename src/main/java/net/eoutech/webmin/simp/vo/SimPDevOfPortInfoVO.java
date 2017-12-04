package net.eoutech.webmin.simp.vo;

import net.eoutech.webmin.commons.entity.TbGoIPDev;
import net.eoutech.webmin.commons.entity.TbSimPDev;
import org.springframework.data.annotation.Transient;

/**
 * Created by Administrator on 2016/1/12.
 */
public class SimPDevOfPortInfoVO extends TbSimPDev {

    private String portInfo;
    @Transient
    private PortInfo[][] portInfoArray;

    public String getPortInfo() {
        return portInfo;
    }

    public void setPortInfo(String portInfo) {
        this.portInfo = portInfo;
    }

    public PortInfo[][] getPortInfoArray() {
        return portInfoArray;
    }

    public void setPortInfoArray(PortInfo[][] portInfoArray) {
        this.portInfoArray = portInfoArray;
    }

    public static class PortInfo {

        private Integer portNum;
        private Integer keyID;
        private Integer state;


        public Integer getPortNum() {
            return portNum;
        }

        public void setPortNum(Integer portNum) {
            this.portNum = portNum;
        }

        public Integer getKeyID() {
            return keyID;
        }

        public void setKeyID(Integer keyID) {
            this.keyID = keyID;
        }

        public Integer getState() {
            return state;
        }

        public void setState(Integer state) {
            this.state = state;
        }
    }
}
