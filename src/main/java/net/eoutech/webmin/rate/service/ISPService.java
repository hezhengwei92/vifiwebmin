package net.eoutech.webmin.rate.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbISP;
import net.eoutech.webmin.rate.dao.ISPDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ISPService extends FrameBaseService<TbISP> {

    @Autowired
    ISPDao iSPDao;

    @Override
    public TbISP save(TbISP iSP, boolean isEdit, List<String> idList) {

        iSP.setMdfTm(new Date());
        iSP.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            iSP.setCrtBy(iSP.getMdfBy());
            iSP.setCrtTm(iSP.getMdfTm());
        }

        return super.save(iSP, isEdit, idList);
    }


    /**
     * 获得运营商,select 控件数据
     */
    public List<String[]> getISPSelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (TbISP tbISP : queryAll()) {
            String value = String.format("%s-%s", tbISP.getKeyISPID(), tbISP.getIspName());
            selDatas.add(new String[]{tbISP.getKeyISPID().toString(), value, tbISP.getAreaCode()});
        }
        return selDatas;
    }

    /**
     * 获得运营商的名称,select 控件数据
     */
    public List<String[]> getISPSelDataOfName() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (TbISP tbISP : queryAll()) {
            String value = String.format("%s-%s", tbISP.getKeyISPID(), tbISP.getIspName());
            selDatas.add(new String[]{tbISP.getIspName(), value, tbISP.getAreaCode()});
        }
        return selDatas;
    }


}

       