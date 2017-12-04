
package net.eoutech.webmin.simcart.service;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.commons.entity.TbSCGroup;
import net.eoutech.webmin.commons.entity.TbSimCard;
import net.eoutech.webmin.rate.service.AreaService;
import net.eoutech.webmin.rate.service.ISPService;
import net.eoutech.webmin.simcart.dao.SCGroupDao;
import net.eoutech.webmin.vifi.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class SCGroupService extends FrameBaseService<TbSCGroup> {

    @Autowired
    AreaService areaService;
    @Autowired
    SCGroupDao sCGroupDao;
    @Autowired
    SimCardService simCardService;
    @Autowired
    ISPService ispService;
    @Autowired
    SupplierService supplierService;

    @Override
    public TbSCGroup save(TbSCGroup sCGroup, boolean isEdit, List<String> idList) {

        sCGroup.setMdfTm(new Date());
        sCGroup.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            sCGroup.setCrtBy(sCGroup.getMdfBy());
            sCGroup.setCrtTm(sCGroup.getMdfTm());
            sCGroup.setNumber(0);
        }

        return super.save(sCGroup, isEdit, idList);
    }


    @Override
    public JSONObject querySingleDetails(String id) {
        JSONObject result = new JSONObject();
        result.put("sgDetails", sCGroupDao.querySingleDetails(id));
        return result;
    }

    @Override
    public JSONObject queryMultiDetails(List<String> idList) {
        List<Integer> intIdList = CommonUtils.listElTypeConvert(idList, Integer.class);

        JSONObject result = new JSONObject();
        List<TbSCGroup> scGroups = sCGroupDao.queryMultiDetails(intIdList);
        int simCardCount = simCardService.querySimCardCount();
        result.put("scGroups", scGroups);
        result.put("simCardCount", simCardCount);

        return result;
    }


    @Override
    public void delete(List<String> idList) {
        if (jdbcDao.queryCount(Criteria.create(TbSimCard.class).where("idxSCGroupID", "in", idList.toArray())) > 0) {
            String msg = CommonUtils.lang("frame.tips.error.sql.unable_delete");
            throw new FrameException(msg);
        }
        super.delete(idList);
    }

    /**
     * 获得组,select 控件数据
     */
    public List<String[]> getSCGroupSelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (TbSCGroup selData : queryAll()) {
            String value = String.format("%s-%s", selData.getKeySCGroupID(), selData.getGroupName());
            selDatas.add(new String[]{selData.getKeySCGroupID().toString(), value});
        }
        return selDatas;
    }

}

       