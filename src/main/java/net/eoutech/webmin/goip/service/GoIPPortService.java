
package net.eoutech.webmin.goip.service;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbGoIPPort;
import net.eoutech.webmin.commons.vo.StatusCountVO;
import net.eoutech.webmin.goip.dao.GoIPPortDao;
import net.eoutech.webmin.goip.vo.GoIPDevOfPortInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class GoIPPortService extends FrameBaseService<TbGoIPPort> {

    @Autowired
    GoIPPortDao goIPPortDao;

    @Override
    public String getPermissions(String userName, String resources) {
        return EUConst.PERMISSION_Q;
    }

    @Override
    public TbGoIPPort save(TbGoIPPort goIPPort, boolean isEdit, List<String> idList) {

        goIPPort.setMdfTm(new Date());
        goIPPort.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            goIPPort.setCrtBy(goIPPort.getMdfBy());
            goIPPort.setCrtTm(goIPPort.getMdfTm());
        }

        return super.save(goIPPort, isEdit, idList);
    }


    private Map<String, Long> convStatusCount(List<Map<String, Object>> status) {
        Map<String, Long> statusMap = new HashMap<String, Long>();
        Long allCount = 0l;
        for (Map<String, Object> state : status) {
            String staKey = state.get("status") + "";
            Long count = (Long) state.get("count");
            statusMap.put(staKey, count);
            allCount += count;
        }
        statusMap.put("all", allCount);
        return statusMap;
    }


    public List<StatusCountVO> queryStatusCountByDevID(List devIdList) {
        return goIPPortDao.queryStatusCountByDevID(devIdList);
    }

    public List<GoIPDevOfPortInfoVO> queryGoIPPortInfoByDevID(String devID) {
        return goIPPortDao.queryGoIPPortInfoByDevID(devID);
    }

    @Override
    public JSONObject queryTbDetails() {
        JSONObject result = new JSONObject();
        result.put("statusCount", queryStatusCountByDevID(null));
        result.put("staDtlList", goIPPortDao.queryStaDtlByPortID(null));
        return result;
    }


    @Override
    public JSONObject queryMultiDetails(List<String> idList) {
        JSONObject result = new JSONObject();
        result.put("staDtlList", goIPPortDao.queryStaDtlByPortID(idList));

        List<Map<String, Object>> status = goIPPortDao.queryStatusCountByPortID(idList);
        result.put("statusCount", convStatusCount(status));
        return result;
    }


    public int queryCountByDevID(List<String> idList) {
        Criteria criteria = Criteria.create(getEntityClass());
        criteria.where("idxGoIPDevID", "in", idList.toArray());
        return jdbcDao.queryCount(criteria);
    }
}

       