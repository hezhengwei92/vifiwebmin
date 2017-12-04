
package net.eoutech.webmin.simp.dao;

import com.frame.dao.FrameBaseDao;

import com.spring.jdbc.assistants.persistence.JdbcDao;
import net.eoutech.webmin.commons.entity.CommonOutlineInfoVO;
import net.eoutech.webmin.commons.entity.TbSimPDev;
import net.eoutech.webmin.commons.entity.TbSimPPort;
import net.eoutech.webmin.commons.vo.StatusCountVO;
import net.eoutech.webmin.simp.vo.SimPPortInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class SimPPortDao extends FrameBaseDao {

    @Autowired
    JdbcDao jdbcDao;
    public void deleteSimPPort(int keyID){
        jdbcDao.delete(TbSimPPort.class,keyID);
    }
    public List<TbSimPPort> querySimPPort(String keyid){
        String sql="select * from tbSimPPort where idxSimPDevID='"+keyid+"'";
        List<TbSimPPort> tbSimPPorts=queryList(sql,TbSimPPort.class);
        return tbSimPPorts;
    }
    public List<StatusCountVO> querySimPPortStatusCountByDevID(List<String> devIdList) {
        String whereSql = "";
        if (devIdList != null) {
            whereSql = String.format("WHERE idxSimPDevID in (%s)\n", listToWhereIN(devIdList));
        }
        String sql = "select status,count(status) count from tbSimPPort " + whereSql + " group by status ";
        return queryList(sql, StatusCountVO.class);
    }


    public List<SimPPortInfoVO> querySimPPortInfoByPortID(List<String> idList) {
        String sql = "SELECT\n" +
                "tbSimPPort.idxSimPDevID,\n" +
                "tbSimPPort.idxSlotNum,\n" +
                "tbSimPPort.`status`,\n" +
                "tbSimCard.idxSCGroupID,\n" +
                "tbSimCard.`status` AS cStatus,\n" +
                "tbSimCard.number cNumber,\n" +
                "tbSimCard.balance cBalance,\n" +
                "tbViFiDevice.devState vStatus,\n" +
                "tbViFiDevice.cos vCos\n" +
                "FROM\n" +
                "tbSimPPort\n" +
                "LEFT JOIN tbSimCard ON tbSimPPort.idxIccid = tbSimCard.idxIccid\n" +
                "LEFT JOIN tbViFiDevice ON tbSimPPort.idxViFiId = tbViFiDevice.idxViFiID";
        if (idList != null) {
            sql += " where keyID in (" + listToWhereIN(idList) + ")";
        }
        return queryList(sql, SimPPortInfoVO.class);
    }

    public List<SimPPortInfoVO> querySimPPortInfoByDevID(String idxSimPDevID) {
        String sql = "SELECT\n" +
                "tbSimPPort.idxSimPDevID,\n" +
                "tbSimPPort.idxSlotNum,\n" +
                "tbSimPPort.`status`,\n" +
                "tbSimCard.idxSCGroupID,\n" +
                "tbSimCard.`status` AS cStatus,\n" +
                "tbSimCard.number cNumber,\n" +
                "tbSimCard.balance / 1000 cBalance,\n" +
                "tbViFiDevice.devState vStatus,\n" +
                "tbViFiDevice.cos vCos\n" +
                "FROM\n" +
                "tbSimPPort\n" +
                "LEFT JOIN tbSimCard ON tbSimPPort.idxIccid = tbSimCard.idxIccid\n" +
                "LEFT JOIN tbViFiDevice ON tbSimPPort.idxViFiId = tbViFiDevice.idxViFiID where idxSimPDevID=?";
        return queryList(sql, new Object[]{idxSimPDevID}, SimPPortInfoVO.class);
    }
    /**
     * 支持返回泛型实体!
     */
    public List<TbSimPDev> queryList2(String idxAgentID) {
    	String sql = "select d.* from tbSimPDev d, tbSimPDevGrp g where g.idxAgentID like '"+idxAgentID+"%' and g.keyID=d.idxSimPDevGrpID";
        return queryList(sql,TbSimPDev.class);
    }
    
    public CommonOutlineInfoVO getSimCardData(){
    	String sql = "";
    	List<CommonOutlineInfoVO> list =queryList(sql, CommonOutlineInfoVO.class);
    	return (list!=null &&list.size()>0)?list.get(0):new CommonOutlineInfoVO();
    }
    
    public int getUsingCardsCount(){
    	String sql = "SELECT *  FROM  `tbSimPPort`";
    	List<TbSimPDev> list =queryList(sql, TbSimPDev.class);
        return list!=null?list.size() : 0;
    }
}

       