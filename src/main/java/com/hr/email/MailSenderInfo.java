package com.hr.email;

import java.util.Properties;

/**
 * 发送邮件需要使用的基本信息
 * @author XX
 *
 */
public class MailSenderInfo 
{
    private String mailServerHost;//发送邮件的服务器的IP
    private String mailServerPort = "25";//发送邮件的服务器的端口
    private String fromAddress;// 邮件发送者的地址
    private String toAddress;// 邮件接收者的地址
    private String username;// 登陆邮件发送服务器的用户名
    private String password;// 登陆邮件发送服务器的密码
    private boolean validate = false;// 是否需要身份验证
    private String subject;// 邮件主题
    private String content;// 邮件的文本内容
    private String[] attachFileNames;// 邮件附件的文件名

    /**
     * 获得邮件会话属性
     */
    public Properties getProperties() {
        Properties p = new Properties();
        p.put("mail.smtp.host", this.mailServerHost);
        p.put("mail.smtp.port", this.mailServerPort);
        p.put("mail.smtp.auth", validate ? "true" : "false");
        return p;
    }

    /**
     * 发送邮件的服务器的IP
     */
    public String getMailServerHost() {
        return mailServerHost;
    }

    /**
     * 发送邮件的服务器的IP
     */
    public void setMailServerHost(String mailServerHost) {
        this.mailServerHost = mailServerHost;
    }

    /**
     * 发送邮件的服务器的端口
     */
    public String getMailServerPort() {
        return mailServerPort;
    }

    /**
     * 发送邮件的服务器的端口
     */
    public void setMailServerPort(String mailServerPort) {
        this.mailServerPort = mailServerPort;
    }

    /**
     * 是否需要身份验证
     */
    public boolean isValidate() {
        return validate;
    }

    /**
     * 是否需要身份验证
     */
    public void setValidate(boolean validate) {
        this.validate = validate;
    }

    /**
     * 邮件附件的文件名
     */
    public String[] getAttachFileNames() {
        return attachFileNames;
    }

    /**
     * 邮件附件的文件名
     */
    public void setAttachFileNames(String[] fileNames) {
        this.attachFileNames = fileNames;
    }

    /**
     * 邮件发送者的地址
     */
    public String getFromAddress() {
        return fromAddress;
    }

    /**
     * 邮件发送者的地址
     */
    public void setFromAddress(String fromAddress) {
        this.fromAddress = fromAddress;
    }

    /**
     * 登陆邮件发送服务器的密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 登陆邮件发送服务器的密码
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 邮件接收者的地址
     */
    public String getToAddress() {
        return toAddress;
    }

    /**
     * 邮件接收者的地址
     */
    public void setToAddress(String toAddress) {
        this.toAddress = toAddress;
    }

    /**
     * 登陆邮件发送服务器的用户名
     */
    public String getUsername() {
        return username;
    }

    /**
     * 登陆邮件发送服务器的用户名
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * 邮件主题
     */
    public String getSubject() {
        return subject;
    }

    /**
     * 邮件主题
     */
    public void setSubject(String subject) {
        this.subject = subject;
    }

    /**
     * 邮件的文本内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 邮件的文本内容
     */
    public void setContent(String textContent) {
        this.content = textContent;
    }
}
