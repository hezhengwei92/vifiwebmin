package net.eoutech.webmin.vpx.service;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.cdr.dao.CdrDao;
import net.eoutech.webmin.commons.entity.TbTrunk;
import net.eoutech.webmin.vpx.dao.TrunkDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2015/8/6.
 */
@Service
public class TrunkService extends FrameBaseService<TbTrunk> {
    @Autowired
    TrunkDao trunkDao;
    @Autowired
    CdrDao cdrDao;
    @Autowired
    OutboundRouteService outboundRouteService;

    @Override
    public TbTrunk save(TbTrunk trunk, boolean isEdit, List<String> idList) {

        trunk.setMdfTm(new Date());
        trunk.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            trunk.setCrtBy(trunk.getMdfBy());
            trunk.setCrtTm(trunk.getMdfTm());
        }

        return super.save(trunk, isEdit, idList);
    }

    public List<String[]> getTrunkSelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (TbTrunk tbTrunk : queryAll()) {
            String value = String.format("%s-%s", tbTrunk.getKeyTrunkID(), tbTrunk.getIdxTrunkName());
            selDatas.add(new String[]{tbTrunk.getKeyTrunkID() + "", value});
        }
        return selDatas;
    }



    @Override
    public void delete(List<String> idList) {
        if (outboundRouteService.queryIsExistByTrunkID(idList.toArray())) {
            String msg = CommonUtils.lang("frame.tips.error.sql.unable_delete") + CommonUtils.lang("menu.vpx_outboundRoute");
            throw new FrameException(msg);
        }
        super.delete(idList);
    }

    @Override
    public JSONObject querySingleDetails(String id) {
        JSONObject rest = new JSONObject();
        rest.put("todayFlow", cdrDao.queryTodayFlow());
        return rest;
    }
}
