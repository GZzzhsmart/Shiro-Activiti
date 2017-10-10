package com.th.aop;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
    public static void main(String[] args) {
        String path = "classpath:applicationContext-aop.xml"; 
        ApplicationContext ctx = new FileSystemXmlApplicationContext(path);  
        Monkey monkey = (Monkey) ctx.getBean("monkey");   
        Elephant elephant = (Elephant) ctx.getBean("elephant");
        try {   
//            monkey.lookPeaches("孙大圣的大徒弟");
            monkey.stealPeaches("孙大圣的大徒弟");
//            elephant.stealBanana("大鼻子");
        }   
        catch(Exception e) {}  
    }

}
