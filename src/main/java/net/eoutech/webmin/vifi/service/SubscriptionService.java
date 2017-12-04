
package net.eoutech.webmin.vifi.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbSubscription;
import net.eoutech.webmin.vifi.dao.SubscriptionDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class SubscriptionService extends FrameBaseService<TbSubscription> {

    @Autowired
    SubscriptionDao subscriptionDao;

    @Override
    public TbSubscription save(TbSubscription subscription, boolean isEdit, List<String> idList) {

//         subscription.setMdfTm(new Date());
//         subscription.setMdfBy(UserUtils.getUserName());
//         if (!isEdit) {
//             subscription.setCrtBy(subscription.getMdfBy());
//             subscription.setCrtTm(subscription.getMdfTm());
//         }

        return super.save(subscription, isEdit, idList);
    }

}

       