package sitePackage;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class MailClass {

    public static final String toUser ="your permission was changed to User";
    public static final String toManager =" your permission was changed to Manager";
    public static final String toEmployee = " your permission was changed to Employee";
    public static final String welcome = "Welcome to ConP Corp , you are now a a pending user.\n"+
                                        "please ask your service provider to grand you the corresponding privileges.";
    public static final String changed = "some of your data was edited by highter authority that you ";
    /*
     * mail sending class
     * @param to -  the email address that the mail will be sent to
     * @param type - type of message :
     *              welcome - "Welcome to ConP Corp , you are now a a pending user.
                                please ask your service provider to grand you the corresponding privileges."
                    toUser - your permission was changed to User
                    toManager - your permission was changed to Manager
                    toEmployee - your permission was changed to Employee

                   if the message doesn't correspond to any of those basic types , the message in the type string will be sent to the mail.
     */
    public static void send(String to, String type ) {

        //Get the session object
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("ConPCorp@gmail.com","ConPCorp1");//change accordingly
                    }
                });

        //compose message
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("ConPCorp@gmail.com"));//change accordingly
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
            message.setSubject("Hello");

            message.setText(type);

            //send message
            Transport.send(message);

            System.out.println("message sent successfully");

        } catch (MessagingException e) {throw new RuntimeException(e);}

    }
}  