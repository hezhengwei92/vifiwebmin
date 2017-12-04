package net.eoutech.webmin;

import com.frame.commons.utils.HttpUtils;
import com.frame.commons.utils.JsonUtils;
import com.frame.commons.utils.ReflectUtils;
import commons.BaseTest;
import net.eoutech.webmin.commons.entity.TbUser;
import net.eoutech.webmin.commons.web.ActionAuditAop;
import net.eoutech.webmin.vpx.vo.OnlineUserViewVO;
import org.springframework.util.DigestUtils;
import org.testng.Assert;
import org.testng.annotations.Test;

import java.lang.reflect.Field;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Administrator on 2015/10/21.
 */
public class OtherTest extends BaseTest {

    @Test
    public void md5Test() {
        String md5 = DigestUtils.md5DigestAsHex("admin".getBytes());

        System.out.println(md5);
    }

    @Test
    public void packClassTest() {
        Set<Class<?>> cs = ReflectUtils.getClassesByPack("com.frame.commons.entity");
        Set<Class<?>> cs2 = ReflectUtils.getClassesByPack("net.eoutech.webmin.commons.entity");

        System.out.println(cs);
        System.out.println(cs2);
    }


    @Test
    public void getTbNameBySqlTest() {
        ActionAuditAop actionAuditAop = new ActionAuditAop();
        String sql = "insert into tbCfrmAccessRcd(idxType,idxDateTime,idxUserId,idxResourceId,ReqRemoteIP,ReqOS,ReqBrowser,ReqAction,ReqUrl,\tReqOperation,Result,Remarks) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        String iTbName = actionAuditAop.getTableName(sql, "I");
        Assert.assertEquals("tbCfrmAccessRcd", iTbName);

        sql = "UPDATE tbUser SET accountState = ?,appState = ?,credit = ?,crtBy = ?,crtTm = ?,idxAgentID = ?,idxAreaCode = ?,idxGoIPPortID = ?,idxPhoneNumber = ?,idxSimCardID = ?,idxSimpPortID = ?,idxVPXID = ?,idxVSWID = ?,idxViFiID = ?,keyUserID = ?,language = ?,lastAPPDevInfo = ?,lastAPPOnlineDate = ?,lastAPPPublicIP = ?,lastAPPVer = ?,lastViFiDate = ?,mdfBy = ?,mdfTm = ?,password = ?,remarks = ?,rewardBalance = ?,roamTimeZone = ?,sipExpire = ?,userBalance = ?,vifiState = ? WHERE keyUserID = ?";
        iTbName = actionAuditAop.getTableName(sql, "U");
        Assert.assertEquals("tbUser", iTbName);

        sql = "DELETE FROM tbAudit WHERE keyAdtID = ?";
        iTbName = actionAuditAop.getTableName(sql, "D");
        Assert.assertEquals("tbAudit", iTbName);
    }

    @Test
    public void getTbFiledsBySqlTest() {
        ActionAuditAop actionAuditAop = new ActionAuditAop();
        String sql = "insert into tbCfrmAccessRcd(idxType,idxDateTime,idxUserId,idxResourceId,ReqRemoteIP,ReqOS,ReqBrowser,ReqAction,ReqUrl,ReqOperation,Result,Remarks) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        Object[] params = JsonUtils.parseObject("[0,1445584607624,\"_EUROOT\",\"_EUROOT\",\"192.168.1.96\",\"\",\"\",\"Login\",\"/iFaxInAdmin/login.jsp\",\"\",1,\"\"]", Object[].class);
        String fileds = actionAuditAop.getTableFileds(sql, params, "I");
        JsonUtils.toStringPrint(fileds);
//        Assert.assertEquals( "idxType,idxDateTime,idxUserId,idxResourceId,ReqRemoteIP,ReqOS,ReqBrowser,ReqAction,ReqUrl,ReqOperation,Result,Remarks", fileds );

        sql = "UPDATE tbSupplier SET idxSupplierId = ?,mdfBy = ?,mdfTm = ?,name = ?,phoneNumber = ?,status = ?,supplierLevel = ? WHERE idxSupplierId = ?";
        params = JsonUtils.parseObject("[\"456\",\"_EUROOT\",1445583710000,\"456\",\"456\",456,456,\"456\"]", Object[].class);
        fileds = actionAuditAop.getTableFileds(sql, params, "U");
        // Assert.assertEquals( "tbUser", fileds );
        JsonUtils.toStringPrint(fileds);


    }

