package net.eoutech.webmin.redeem.service;

import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbRedeem;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by wei on 2017/9/20.
 */
@Service
public class RedeemService extends FrameBaseService<TbRedeem> {


    public TbRedeem save(TbRedeem tbRedeem, boolean isEdit, List<String> idList) {

        if (!isEdit) {
            tbRedeem.setCrtTm(new Date());
        }

        return super.save(tbRedeem, isEdit, idList);
    }


}
