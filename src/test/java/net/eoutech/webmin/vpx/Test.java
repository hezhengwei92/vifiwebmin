package net.eoutech.webmin.vpx;

import net.eoutech.webmin.commons.entity.TbUser;

import java.lang.reflect.Field;


public class Test {


    public static void main( String[] args ) {

        Field[] fields = TbUser.class.getDeclaredFields(); // 获取实体类的所有属性，返回Field数组
        for ( Field field : fields ) {
            System.out.println( field.getName()  );
        }
        System.out.println( TbUser.class.getSimpleName());

    }
}
