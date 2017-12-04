
package net.eoutech.webmin.uuwifi.service;

import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.commons.entity.TbGlobalSIM;
import net.eoutech.webmin.commons.vo.StatusCountVO;
import net.eoutech.webmin.uuwifi.dao.GlobalSIMDao;
import net.eoutech.webmin.uuwifi.vo.IdxViFiIDVO;
import net.eoutech.webmin.uuwifi.vo.SIMAndSIMgrpVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class GlobalSIMService extends FrameBaseService<TbGlobalSIM> {

    @Autowired
    GlobalSIMDao globalSIMDao;

    @Override
    public TbGlobalSIM save(TbGlobalSIM globalSIM, boolean isEdit, List<String> idList) {

        globalSIM.setMdfTm(new Date());
        globalSIM.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            globalSIM.setCrtBy(globalSIM.getMdfBy());
            globalSIM.setCrtTm(globalSIM.getMdfTm());
            globalSIM.setLastQryDate(new Date());
            globalSIM.setIccid("");
            globalSIM.setNetData(0);
            globalSIM.setImsi("");
            globalSIM.setImei("");
        }

        return super.save(globalSIM, isEdit, idList);
    }


    public int queryCountByGrpID(List<String> listGrpID) {
        Criteria criteria = Criteria.create(TbGlobalSIM.class).where("idxGlobalSIMGrpID", " in ", listGrpID.toArray());
        return jdbcDao.queryCount(criteria);

    }

    // [0] 正常状态数量,[1]非正常其他状态数量
    public List<Integer> queryGlobDevState() {
        int normal = 0, other = 0;
        for (StatusCountVO countVO : globalSIMDao.queryGlobDevState()) {
            if (countVO.getStatus().equals("0")) {
                normal = countVO.getCount();
            } else {
                other += countVO.getCount();
            }
        }
        return Arrays.asList(normal, other);
    }
    
    //查询可用的uuwifiID idxViFiID
    public List<IdxViFiIDVO> queryIdxViFiID(){
    	return globalSIMDao.queryIdxViFiID();
    }
    
    /**
     * 流量使用top10
     * @return
     */
    public List<SIMAndSIMgrpVO> queryFlowTop10(){
    	return globalSIMDao.queryFlowTop();
    }
    
    //统计启动卡和启动卡组表
    public List<SIMAndSIMgrpVO> selectCount(){
    	return globalSIMDao.selectCount();
    }

    /**
     * 查询启动卡相关信息
     * @return
     */
	public List<SIMAndSIMgrpVO> selectSimInfo() {
		// TODO Auto-generated method stub
		return globalSIMDao.selectSimInfo();
	}


	public List<SIMAndSIMgrpVO> queryRecentCharge() {
		// TODO Auto-generated method stub
		return globalSIMDao.queryRecentCharge();
	}


}

       