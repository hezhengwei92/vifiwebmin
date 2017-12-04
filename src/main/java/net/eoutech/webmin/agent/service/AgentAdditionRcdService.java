
package net.eoutech.webmin.agent.service;

import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.commons.constant.EUConst;
import net.eoutech.webmin.commons.entity.TbAgentAdditionRcd;
import net.eoutech.webmin.agent.dao.AgentAdditionRcdDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class AgentAdditionRcdService extends FrameBaseService<TbAgentAdditionRcd> {

    @Autowired
    AgentAdditionRcdDao agentAdditionRcdDao;

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

       