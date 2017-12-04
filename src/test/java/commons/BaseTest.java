package commons;

import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;

/**
 * Created by Administrator on 2015/10/15.
 */
public class BaseTest {
    long beginTime = 0;

    @BeforeMethod
    public void runBegin() {
        beginTime = System.currentTimeMillis();
    }

    @AfterMethod
    public void runEnd() {
        System.out.println( "run time: " + ( System.currentTimeMillis() - beginTime ) );
    }


}
