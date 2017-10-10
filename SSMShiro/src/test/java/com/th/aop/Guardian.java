package com.th.aop;

import org.aspectj.lang.annotation.AfterReturning;   
import org.aspectj.lang.annotation.Aspect;   
import org.aspectj.lang.annotation.Before;   
import org.aspectj.lang.annotation.Pointcut; 

@Aspect
public class Guardian {
    @Pointcut("execution(* steal*(..))")
    public void foundMonkey(){}   

    @Before(value="foundMonkey()")   
    public void foundBefore(){   
        System.out.println("【守护者】发现偷盗者正在进入果园...");   
    }   

    @AfterReturning("foundMonkey() && args(name,..)")   
    public void foundAfter(String name){   
        System.out.println("【守护者】抓住了偷盗者,守护者审问出了偷盗者的名字叫“"+name+"”...");   
    }   
}
