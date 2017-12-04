
package net.eoutech.webmin.user.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.commons.entity.TbDailyRental;
import net.eoutech.webmin.commons.entity.TbRewardRcd;
import net.eoutech.webmin.user.dao.DailyRentalDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class DailyRentalService extends FrameBaseService<TbDailyRental> {

    @Autowired
    DailyRentalDao dailyRentalDao;

    @Override
    public Page<TbDailyRental> query(int pageNumber, int pageSize, Map<String, Object> queryParam) {
        Criteria criteria = Criteria.create(getEntityClass());
        // 如果没有排序参数,就使用默认排序
        if ( !hasOrderParam(queryParam) ){
            criteria.desc("startDate");
        }
        return super.query(pageNumber, pageSize, queryParam, criteria);
    }



    @Override
    public TbDailyRental save(TbDailyRental dailyRental, boolean isEdit, List<String> idList) {

         dailyRental.setMdfTm(new Date());
         dailyRental.setMdfBy(UserUtils.getUserName());
         if (!isEdit) {
             dailyRental.setCrtBy(dailyRental.getMdfBy());
             dailyRental.setCrtTm(dailyRental.getMdfTm());
         }

        return super.save(dailyRental, isEdit, idList);
    }

}

       