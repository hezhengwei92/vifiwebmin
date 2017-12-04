
package net.eoutech.webmin.vifi.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbDomain;
import net.eoutech.webmin.vifi.dao.DomainDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class DomainService extends FrameBaseService<TbDomain> {

    @Autowired
    DomainDao domainDao;

    @Override
    public TbDomain save(TbDomain domain, boolean isEdit, List<String> idList) {

         domain.setMdfTm(new Date());
         domain.setMdfBy(UserUtils.getUserName());
         if (!isEdit) {
             domain.setCrtBy(domain.getMdfBy());
             domain.setCrtTm(domain.getMdfTm());
         }

        return super.save(domain, isEdit, idList);
    }

}

       