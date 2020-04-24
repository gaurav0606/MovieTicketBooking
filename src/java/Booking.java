import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
import p1.*;
import java.sql.*;
import javax.mail.*;
import javax.mail.internet.*;


public class Booking extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(false);
        String emailid=req.getParameter("txtemailid");
        try
        {
            Calendar c=Calendar.getInstance();
            String bno=c.get(Calendar.YEAR)+""+c.get(Calendar.MONTH)+""+c.get(Calendar.DAY_OF_MONTH)+""+c.get(Calendar.MILLISECOND);
         
            SimpleDateFormat newDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String today = newDateFormat.format(new java.util.Date());
            
         
            SimpleDateFormat newDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date MyDate = newDateFormat1.parse(hs.getAttribute("showdate").toString());
           
           
            
            newDateFormat.applyPattern("EEEE, d MMM yyyy");
            String showdate2 = newDateFormat.format(MyDate);
          
            Connection con=DB_Connection.get_DBConnection();
            
           
            
            PreparedStatement pst2=con.prepareStatement("insert into bookings values(?,?,?,?,?,?,?,?,?,?,?)");
            pst2.setString(1,bno);
            pst2.setString(2, today);
            pst2.setString(3, emailid);
            pst2.setString(4, hs.getAttribute("mcode").toString());
            pst2.setString(5, hs.getAttribute("showdate").toString());
            pst2.setString(6, hs.getAttribute("show").toString());
            pst2.setInt(7, Integer.parseInt(hs.getAttribute("sno").toString()));
            pst2.setInt(8,Integer.parseInt(hs.getAttribute("tickets").toString()) );
            pst2.setString(9, hs.getAttribute("type").toString());
            pst2.setString(10, hs.getAttribute("seats").toString());
            pst2.setInt(11, Integer.parseInt(hs.getAttribute("total").toString()));
            pst2.execute();
            
            String t="";
            

            t=t+"<div class='row' style=';height:100%'><div class='col-md-offset-3 col-md-6'> <div class='panel panel-danger'>  <div class='panel-body' >";
            

            t=t+"<div class='col-md-12' style='padding-left:280px'><div style='font-size: 30px;font-weight:bold;font-family:monospace;'>"+hs.getAttribute("mname") +"</div>";
             t=t+"<div style='text-transform: capitalize;font-weight:bold' class='text-info'><b></b>"+showdate2+" </div>";

            t=t+"<div><b>Screen "+hs.getAttribute("sno").toString()+ " - "+hs.getAttribute("seats").toString()+"</b></div>";
            t=t+"<div style='padding-top:2px;text-transform: capitalize'><b>Show Timing: </b>"+hs.getAttribute("show")+"</div>";
            t=t+"<div style='text-transform: capitalize'><b>Total Tickets: </b>"+hs.getAttribute("tickets")+" </div>";
            t=t+"<div style='text-transform: capitalize'><b>Seat Type: </b>"+hs.getAttribute("type")+" </div>";
           
            t=t+"<div style='text-transform: capitalize;;font-size: 16px;color:green'><b>Grand Total: <i class='fa fa-rupee'></i> "+hs.getAttribute("total")+"/- </b></div>";
            
            t=t+"</div></div></div>";

            
            Properties p=new Properties();
            p.put("mail.smtp.starttls.enable","true");//here smtp donot get start security gets started
            p.put("mail.smtp.auth","true");
            p.put("mail.smtp.host","smtp.gmail.com");
            p.put("mail.smtp.port","587");

            Session s= Session.getInstance(p,new Authenticator()
            {
                    protected PasswordAuthentication getPasswordAuthentication() 
                    {
                                   return new PasswordAuthentication(DB_Connection.SENDERS_EMAILID,DB_Connection.SENDERS_PASSWORD);
                    }
            });
            
            MimeMessage msg=new MimeMessage(s);//multipurpose internet mail extension mime

            msg.addRecipient(Message.RecipientType.TO,new InternetAddress(emailid));//here type recipient email id
            msg.setSubject("Booking Confirmation");
            String m="Thanking for booking with us. The details are as follows: <br/><b>Booking ID:</b>"+bno+"<br/>"+"<br/><b>Movie name:"+hs.getAttribute("mname") +"<br/>Movie Date:"+showdate2+"/-<br/>Show timing:"+hs.getAttribute("show") +"<br/><Total Tickets:"+hs.getAttribute("tickets") +"<br/>Seat Type:"+hs.getAttribute("type") +"<br/>Total:"+hs.getAttribute("total")+"/-";
            msg.setContent(m, "text/html; charset=utf-8");
            Transport.send(msg);

            req.setAttribute("msg", t);
            RequestDispatcher rd=req.getRequestDispatcher("booking.jsp");
            rd.forward(req, res);
            
                

       }    
         
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}