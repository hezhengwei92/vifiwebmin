package net.eoutech.webmin.syslog.service;

import com.frame.service.FrameBaseService;
import com.frame.service.FrameUserService;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.commons.entity.TbAudit;
import net.eoutech.webmin.vifi.dao.AuditDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

@Service
public class AuditService extends FrameBaseService< TbAudit > {

    @Autowired
    AuditDao auditDao;


    /**
     * 操作许可
     * 0|0|0|0 对应,details|add|edit|delete , 0=许可,1=禁止
     */
    public String getPermissions( String userName, String resources ) {
        return "0|1|1|1|1";
    }


    @Override
    public Page<TbAudit> query(int pageNumber, int pageSize, Map<String, Object> queryParam) {
        Criteria criteria = Criteria.create(TbAudit.class).desc("keyAdtID");
        return super.query(pageNumber, pageSize, queryParam, criteria);
    }

    @Override
    public TbAudit save( TbAudit audit, boolean isEdit, List< String > idList ) {
        Timestamp date = new Timestamp( System.currentTimeMillis() );
        audit.setActionDate( date );

        TbAudit result = null;
        try {
            result = super.save( audit, isEdit, idList );
        } catch ( Exception e ) {
            e.printStackTrace();
        }
        return result;
    }

    public int insertAudit( TbAudit audit ) {
        return auditDao.insertAudit( audit );
    }

}
