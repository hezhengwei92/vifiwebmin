
package net.eoutech.webmin.simp.dao;

import java.util.List;
import java.util.Map;

import com.spring.jdbc.assistants.persistence.JdbcDao;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.CommonOutlineInfoVO;
import net.eoutech.webmin.commons.entity.TbAgent;
import net.eoutech.webmin.commons.entity.TbSimPDev;
import net.eoutech.webmin.commons.entity.TbSimPDevGrp;
import net.eoutech.webmin.commons.vo.StatusCountVO;
import net.eoutech.webmin.simp.vo.SimPDevOfPortInfoVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.frame.commons.utils.UserUtils;
import com.frame.dao.FrameBaseDao;

@Component
public class SimPDevDao extends FrameBaseDao {
    @Autowired
    JdbcDao jdbcDao;

    public void deleteSimPDev(String keySimPDevID){
        jdbcDao.delete(TbSimPDev.class,keySimPDevID);
    }
    public List<Map<String, Object>> queryDevPortStatus(List<String> devIdList) {
        String whereSql = "";
        if (devIdList != null) {
            whereSql = String.format("WHERE d.keySimPDevID in (%s)\n", listToWhereIN(devIdList));
        }
        String sql = "select t.keySimPDevID,t.ports portCount,\n" +
                "               concat('[',GROUP_CONCAT(CAST(concat('[',t. STATUS,',',t.count,']') AS char) order by t. STATUS ),']') status from\n" +
                "               (\n" +
                "                 SELECT d.keySimPDevID,d.ports,p. STATUS,count(p. STATUS) count\n" +
                "               \t\tFROM tbSimPDev d LEFT JOIN tbSimPPort p ON d.keySimPDevID = p.idxSimPDevID " + whereSql +
                "               \t\tGROUP BY d.keySimPDevID,p.STATUS\n" +
                "               ) t GROUP BY t.keySimPDevID";
        return jdbcTemplate.queryForList(sql);
    }

    /**
     * 查询所有设备,端口信息
     *
     * @return [{
     * tbSimPDev.*:,//tbSimPDev 所有属性,太多 不一一列出来了
     * portInfo:JSON,Object字符串{idxSlotNum:{
     * keyID:Integer, //设备主键
     * status:Integer //设备状态
     * }}
     * }]
     */
    public List<SimPDevOfPortInfoVO> queryAllSimPDevOfPortInfo() {
        String sql = "select d.*,\n" +
                "\tconcat('{',GROUP_CONCAT(CAST(concat('\"',p.idxSlotNum ,'\":{\"keyID\":',p.keyID,',\"status\":',ifnull(p.STATUS,0),'}') AS char) order by p. idxSlotNum ),'}') portInfo\n" +
                "from \n" ;
//		        TbAgent agent = UserUtils.getUserProfile().getTbAgent();
                String agentName=UserUtils.getUserName();
		       /* if(agentName !=null){
		        	sql+="\ttbSimPDev d left join tbSimPPort p on d.keySimPDevID=p.idxSimPDevID where d.idxSimPDevGrpID in ( select keyID from tbSimPDevGrp where idxAgentID like '"+agentName+"%') \n" ;
*/              if(agentName !=null && !EUConst.ADMIN.equals(agentName)){
                    sql+="\ttbSimPDev d left join tbSimPPort p on d.keySimPDevID=p.idxSimPDevID where d.idxAgentID  like '"+agentName+"%' \n" ;

		        }else{
		        	sql+="\ttbSimPDev d left join tbSimPPort p on d.keySimPDevID=p.idxSimPDevID \n";
		        }
                sql+="group by d.keySimPDevID";
        return queryList(sql,SimPDevOfPortInfoVO.class);
    }


    /**
     * @return [{status:Integer,count:Integer}]
     */
    public List<StatusCountVO> querySimPDevStatusCount() {
        String sql = "select status,count(1) count from tbSimPDev group by status";
        return queryList(sql,StatusCountVO.class);
    }
    
    
    public List<TbSimPDevGrp> querySimpDevGroupList() {
    	String sql = "select keyID as keyID, groupName as groupName from tbSimPDevGrp";
    	return queryList(sql,TbSimPDevGrp.class);
    }
    
