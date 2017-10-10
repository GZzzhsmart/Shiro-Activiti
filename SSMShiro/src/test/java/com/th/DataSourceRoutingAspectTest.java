package com.th;

import com.th.service.SlaveService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class DataSourceRoutingAspectTest {

    @Autowired
    private SlaveService slaveService;

    @Test
    public void testFindAllShop() {
        Integer count = slaveService.count();
        System.out.println(count);
    }
}

