package net.eoutech.webmin.vifi.dao;

import com.frame.dao.FrameBaseDao;
import net.eoutech.webmin.commons.entity.TbAudit;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.*;
import org.springframework.stereotype.Component;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by Administrator on 2015/8/6.
 */
@Component
public class AuditDao extends FrameBaseDao {


    public int insertAudit( TbAudit audit ) {
        String sql = "INSERT INTO `tbAudit` (`idxActionUser`, `userType`, `userIP`, `actionDate`, `idxTableName`, `tbKeyName`, `idxTbKeyValue`, `action`, `fields`, `condition`, `result`, `beforeValues`, `afterValues`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Object[] params = new Object[13];
        params[0] = audit.getIdxActionUser();
        params[1] = audit.getUserType();
        params[2] = audit.getUserIP();
        params[3] = audit.getActionDate();
        params[4] = audit.getIdxTableName();
        params[5] = audit.getTbKeyName();
        params[6] = audit.getIdxTbKeyValue();
        params[7] = audit.getAction();
        params[8] = audit.getFields();
        params[9] = audit.getCondition();
        params[10] = audit.getResult();
        params[11] = audit.getBeforeValues();
        params[12] = audit.getAfterValues();
        return update( sql, params );
    }

    /**
     * 因为,jdbcTemplate update 被Aop 环绕用来记录审计,,
     * 所以这里,从jdbcTemplate里抠出update方法,
     */
    protected int update( final String sql, Object... args ) throws DataAccessException {
        final PreparedStatementSetter pss = new ArgumentPreparedStatementSetter( args );
        final PreparedStatementCreator psc = ( new PreparedStatementCreator() {
            public PreparedStatement createPreparedStatement( Connection con ) throws SQLException {
                return con.prepareStatement( sql );
            }
        } );
        return ( ( Integer ) jdbcTemplate.execute( psc, new PreparedStatementCallback() {
            public Integer doInPreparedStatement( PreparedStatement ps ) throws SQLException {
                Integer var3;
                try {
                    if ( pss != null ) {
                        pss.setValues( ps );
                    }
                    int rows = ps.executeUpdate();
                    var3 = Integer.valueOf( rows );
                } finally {
                    if ( pss instanceof ParameterDisposer ) {
                        ( ( ParameterDisposer ) pss ).cleanupParameters();
                    }
                }
                return var3;
            }
        } ) ).intValue();
    }

}
