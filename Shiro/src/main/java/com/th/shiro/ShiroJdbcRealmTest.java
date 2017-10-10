package com.th.shiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.permission.WildcardPermission;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;

/**
 * shiro-jdbcrealm.ini
 */
public class ShiroJdbcRealmTest {

    public static void main(String[] args) {
        Factory<org.apache.shiro.mgt.SecurityManager> factory = new IniSecurityManagerFactory("classpath:shiro-jdbcrealm.ini");
        org.apache.shiro.mgt.SecurityManager securityManager = factory.getInstance();
        SecurityUtils.setSecurityManager(securityManager);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(new UsernamePasswordToken("test1", "123456")); // 身份认证
            System.out.println("登录成功！");
            System.out.println(subject.getPrincipal().toString());

            System.out.println(subject.hasRole("role1"));

            System.out.println("permission check: " + subject.isPermitted("permission1"));

            subject.logout(); // 退出登录
        } catch (UnknownAccountException e) {
            // 未知的账户异常
            System.out.println("不存在此账户");
            e.printStackTrace();
        } catch (IncorrectCredentialsException e) {
            System.out.println("密码错误");
            e.printStackTrace();
        } catch (AuthenticationException e) {
            // 认证异常
            System.out.println("账户名或密码有误");
            e.printStackTrace();
        }
    }

}
