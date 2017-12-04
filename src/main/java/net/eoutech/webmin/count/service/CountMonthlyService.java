
package net.eoutech.webmin.count.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbCountMonthly;
import net.eoutech.webmin.count.dao.CountMonthlyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CountMonthlyService extends FrameBaseService<TbCountMonthly> {

    @Autowired
    CountMonthlyDao countMonthlyDao;

    @Override
    public TbCountMonthly save(TbCountMonthly countMonthly, boolean isEdit, List<String> idList) {

        countMonthly.setMdfTm(new Date());
        countMonthly.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            countMonthly.setCrtBy(countMonthly.getMdfBy());
            countMonthly.setCrtTm(countMonthly.getMdfTm());
        }

        return super.save(countMonthly, isEdit, idList);
    }

    @Override
    public String getPermissions(String userName, String resources) {
        return EUConst.PERMISSION_Q;
    }
}

       