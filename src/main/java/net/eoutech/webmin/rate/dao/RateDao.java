package net.eoutech.webmin.rate.dao;

import com.frame.dao.FrameBaseDao;
import net.eoutech.webmin.commons.entity.TbRate;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class RateDao extends FrameBaseDao {

    public Integer queryMaxKeyRateId() {
        String sql = "select max(keyRateID) from tbRate``";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }


    public List<Map<String, Object>> queryAllRate(String cols) {
        if (StringUtils.isNotBlank(cols)) {
            String sql = "select " + cols + " from tbRate";
            return jdbcTemplate.queryForList(sql);
        }
        return null;
    }

    /**
     * 把国家名放到实体的 remarks,
     * 待会用国家来分组,方便前端地图用国家来分类.
     * country,priceCallOnline,priceCallOffline,priceNET,dayDataPrice,remarks
     */
    public List<TbRate> queryAllRate() {
        String sql = "select a.countryName remarks,a.name country,r.priceCallOnline,r.priceCallOffline,r.priceNET,r.dayDataPrice\n" +
                "FROM\n" +
                "tbRate r JOIN tbArea a ON r.countryCode = a.keyAreaCode";
        return queryList(sql, TbRate.class);
    }


}
