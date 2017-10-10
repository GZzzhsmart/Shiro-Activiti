package com.th.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

    @GetMapping("login_page")
    public String showLogin() {
        return "login";
    }

    @PostMapping("login")
    public String login(String name, String password) {
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(new UsernamePasswordToken(name, password));
            //获取用户会话信息
            Session sessionShiro = subject.getSession();
            sessionShiro.setAttribute("user",name);
//            PrincipalCollection collection = new SimplePrincipalCollection("username","a");
//            subject.runAs(collection);
//            subject.releaseRunAs();
            return "home";
        } catch (AuthenticationException e) {
            return "unauth";
        }

    }

    @GetMapping("home")
    public String homePage() {
        SecurityUtils.getSubject().getSession().getAttribute("user");
        return "home";
    }

    @GetMapping("logout")
    public String logout() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "home";
    }

}
