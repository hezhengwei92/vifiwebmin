package net.eoutech.webmin;

import com.frame.commons.utils.JsonUtils;
import com.github.underscore.$;
import com.github.underscore.Function1;
import commons.BaseTest;
import net.eoutech.webmin.commons.entity.TbUser;
import org.apache.commons.lang.ArrayUtils;
import org.testng.annotations.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/10/21.
 */
public class UnderscoreJavaTest extends BaseTest {

    @Test
    public void groupBy() {

        List list = Arrays.asList(1.1, 2.2, 3.3);
        list = JsonUtils.parseArray(JsonUtils.toJSONString($.range(50)));

        Map map = $.groupBy(list, new Function1<Integer, Integer>() {
            public Integer apply(Integer num) {
                return num/10;
            }
        });


        System.out.println(JsonUtils.toJSONString($.toArray(map.values())) );
        System.out.println(JsonUtils.toJSONString(map));
    }


    @Test
    public void Test1() {

        System.out.println( TbUser.class.getName() );
    }


}
