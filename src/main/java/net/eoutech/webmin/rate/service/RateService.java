package net.eoutech.webmin.rate.service;

import com.frame.commons.exceptions.FrameException;
import com.frame.commons.utils.DateUtils;
import com.frame.commons.utils.JsonUtils;
import com.frame.commons.utils.UserUtils;
import com.frame.service.FrameBaseService;
import com.github.underscore.$;
import com.github.underscore.Function1;
import com.spring.jdbc.assistants.persistence.Criteria;
import net.eoutech.webmin.commons.constant.EURateConst;
import net.eoutech.webmin.commons.entity.TbRate;
import net.eoutech.webmin.commons.utils.CSVUtils;
import net.eoutech.webmin.rate.dao.RateDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/8/6.
 */
@Service
public class RateService extends FrameBaseService<TbRate> {

    @Autowired
    RateDao rateDao;

    @Autowired
    AreaService areaService;


    @Override
    public Page<TbRate> query(int pageNumber, int pageSize, Map<String, Object> queryParam) {
        Criteria criteria = Criteria.create(getEntityClass());
        // 如果没有排序参数,就使用默认排序
        if (!hasOrderParam(queryParam)) {
            criteria.asc("idxCallPrefix");
        }
        return super.query(pageNumber, pageSize, queryParam, criteria);
    }

    @Override
    public TbRate save(TbRate rate, boolean isEdit, List<String> idList) {
        rate.setMdfTm(new Date());
        rate.setMdfBy(UserUtils.getUserName());
        rate.setCountry(areaService.getAreaName(rate.getCountryCode()));
        if (!isEdit) {
            rate.setCrtBy(rate.getMdfBy());
            rate.setCrtTm(rate.getMdfTm());

        }
        return super.save(rate, isEdit, idList);
    }


    public int queryMaxKeyRateId() {
        try {
            return rateDao.queryMaxKeyRateId();
        } catch (Exception e) {
            return 0;
        }
    }

    public int importRateCsvToDb(String csvStr) {
        List<List<String>> csvData = CSVUtils.csvToData(csvStr);
        Date nowDate = new Date();
        TbRate rate = new TbRate();
        rate.setRateMode(EURateConst.RATE_MODE_S);
        rate.setDirection(EURateConst.DIRECTION_BI);

        rate.setPriceCallbackGoIP(EURateConst.DEFAULT_PRICE);
        rate.setPriceCallbackOff(EURateConst.DEFAULT_PRICE);
        rate.setPriceCallGoIP(EURateConst.DEFAULT_PRICE);
        rate.setPriceCallOffline(EURateConst.DEFAULT_PRICE);
        rate.setPriceNET(EURateConst.DEFAULT_PRICE);
        rate.setPriceSMS(EURateConst.DEFAULT_PRICE);
        rate.setCrtTm(nowDate);
        rate.setCrtBy(UserUtils.getUserName());
        rate.setMdfTm(nowDate);
        rate.setMdfBy(UserUtils.getUserName());

        int maxKeyRateId = queryMaxKeyRateId();
        int addCount = 0, csvLine = 0;
        for (List<String> csvRow : csvData) {
            if (csvLine++ == 0 || csvRow.size() == 0) {
                continue;
            }
            try {

                rate.setKeyRateID(maxKeyRateId + addCount + 1);
                rate.setIdxCallPrefix(csvRow.get(0));
                rate.setCountryCode(csvRow.get(1));
                rate.setCountry(csvRow.get(2));
                rate.setPriceCallOnline(Integer.valueOf(csvRow.get(3)));

            } catch (Exception e) {
                throw new FrameException(String.format("rate data error : %s", JsonUtils.toJSONString(csvRow)));
            }


            jdbcDao.insert(rate);


            addCount++;
        }
        return addCount;
    }

    public String exportRateCsvByDb(String tbHead) {
        List<Map<String, Object>> rates = rateDao.queryAllRate(tbHead);
        List<List<Object>> csvRateData = new ArrayList<List<Object>>();
        for (Map<String, Object> rate : rates) {
            List<Object> rateData = new ArrayList<Object>();
            for (Object o : rate.values()) {
                o = o instanceof Date ? DateUtils.formatDate((Date) o) : o;
                rateData.add(o);
            }
            csvRateData.add(rateData);
        }
        return CSVUtils.dataToCsv(csvRateData);
    }


    // 地区名 分组 费率
    @SuppressWarnings("all")
    public Map<String, List<TbRate>> queryRateGroupByCountry() {
        return (Map) $.groupBy(rateDao.queryAllRate(), new Function1<TbRate, Object>() {
            @Override
            public Object apply(TbRate tbRate) {
                String countryName = tbRate.getRemarks();
                tbRate.setRemarks(null);
                return countryName;
            }
        });
    }

}
