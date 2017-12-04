
package net.eoutech.webmin.vifi.dao;

import com.frame.dao.FrameBaseDao;
import net.eoutech.webmin.commons.entity.TbSMSGateway;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class SMSGatewayDao extends FrameBaseDao {

    public List<TbSMSGateway> getAll () {
        String sql = "select * from tbSMSGateway";
        return queryList( sql, TbSMSGateway.class );
    }

}

       