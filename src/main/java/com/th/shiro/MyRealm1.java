package com.th.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.realm.AuthenticatingRealm;

public class MyRealm1 extends AuthenticatingRealm {
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String username = (String) authenticationToken.getPrincipal();
        String password = String.valueOf((char[]) authenticationToken.getCredentials());
        // userService.getByNamePwd(username, password), 如果返回了对象，则说明数据库里有此用户，则返回SimpleAuthenticationInfo对象
        // 返回的null，说明数据库中没有此用户，则返回null，认证失败
        if ("admin".equals(username) && "admin".equals(password)) {
            return new SimpleAuthenticationInfo(authenticationToken.getPrincipal(), authenticationToken.getCredentials(), "myReam");
        }
        return null;
    }
}
