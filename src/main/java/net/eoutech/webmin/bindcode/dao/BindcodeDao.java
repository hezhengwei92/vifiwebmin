package net.eoutech.webmin.bindcode.dao;

import com.frame.dao.FrameBaseDao;
import net.eoutech.webmin.commons.entity.TbBindcode;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.stereotype.Component;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Administrator on 2016/11/10 0010.
 */
@Component
public class BindcodeDao extends FrameBaseDao{
    // 批量插入,
    public List<TbBindcode> saveOrUpdateAll(final List<TbBindcode> list) {
        jdbcTemplate.batchUpdate(
                "insert into tbBindcode (dataSize,code,status,respType,month) values (?,?,?,?,?)",
                new BatchPreparedStatementSetter() {
                    @Override
                    public void setValues(PreparedStatement ps, int i)
                            throws SQLException {
                        ps.setInt(1, list.get(i).getDataSize());
                        ps.setString(2, list.get(i).getCode());
                        ps.setString(3,list.get(i).getStatus());
                        ps.setString(4,list.get(i).getRespType());
                        ps.setInt(5,list.get(i).getMonth());
                    }

                    @Override
                    public int getBatchSize() {
                        return list.size();
                    }
                });
        return list;
    }
}
