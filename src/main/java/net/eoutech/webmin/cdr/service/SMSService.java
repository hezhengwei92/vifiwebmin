package net.eoutech.webmin.cdr.service;

import com.frame.commons.constant.FrameConst;
import com.frame.commons.utils.DateUtils;
import com.frame.service.FrameBaseService;
import net.eoutech.webmin.cdr.dao.SMSDao;
import net.eoutech.webmin.commons.entity.TbSMS;
import net.eoutech.webmin.commons.entity.TbSMSGateway;
import net.eoutech.webmin.vifi.dao.SMSGatewayDao;
//import org.apache.commons.lang.StringUtils;
//import org.dom4j.Document;
//import org.dom4j.DocumentException;
//import org.dom4j.DocumentHelper;
//import org.dom4j.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
import java.util.*;

@Service
public class SMSService extends FrameBaseService<TbSMS> {

    

    @Autowired
    SMSDao sMSDao;
    @Autowired
    private SMSGatewayDao smsGatewayDao;

    /**
     * 操作许可
     * 0|0|0|0 对应,details|add|edit|delete , 0=许可,1=禁止
     *
     * @param userName
     * @param resources
     */
//    @Override
//    public String getPermissions(String userName, String resources) {
//        return EUConst.PERMISSION_Q;
//    }

    public Map< String, Integer > getSMSGatewayCount () {
        Map< String, Integer > map = new HashMap< String, Integer >();
        List<TbSMSGateway> list = smsGatewayDao.getAll();
        int normalSize = 0;
        int totalSucc = 0;
        int totalFail = 0;
        int smsGatewaySize = 0;
        if ( list != null && list.size() != 0) {
            smsGatewaySize = list.size();
            for ( TbSMSGateway gateway : list ) {
                if ( FrameConst.Status.TBSMSGATEWAY_STATE_NORMARL == gateway.getState() && gateway.getErrors() < 10 ) {
                    normalSize ++;
                }
                totalSucc += gateway.getTotalSucc();
                totalFail += gateway.getTotalFail();
            }
        }
        map.put( "normalSize", normalSize );
        map.put( "totalSucc", totalSucc );
        map.put( "totalFail", totalFail );
        map.put( "smsGatewaySize", smsGatewaySize );
        return map;
    }

    /**
     * 查询系统短信使用情况
     * @return
     */
    public Map< String, Integer > getSMSInfo () {
        Map< String, Integer > map = new HashMap< String, Integer >();

        return map;
    }

    /**
     * 查询emay短信网关剩余短信条数
     */
    public Integer queryEmaySMSCount () {
        Integer ret = 0;
//        String response = client.get( FrameConst.EmaySMSGateway.BASEURL + "?cdkey="+FrameConst.EmaySMSGateway.SN+"&password=" + FrameConst.EmaySMSGateway.KEY );
//        if ( !StringUtils.isEmpty( response ) ) {
//            response = response.trim();
//            ret = xmlResponse( response );
//        }
        return ret;
    }

//    // 统一解析格式
//    private Integer xmlResponse(String response) {
//        Document document = null;
//        try {
//            document = DocumentHelper.parseText(response);
//        } catch (DocumentException e) {
//            e.printStackTrace();
//        }
//        Element root = document.getRootElement();
//        String result = root.elementText("message");
//        return StringUtils.isEmpty( result ) ? 0 : Integer.parseInt( result.replace( ".","" ) );
//    }

    public Map< String, Integer > getSMSCountInfo () {
        Map< String, Integer > result = new HashMap< String, Integer >();
        int total = 0;
        int timeusedAvg = 0;

        //系统短信所有统计
        Map< String, Object > queryRes = sMSDao.smsCount();
        if ( queryRes != null && !queryRes.isEmpty() ) {
            total = ((Long)queryRes.get( "total" )).intValue();
            timeusedAvg =  ((BigDecimal)queryRes.get( "timeused" )).intValue() / total;
        }

        //按当日,当月统计
        Date date = new Date();
        Integer smsCountDaily = sMSDao.countByDate( DateUtils.thisDayFormat( date ) );
        Integer smsCountMonthly = sMSDao.countByDate( DateUtils.thisMonthFormat( date ) );

        result.put( "smsTotal", total );
        result.put( "smsTimeusedAvg", timeusedAvg );
        result.put( "smsCountDaily", smsCountDaily );
        result.put( "smsCountMonthly", smsCountMonthly );

        return result;

    }

    public List< Map< String, Object> > querySMSCountByType () {
        return sMSDao.querySMSCountByType();
    }

    public List< Map< String, Object> > queryDetails () {
        return sMSDao.queryDetails( 5 );
    }



    /**
     * 查询前N天数据的方法
     * @return
     */
    public List< Map< String, Object > > smsCountMonthInfo () {
        List< Map< String, Object > > result = new ArrayList< Map< String, Object > >(  );

        List< Map< String, Object > > queryList = sMSDao.smsCountMonthInfo();

        String myDates[] = DateUtils.beforeDaysFormat( 30 );
        for ( String date : myDates ) {
            Map< String, Object > one = new HashMap< String, Object >();
            Object value = 0;

            for ( Map< String, Object > map : queryList ) {
                String myDate = String.valueOf( map.get( "myDate" ) );
                if ( date.equals( myDate )) {
                    value = map.get( "num" );
                    break;
                }
            }

            one.put( "myDate", date );
            one.put( "num", value );
            result.add( one );

        }
        return result;
    }

}

       