package demo;

import javax.mail.*;
import javax.mail.internet.*;
import javax.naming.*;

/**
 * Created by User on 20/03/2015.
 */
public class rape {
    public static void main(String[] args) {
        Session feed = null;
        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("comp/env" );
            feed = (Session)envCtx.lookup("mail/NomDeLaRessource" );
        } catch (Exception ex) {
            System.out.println("lookup error" );
            System.out.println( ex.getMessage());
        }

        Message message = new MimeMessage(feed);
        try {
            message.setFrom(new InternetAddress("yashaev@hotmale.com"));
            InternetAddress to[] = new InternetAddress[1];
            to[0] = new InternetAddress("yashaev@gmail.com");
            message.setRecipients(Message.RecipientType.TO, to);
            message.setSubject("jesus");
            message.setContent("rape", "text/html;charset=UTF-8");
            Transport.send(message);
        } catch (AddressException ex) {
            System.out.println( ex.getMessage());
        } catch (MessagingException ex) {
            System.out.println( ex.getMessage());
        }
    }


}

