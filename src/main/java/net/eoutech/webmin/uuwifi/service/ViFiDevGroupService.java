
package net.eoutech.webmin.uuwifi.service;

import com.alibaba.fastjson.JSONObject;
import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbViFiDevGroup;
import net.eoutech.webmin.uuwifi.dao.ViFiDevGroupDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ViFiDevGroupService extends FrameBaseService<TbViFiDevGroup> {

    @Autowired
    ViFiDevGroupDao viFiDevGroupDao;
    @Autowired
    ViFiDeviceService viFiDeviceService;

    @Override
    public TbViFiDevGroup save(TbViFiDevGroup viFiDevGroup, boolean isEdit, List<String> idList) {

        viFiDevGroup.setMdfTm(new Date());
        viFiDevGroup.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            viFiDevGroup.setCrtBy(viFiDevGroup.getMdfBy());
            viFiDevGroup.setCrtTm(viFiDevGroup.getMdfTm());
        }

        return super.save(viFiDevGroup, isEdit, idList);
    }

    @Override
    public void delete(List<String> idList) {

        if (viFiDeviceService.queryCountByGrpID(idList) > 0) {
            String msg = CommonUtils.lang("frame.tips.error.sql.unable_delete");
            throw new FrameException(msg + CommonUtils.lang("menu.uuwifi_viFiDevice"));
        }
        super.delete(idList);
    }

    @Override
    public JSONObject querySingleDetails(String id) {
        JSONObject rest = new JSONObject();
        rest.put("devState", viFiDeviceService.queryStateByGrpID(id));
        return rest;
    }

    public List<String[]> getDevGroupSelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (TbViFiDevGroup devGroup : queryAll()) {
            selDatas.add(new String[]{devGroup.getKeyDevGrpID(), devGroup.getName()});
        }
        return selDatas;
    }

    public List<String[]> getDevGroup1SelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (TbViFiDevGroup devGroup : queryAll()) {
            selDatas.add(new String[]{devGroup.getKeyDevGrpID(), devGroup.getHardwareVer()});
        }
        return selDatas;
    }

    public List<String[]> getDevGroup2SelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (TbViFiDevGroup devGroup : queryAll()) {
            selDatas.add(new String[]{devGroup.getKeyDevGrpID(), devGroup.getFirmwareVer()});
        }
        return selDatas;
    }

    public List<String[]> getDevGroup3SelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (TbViFiDevGroup devGroup : queryAll()) {
            selDatas.add(new String[]{devGroup.getKeyDevGrpID(), devGroup.getSoftwareVer()});
        }
        return selDatas;
    }
}

       