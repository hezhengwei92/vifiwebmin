
package net.eoutech.webmin.vpx.service;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.commons.entity.TbCDR;
import net.eoutech.webmin.commons.entity.TbTrunk;
import net.eoutech.webmin.commons.entity.TbUser;
import net.eoutech.webmin.commons.entity.TbVPX;
import net.eoutech.webmin.vpx.dao.VPXDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class VPXService extends FrameBaseService<TbVPX> {

    @Autowired
    VPXDao vPXDao;
    @Autowired
    TrunkService trunkService;

    @Override
    public TbVPX save(TbVPX vPX, boolean isEdit, List<String> idList) {

        vPX.setMdfTm(new Date());
        vPX.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
        	if("".equals(vPX.getCPU()) || vPX.getCPU()==null){
        		vPX.setCPU("inter");
        	}
        	if("".equals(vPX.getMEM()) || vPX.getMEM()==null){
        		vPX.setMEM(0);
        	}
        	if("".equals(vPX.getHARDDISK()) || vPX.getHARDDISK()==null){
        		vPX.setHARDDISK(1000);
        	}
        	if("".equals(vPX.getPowerDate()) || vPX.getPowerDate()==null){
        		vPX.setPowerDate(new Date());
        	}
            vPX.setCrtBy(vPX.getMdfBy());
            vPX.setCrtTm(vPX.getMdfTm());
            vPX.setDiskUsage(0);
        }

        return super.save(vPX, isEdit, idList);
    }

    public List<String[]> getVPXSelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (TbVPX selData : queryAll()) {
            selDatas.add(new String[]{selData.getKeyVPXID(), selData.getKeyVPXID()});
        }
        return selDatas;
    }

    @Override
    public JSONObject queryTbDetails() {
        JSONObject res = new JSONObject();
        res.put("stateStatis", vPXDao.queryStateStatisByID(null));
        return res;
    }

    @Override
    public JSONObject queryMultiDetails(List<String> idList) {
        JSONObject res = new JSONObject();
        res.put("stateStatis", vPXDao.queryStateStatisByID(idList));
        return res;
    }

    @Override
    public void delete(List<String> idList) {
        String msg = CommonUtils.lang("frame.tips.error.sql.unable_delete");
        if (jdbcDao.queryCount(Criteria.create(TbTrunk.class).where("VPXID", "in", idList.toArray())) > 0) {
            throw new FrameException(msg + CommonUtils.lang("menu.vpx_trunk"));
        } else if (jdbcDao.queryCount(Criteria.create(TbCDR.class).where("idxVPXID", "in", idList.toArray())) > 0) {
            throw new FrameException(msg + CommonUtils.lang("menu.cdr_cdr"));
        } else if (jdbcDao.queryCount(Criteria.create(TbUser.class).where("idxVPXID", "in", idList.toArray())) > 0) {
            throw new FrameException(msg + CommonUtils.lang("menu.user_user"));
        }

        super.delete(idList);
    }
}

       