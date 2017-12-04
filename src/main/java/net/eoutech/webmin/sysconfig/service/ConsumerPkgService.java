package net.eoutech.webmin.sysconfig.service;

import java.util.Date;
import java.util.List;
import net.eoutech.webmin.commons.entity.TbConsumerPackage;
import org.springframework.stereotype.Service;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;

@Service
public class ConsumerPkgService extends FrameBaseService<TbConsumerPackage> {

    @Override
    public TbConsumerPackage save(TbConsumerPackage consumerPackage, boolean isEdit, List<String> idList) {

    	consumerPackage.setMdfTm(new Date());
    	consumerPackage.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
        	consumerPackage.setCrtBy(consumerPackage.getMdfBy());
        	consumerPackage.setCrtTm(consumerPackage.getMdfTm());
            consumerPackage.setIdxCountryCode("86");
            if (consumerPackage.getRemarks()!=null){
                consumerPackage.setRemarks(consumerPackage.getRemarks());
            }else{
                consumerPackage.setRemarks("");
            }
        }
        return super.save(consumerPackage, isEdit, idList);
    }
}