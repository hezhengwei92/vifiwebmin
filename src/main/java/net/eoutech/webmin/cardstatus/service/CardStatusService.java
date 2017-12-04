package net.eoutech.webmin.cardstatus.service;

import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbCardStatus;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/10/15 0015.
 */
@Service
public class CardStatusService extends FrameBaseService<TbCardStatus> {

    @Override
    public TbCardStatus save(TbCardStatus tbCardStatus, boolean isEdit, List<String> idList) {

        tbCardStatus.setCrtTm(new Date());
        if (!isEdit) {
            tbCardStatus.setCrtTm(tbCardStatus.getCrtTm());
        }
        return super.save(tbCardStatus, isEdit, idList);
    }
}
