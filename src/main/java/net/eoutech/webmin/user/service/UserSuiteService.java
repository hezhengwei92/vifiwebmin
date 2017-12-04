
package net.eoutech.webmin.user.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbUserSuite;
import net.eoutech.webmin.user.dao.UserSuiteDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class UserSuiteService extends FrameBaseService<TbUserSuite> {

    @Autowired
    UserSuiteDao userSuiteDao;

    @Override
    public TbUserSuite save(TbUserSuite userSuite, boolean isEdit, List<String> idList) {

         userSuite.setMdfTm(new Date());
         userSuite.setMdfBy(UserUtils.getUserName());
         if (!isEdit) {
             userSuite.setCrtBy(userSuite.getMdfBy());
             userSuite.setCrtTm(userSuite.getMdfTm());
         }

        return super.save(userSuite, isEdit, idList);
    }

}

       