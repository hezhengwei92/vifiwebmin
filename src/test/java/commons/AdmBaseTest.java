package commons;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by Administrator on 2015/10/15.
 */
public class AdmBaseTest {
    protected ApplicationContext applicationContext = null;
    static class GetApplicationContect {
        public static ApplicationContext applicationContext = new ClassPathXmlApplicationContext( "applicationContext.xml" );
    }


    public AdmBaseTest() {
        applicationContext = GetApplicationContect.applicationContext;
    }

}