    @Test
    public void crSqlTest() {
        String sql = "DELETE FROM tbCfrmUser WHERE keyUserId = ?";
        Object[] params = JsonUtils.parseObject("[\"12\"]", Object[].class);
        ActionAuditAop actionAuditAop = new ActionAuditAop();
        String whereStr = actionAuditAop.getSqlConditionStr(sql, params, "I");
        System.out.println(whereStr);
    }

    @Test
    public void getTablePk() {
        String sql = "DELETE FROM tbCfrmUser WHERE keyUserId = ?";
        Object[] params = JsonUtils.parseObject("[\"12\"]", Object[].class);
        ActionAuditAop actionAuditAop = new ActionAuditAop();
        String whereStr = actionAuditAop.getSqlConditionStr(sql, params, "I");

        String[] pk = actionAuditAop.getTablePk("tbCfrmUser", "", whereStr, ActionAuditAop.ACTION_DELETE);
        JsonUtils.toStringPrint(pk);

    }

    @Test
    public void classEqTest() {
        System.out.println(Date.class);
    }

    @Test
    public void languageCfg() {
        Locale locale = new Locale("zh", "CN");
        System.out.println(locale.toString());
        System.out.println(locale.getCountry());
        System.out.println(locale.getDisplayLanguage());

    }

    @Test
    public void zz() {
        Matcher matcher = Pattern.compile("(http|https)://(.*?\\.com)").matcher("http://www.baidu.com?keyword=百度一下,http://www.qq.com");
        while (matcher.find()) {
            System.out.println(matcher.group(1));
            System.out.println(matcher.group(2));
        }

    }

    @Test
    public void httpRequest() throws Exception {

        String url = "http://www.1234i.com/";
        //  url = "http://www.baidu.com";
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("str", "113.87.169.255\r\n113.87.169.252");
        param.put("Submit", "%C5%FA%C1%BF%B2%E9IP");
        param.put("ipk", "b");
        String resutl = HttpUtils.doPostChartSet(url, param, "gb2312");


        Matcher matcher = Pattern.compile("(\\s|>)(.*?)#<font color=blue>(.*?)</font>(.*?)<br>").matcher(resutl);
        while (matcher.find()) {
            System.out.println(matcher.group(2));
            System.out.println(matcher.group(3));
            System.out.println(matcher.group(4));
        }


    }


    @Test
    public void jdbctmplate2() throws Exception {


        List<OnlineUserViewVO> user = testT(OnlineUserViewVO.class);
        System.out.println(user);

    }


    private <T> List<T> testT(Class<T> entityClass) throws Exception {

        List<Map<String, Object>> result = new ArrayList<>();
        Map<String, Object> entity = new HashMap<>();
        entity.put("ip", "127.0.0.1");
        entity.put("count2", 10L);
        result.add(entity);

        List<T> resutlObj = new ArrayList<>();
        for (Map<String, Object> stringObjectMap : result) {
            T t = entityClass.newInstance();
            resutlObj.add(t);
            for (String key : stringObjectMap.keySet()) {
                Field field = entityClass.getDeclaredField(key);
                field.setAccessible(true);// 调用private方法的关键一句话  //设置跳过访问检查.使之访问private域
                field.set(t, stringObjectMap.get(key)); //为属性赋值


            }
        }

        return resutlObj;
    }


    @Test
    public void testDate() throws Exception {
        Calendar cal = Calendar.getInstance();
        System.out.println(cal.get(Calendar.YEAR));

    }


    @Test
    public void testReflectEffi() throws Exception {
        StringBuilder users = new StringBuilder();
        TbUser tbUser;
        for (int i = 0; i < 1000000; i++) {
            tbUser = new TbUser();
            tbUser.setKeyUserID("1");
            users.append(tbUser.getKeyUserID());
        }
        System.out.println(users.length());
    }

    @Test
    public void testReflectEffi2() throws Exception {
        StringBuilder users = new StringBuilder();
        Field field = TbUser.class.getDeclaredField("keyUserID");
        field.setAccessible(true);
        TbUser tbUser;
        for (int i = 0; i < 1000000; i++) {
            tbUser = TbUser.class.newInstance();
            field.set(tbUser, "1");
            users.append(tbUser.getKeyUserID());
        }
        System.out.println(users.length());
    }



    @Test
    public void testExtend() {


    }


}
