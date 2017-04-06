package com.hr.email;

/**
 * 发送邮件测试类
 * @author XX
 *
 */
public class SendMail {
     
    // 163邮箱
    public   void send_163(String title,String Content,String toUrl) 
    {
        //MailSenderInfo用于输入发送人的信息，方便以后如果用多个，或者不同的邮箱进行发送
        MailSenderInfo mailInfo = new MailSenderInfo();
        mailInfo.setMailServerHost("smtp.163.com");                //163的规定地址
        mailInfo.setMailServerPort("25");                        //邮件协议规定端口号
        mailInfo.setValidate(true);                                //需要身份认证
        
        /*下面的信息需要根据实际进行修改*/
        mailInfo.setUsername("15874716591@163.com");             // 实际发送者
        mailInfo.setPassword("填写密码");                        // 您的邮箱密码
        mailInfo.setFromAddress("15874716591@163.com");         // 设置发送人邮箱地址
        mailInfo.setToAddress(toUrl);             // 设置接受者邮箱地址
        mailInfo.setSubject(title);             
        mailInfo.setContent(Content);
        
        
        SimpleMailSender sms = new SimpleMailSender();
        sms.sendTextMail(mailInfo); // 发送文体格式
        //sms.sendHtmlMail(mailInfo); // 发送html格式
    }
}