package com.th.aop;

public class Monkey {
    public void stealPeaches(String name){
        System.out.println("【猴子】"+name+"正在偷桃...");   
    }

    public void lookPeaches(String name){
        System.out.println("【猴子】"+name+"不敢偷桃子，只是去看一下...");   
    }
}
