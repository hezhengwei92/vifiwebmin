package net.eoutech.webmin.residualflow.service;

import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbResidualflow;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/10/15 0015.
 */
@Service
public class ResidualflowService extends FrameBaseService<TbResidualflow> {

    @Override
    public TbResidualflow save(TbResidualflow tbResidualflow, boolean isEdit, List<String> idList) {
        tbResidualflow.setEffectiveTm(new Date());
        if (!isEdit) {
            tbResidualflow.setCrtTm(tbResidualflow.getEffectiveTm());
        }
        return super.save(tbResidualflow, isEdit, idList);
    }
}
