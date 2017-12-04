package net.eoutech.webmin.vifi;

import com.frame.commons.entity.base.RestObject;
import commons.AdmBaseTest;
import net.eoutech.webmin.rate.ctrl.RateCtrl;
import org.testng.Assert;
import org.testng.annotations.Test;

/**
 * Created by Administrator on 2015/10/15.
 */
public class RateTest extends AdmBaseTest {
    RateCtrl rateCtrl = applicationContext.getBean( RateCtrl.class );

    public RateTest() {

    }
    /////////////////////////////////// Ctrl


    @Test
    public void importRateCsvToDbAjaxTest() {
        String data = "prefix,country code,country,price\n" +
                "880,880,BANGLADESH,193\n" +
                "8801,8801,BANGLADESH MOBILE,193\n" +
                "855,855,CAMBODIA,550\n" +
                "85571,85571,CAMBODIA MOBILE METFONE,550\n" +
                "85588,85588,CAMBODIA MOBILE METFONE,550\n" +
                "85597,85597,CAMBODIA MOBILE METFONE,550\n" +
                "91,91,INDIA,100";

        Assert.assertNotNull( rateCtrl );
        RestObject rest = rateCtrl.importRateCsvToDbAjax( data );
        System.out.println( rest.getMessage() );
        Assert.assertEquals( rest.getState(), 0 );
    }

    @Test
    public void exportRateCsvByDbAjaxTest() {



    }


}
