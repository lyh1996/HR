package com.hr.email;
import javax.mail.*;

/**
 * 邮箱用户信息加密认证类
 * @author XX
 *
 */
public class MyAuthenticator extends Authenticator {
    
    String username = null;//用户名
    String password = null;//密码

    public MyAuthenticator() {
    }

    public MyAuthenticator(String username, String password) {
        this.username = username;
        this.password = password;
    }

    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(username, password);
    }
}