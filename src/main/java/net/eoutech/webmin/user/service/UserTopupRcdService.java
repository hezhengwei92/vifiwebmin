
package net.eoutech.webmin.user.service;

import com.frame.commons.utils.DateUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbUserTopupRcd;
import net.eoutech.webmin.commons.utils.CSVUtils;
import net.eoutech.webmin.user.dao.UserTopupRcdDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class UserTopupRcdService extends FrameBaseService<TbUserTopupRcd> {

    @Autowired
    UserTopupRcdDao userTopupRcdDao;

    @Override
    public TbUserTopupRcd save(TbUserTopupRcd userTopupRcd, boolean isEdit, List<String> idList) {

         userTopupRcd.setMdfTm(new Date());
         userTopupRcd.setMdfBy(UserUtils.getUserName());
         if (!isEdit) {
             userTopupRcd.setCrtBy(userTopupRcd.getMdfBy());
             userTopupRcd.setCrtTm(userTopupRcd.getMdfTm());
         }

        return super.save(userTopupRcd, isEdit, idList);
    }


    @Override
    public String getPermissions(String userName, String resources) {
        return EUConst.PERMISSION_Q;
    }
    
    public List<TbUserTopupRcd> recentTopupRcd(){
    	return userTopupRcdDao.getRencentTopupRcd();
    }

    public String exportUserCsvByDb(String tbHead) {
        List<Map<String, Object>> payRecord = userTopupRcdDao.queryAllPayRecord(tbHead);
        List<List<Object>> csvRateData = new ArrayList<List<Object>>();
        for (Map<String, Object> rate : payRecord) {
            List<Object> rateData = new ArrayList<Object>();
            for (Object o : rate.values()) {
                o = o instanceof Date ? DateUtils.formatDate((Date) o) : o;
                rateData.add(o);
            }
            csvRateData.add(rateData);
        }
        return CSVUtils.dataToCsv(csvRateData);
    }
}

       