    public CommonOutlineInfoVO getOutlineInfo(){
        String uerName= UserUtils.getUserName();
        String sql="";
        if (null != uerName &&  !EUConst.ADMIN.equals(uerName)){
            sql = "SELECT (SELECT COUNT(DISTINCT idxSimPDevGrpID)  FROM  `tbSimPDev` WHERE idxAgentID='"+uerName+"') AS outlineInfo1," +//卡池组
                    "(SELECT COUNT(*)  FROM  `tbSimPDev` WHERE idxAgentID='"+uerName+"') AS outlineInfo2, " +//卡池设备
                    "(SELECT COUNT(*)  FROM  `tbSimPDev` WHERE `status`=0 and idxAgentID='"+uerName+"') AS outlineInfo3, " +//在线设备
                    "(SELECT COUNT(*)  FROM  `tbSimPDev` WHERE status = 1 and idxAgentID='"+uerName+"')  AS outlineInfo4, " +//离线设备
                    "(SELECT COUNT(*)  FROM  `tbSimPPort` WHERE idxAgentID='"+uerName+"') AS outlineInfo5, " +//插槽总数
                    "(SELECT COUNT(*)  FROM  `tbSimCard` WHERE `idxIccid`!='' and idxAgentID='"+uerName+"') AS outlineInfo6, " +//已插卡数
                    "(SELECT COUNT(*)  FROM  `tbSimCard` WHERE `idxIccid`!='' and `status`=1 and idxAgentID='"+uerName+"') AS outlineInfo7, "+//使用中
                    "(SELECT COUNT(*)  FROM  `tbSimCard` WHERE `idxIccid`!='' and `status`=3 and idxAgentID='"+uerName+"') AS outlineInfo8";//异常端口
            /*sql = "SELECT (SELECT COUNT(DISTINCT idxSimPDevGrpID) as outlineInfo1 FROM  `tbSimPDev` WHERE idxAgentID='"+uerName+"')," +//卡池组
                    "(SELECT COUNT(*) as outlineInfo2 FROM  `tbSimPDev` WHERE idxAgentID='"+uerName+"') , " +//卡池设备
                    "(SELECT COUNT(*) as outlineInfo3 FROM  `tbSimPDev` WHERE `status`=0 and idxAgentID='"+uerName+"'), " +//在线设备
                    "(SELECT COUNT(*) as outlineInfo4 FROM  `tbSimPDev` WHERE status = 1 and idxAgentID='"+uerName+"'), " +//离线设备
                    "(SELECT COUNT(*) as outlineInfo5 FROM  `tbSimPPort` WHERE idxAgentID='"+uerName+"'), " +//插槽总数
                    "(SELECT COUNT(*) as outlineInfo6 FROM  `tbSimCard` WHERE `idxIccid`!='' and idxAgentID='"+uerName+"') , " +//已插卡数
                    "(SELECT COUNT(*) as outlineInfo7 FROM  `tbSimCard` WHERE `idxIccid`!='' and `status`=1 and idxAgentID='"+uerName+"'), "+//使用中
                    "(SELECT COUNT(*) as outlineInfo8 FROM  `tbSimCard` WHERE `idxIccid`!='' and `status`=3 and idxAgentID='"+uerName+"');";//异常端口*/
        }else{
            sql = "SELECT (SELECT COUNT(DISTINCT idxSimPDevGrpID)  FROM  `tbSimPDev`) AS outlineInfo1," +//卡池组
                    "(SELECT COUNT(*)  FROM  `tbSimPDev`) AS outlineInfo2, " +//卡池设备
                    "(SELECT COUNT(*)  FROM  `tbSimPDev` WHERE `status`=0) AS outlineInfo3, " +//在线设备
                    "(SELECT COUNT(*)  FROM  `tbSimPDev` WHERE status = 1) AS outlineInfo4, " +//离线设备
                    "(SELECT COUNT(*)  FROM  `tbSimPPort`) AS outlineInfo5, " +//插槽总数
                    "(SELECT COUNT(*)  FROM  `tbSimCard` WHERE `idxIccid`!='') AS outlineInfo6, " +//已插卡数
                    "(SELECT COUNT(*)  FROM  `tbSimCard` WHERE `idxIccid`!='' and `status`=1) AS outlineInfo7, "+//使用中
                    "(SELECT COUNT(*)  FROM  `tbSimCard` WHERE `idxIccid`!='' and `status`=3) AS outlineInfo8";//异常端口
        }

    	List<CommonOutlineInfoVO> list = queryList(sql,CommonOutlineInfoVO.class);
		return (list!=null && list.size()>0)?list.get(0):new CommonOutlineInfoVO();
    }

    
}

       