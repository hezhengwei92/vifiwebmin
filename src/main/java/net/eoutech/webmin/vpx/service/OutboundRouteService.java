
package net.eoutech.webmin.vpx.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.commons.entity.TbOutboundRoute;
import net.eoutech.webmin.vpx.dao.OutboundRouteDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class OutboundRouteService extends FrameBaseService<TbOutboundRoute> {

    @Autowired
    OutboundRouteDao outboundRouteDao;


    @Override
    public TbOutboundRoute save(TbOutboundRoute outboundRoute, boolean isEdit, List<String> idList) {

        outboundRoute.setMdfTm(new Date());
        outboundRoute.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            outboundRoute.setCrtBy(outboundRoute.getMdfBy());
            outboundRoute.setCrtTm(outboundRoute.getMdfTm());
        }

        return super.save(outboundRoute, isEdit, idList);
    }

    public boolean queryIsExistByTrunkID(Object[] idList) {
        Criteria criteria = Criteria.create(TbOutboundRoute.class).where("idxTrunkID", "in", idList);
        return jdbcDao.queryCount(criteria) > 0;
    }
}

       