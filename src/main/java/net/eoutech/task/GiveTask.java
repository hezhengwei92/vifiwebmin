package net.eoutech.task;

import com.frame.commons.utils.LogUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * Created by Administrator on 2016/11/16 0016.
 */
public class GiveTask {
//系统赠送流量
    @Autowired
    protected JdbcTemplate jdbcTemplate;
/*每天凌晨一点触发？？作用？*/
    public void begin(){
//        LogUtils.info("GiveTask begin, update tbusertopuprcd,tbresidualflow ...");
//        int inUid = inUid();
//        int inIdxPhone = inIdxPhone();
//        LogUtils.info("TimerTask end. " + inUid + "**********" + inIdxPhone);
    }
    //根据淘宝支持查用户ID
    private List<String> uid(){
        String sql = "SELECT idxUserID from tbtaobao where status='2' and givestatus='0'";
        List<String> list = jdbcTemplate.queryForList(sql, String.class);
        return list;
    }

    //根据淘宝支持查上家用户ID
    private List<String> idxPhone(){
        String sql = "SELECT idxPhoneNumber from tbuser where reqCodeMine = (SELECT reqCodeOther from tbuser \n" +
                "where idxPhoneNumber = (SELECT idxUserID from tbtaobao where status='2' and \n" +
                "givestatus='0'))";
        List<String> list = jdbcTemplate.queryForList(sql, String.class);
        return list;
    }

    //给用户送500M流量
    private int inUid(){
        List<String> uids = uid();
        int result = 0;
        int result1 = 0;
        String orderID = "";
        for (int i = 0; i < uids.size() ; i++) {
            orderID = createOrderID();
            String sql = "INSERT INTO tbusertopuprcd (idxOrderID,idxUserID,topupType,flow,amount,ipAddr,status,mdfBy,crtBy) values ('" + orderID + "','" + uids.get(i) + "','AGENT',500,0,'0','0','admin','admin')";
            String Sql = "INSERT INTO tbresidualflow (idxOrderID,idxUserID,residualflow,priority,pkgType,effectiveTm,crtTm,status) VALUES ('" + orderID + "','" + uids.get(i) + "',500,'1','1',DATE_ADD(NOW(), INTERVAL 1 YEAR),NOW(),'0')";
            result = jdbcTemplate.update(sql);
            result1 = jdbcTemplate.update(Sql);
        }
        return result + result1;
    }

    //给上家用户送500M流量
    private int inIdxPhone(){
        List<String> idxPhones = idxPhone();
        int result = 0;
        int result1 = 0;
        String orderID = "";
        if (idxPhones != null ){
            for (int i = 0; i < idxPhones.size() ; i++) {
                orderID = createOrderID();
                String sql = "INSERT INTO tbusertopuprcd (idxOrderID,idxUserID,topupType,flow,amount,ipAddr,status,mdfBy,crtBy) values ('" + orderID + "','" + idxPhones.get(i) + "','AGENT',500,0,'0','0','admin','admin')";
                String Sql = "INSERT INTO tbresidualflow (idxOrderID,idxUserID,residualflow,priority,pkgType,effectiveTm,crtTm,status) VALUES ('" + orderID + "','" + idxPhones.get(i) + "',500,'1','1',DATE_ADD(NOW(), INTERVAL 1 YEAR),NOW(),'0')";
                result = jdbcTemplate.update(sql);
                result1 = jdbcTemplate.update(Sql);
            }
        }
        return result + result1;
    }

    //生成订单号
    private String createOrderID () {
        StringBuffer sb = new StringBuffer("AYB");
        SimpleDateFormat sf = new SimpleDateFormat("yyMMddHHmmssSSS");
        sb.append( sf.format( new Date() ) );
        sb.append( buildRandomStr( 4 ) );
        return sb.toString();
    }

    public static String buildRandomStr(int length) {
        String base = "0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }
}
