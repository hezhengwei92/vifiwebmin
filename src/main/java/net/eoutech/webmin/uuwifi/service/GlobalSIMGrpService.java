
package net.eoutech.webmin.uuwifi.service;

import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.CommonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbGlobalSIMGrp;
import net.eoutech.webmin.uuwifi.dao.GlobalSIMGrpDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class GlobalSIMGrpService extends FrameBaseService<TbGlobalSIMGrp> {

    @Autowired
    GlobalSIMGrpDao globalSIMGrpDao;
    @Autowired
    GlobalSIMService globalSIMService;

    @Override
    public TbGlobalSIMGrp save(TbGlobalSIMGrp globalSIMGrp, boolean isEdit, List<String> idList) {

        globalSIMGrp.setMdfTm(new Date());
        globalSIMGrp.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            globalSIMGrp.setCrtBy(globalSIMGrp.getMdfBy());
            globalSIMGrp.setCrtTm(globalSIMGrp.getMdfTm());
            globalSIMGrp.setAreaName("");
            globalSIMGrp.setIspName("");
            globalSIMGrp.setQryBalanceType("0");
        }

        return super.save(globalSIMGrp, isEdit, idList);
    }

    public List<String[]> getGlobalSIMGrpSelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (TbGlobalSIMGrp globalSIMGrp : queryAll()) {
            selDatas.add(new String[]{globalSIMGrp.getKeyGlobalSIMGrpID() + "", globalSIMGrp.getGroupName()});
        }
        return selDatas;
    }


    @Override
    public void delete(List<String> idList) {
        if (globalSIMService.queryCountByGrpID(idList) > 0) {
            String msg = CommonUtils.lang("frame.tips.error.sql.unable_delete");
            throw new FrameException(msg + CommonUtils.lang("menu.uuwifi_globalSIM"));
        }


        super.delete(idList);
    }
}

       