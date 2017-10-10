package com.th.shiro;

import com.th.bean.User;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;


public class MyJdbcRealm extends AuthorizingRealm {

    /**
     *
     * @param authenticationToken 包含用户名及密码的令牌对象，是由Shiro传递过来的参数
     * @return
     * @throws AuthenticationException
     */
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String username = (String) authenticationToken.getPrincipal();
        String password = String.valueOf((char[]) authenticationToken.getCredentials());
        // User user = userService.getByNamePwd(username, password);
        //  通过调用jdbc的dao来查找用户信息
        // select u.name from t_user u where u.password = password and u.name = username
        User user = null;
        if (user != null) {
            return new SimpleAuthenticationInfo(authenticationToken.getPrincipal(), authenticationToken.getCredentials(), "myReam");
        }
        return null;
    }

    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String username = principalCollection.getPrimaryPrincipal().toString();
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        // select r.name from t_role r, t_user u, t_user_role ur where u.id = ur.user_id and r.id = ur.role_id and u.name = username
        //authorizationInfo.setRoles(CollectionUtils.listToSet(roleService.listRoles(username)));
        // select p.permission from t_permission p, t_user u, t_user_role ur, t_role_permission rp where u.id = ur.user_id and p.id = rp.permission_id and u.username = username
        //authorizationInfo.setStringPermissions(CollectionUtils.listToSet(permissionService.listPermissions(username)));
        return authorizationInfo;
    }
}
