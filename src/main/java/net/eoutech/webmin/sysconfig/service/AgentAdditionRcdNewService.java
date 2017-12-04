package net.eoutech.webmin.sysconfig.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbAgentAdditionRcd;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
@Service
public class AgentAdditionRcdNewService extends FrameBaseService<TbAgentAdditionRcd> {

    @Override
    public TbAgentAdditionRcd save(TbAgentAdditionRcd agentAdditionRcd, boolean isEdit, List<String> idList) {

        agentAdditionRcd.setMdfTm(new Date());
        agentAdditionRcd.setMdfBy(UserUtils.getUserName());
        if (!isEdit) {
            agentAdditionRcd.setCrtBy(agentAdditionRcd.getMdfBy());
            agentAdditionRcd.setCrtTm(agentAdditionRcd.getMdfTm());
        }

        return super.save(agentAdditionRcd, isEdit, idList);
    }

    @Override
    public String getPermissions(String userName, String resources) {
        return EUConst.PERMISSION_Q;
    }
}