package net.eoutech.webmin.sysconfig.service;


import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbAgentDeductionRcd;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class AgentDeductionRcdNewService extends FrameBaseService<TbAgentDeductionRcd> {

    @Override
    public TbAgentDeductionRcd save(TbAgentDeductionRcd agentDeductionRcd, boolean isEdit, List<String> idList) {

        agentDeductionRcd.setMdfTm(new Date());
        agentDeductionRcd.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            agentDeductionRcd.setCrtBy(agentDeductionRcd.getMdfBy());
            agentDeductionRcd.setCrtTm(agentDeductionRcd.getMdfTm());
        }

        return super.save(agentDeductionRcd, isEdit, idList);
    }

    @Override
    public String getPermissions(String userName, String resources) {

        return EUConst.PERMISSION_Q;
    }

}