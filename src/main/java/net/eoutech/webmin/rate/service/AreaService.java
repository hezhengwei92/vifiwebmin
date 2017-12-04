
package net.eoutech.webmin.rate.service;

import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.DateUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.agent.dao.AreaDao;
import net.eoutech.webmin.commons.entity.TbArea;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class AreaService extends FrameBaseService<TbArea> {

    @Autowired
    AreaDao areaDao;


    @Override
    public TbArea save(TbArea area, boolean isEdit, List<String> idList) {

        area.setMdfTm(new Date());
        area.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            area.setCrtBy(area.getMdfBy());
            area.setCrtTm(area.getMdfTm());
            area.setTotalNumber(0);
            area.setRemarks("");
            area.setSupport("");
        }

        return super.save(area, isEdit, idList);
    }


    @Override
    public void delete(List<String> idList) {

        if (idList.size() > 1) {
            throw new FrameException("测试" + DateUtils.formatDate());
        }

        super.delete(idList);
    }

    public String getAreaName(String code) {
        TbArea area = get(code);
        return area == null ? null : area.getName();
    }


    /**
     * 获得区域,select 控件数据
     */
    public List<String[]> getAreaSelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (TbArea tbArea : queryAll()) {
            String value = String.format("%s-%s-%s", tbArea.getKeyAreaCode(), tbArea.getCountryName(), tbArea.getLocalName());
            selDatas.add(new String[]{tbArea.getKeyAreaCode(), value, tbArea.getContinent()});
        }
        return selDatas;
    }

    public List<String[]> getAreaLangSelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (Map<String, String> lang : areaDao.queryLanguage()) {
            selDatas.add(new String[]{lang.get("language"), lang.get("language")});
        }
        return selDatas;
    }

    public List<String[]> getAreaCurrencySelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (Map<String, String> curr : areaDao.queryCurrency()) {
            selDatas.add(new String[]{curr.get("currency"), curr.get("currency")});
        }
        return selDatas;
    }

    public List<String[]> getAreaTimeZoneSelData() {
        List<String[]> selDatas = new ArrayList<String[]>();
        for (Map<String, Integer> timeZone : areaDao.queryTimeZone()) {
            String tz = String.valueOf(timeZone.get("timeZone"));
            selDatas.add(new String[]{tz, tz});
        }
        return selDatas;
    }
}


       