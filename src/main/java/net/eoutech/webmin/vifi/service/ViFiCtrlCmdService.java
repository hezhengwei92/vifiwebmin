package net.eoutech.webmin.vifi.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.entity.TbViFiCtrlCmd;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class ViFiCtrlCmdService extends FrameBaseService<TbViFiCtrlCmd> {


    @Override
    public TbViFiCtrlCmd save(TbViFiCtrlCmd ctrlCmd, boolean isEdit, List<String> idList) {

        ctrlCmd.setMdfTm(new Date());
        ctrlCmd.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            ctrlCmd.setCrtBy(ctrlCmd.getMdfBy());
            ctrlCmd.setCrtTm(ctrlCmd.getMdfTm());
        }

        return super.save(ctrlCmd, isEdit, idList);
    }

}
