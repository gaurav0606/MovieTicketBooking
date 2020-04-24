import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import p1.*;


public class ForgotPassword1 extends HttpServlet
{
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        try
        {
        
        String option=req.getParameter("option");
        String userid=req.getParameter("userid"); 
        
        if(option.equalsIgnoreCase("otp"))
        {
            String otpvalue=req.getParameter("txtotp1").trim();
            String otp=req.getParameter("otp");
            if(otp.equals(otpvalue))
            {
                req.setAttribute("userid", userid);
                RequestDispatcher rd=req.getRequestDispatcher("forgotpassword2.jsp");
                rd.forward(req, res);
                                
            }
            else
            {
                 req.setAttribute("errormsg","<div class='alert alert-danger' style='height:70px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>OTP value does not match.Please try again.</div>");
                 req.setAttribute("otp", otp);
                 req.setAttribute("option", "otp");
                 req.setAttribute("div2", "hidden");
                 req.setAttribute("userid", userid);
                 req.setAttribute("autofocus", "autofocus");
                 RequestDispatcher rd=req.getRequestDispatcher("forgotpassword1.jsp");
                 rd.forward(req, res); 
            }
        }
        else if(option.equalsIgnoreCase("secret"))
        {
            Connection con=DB_Connection.get_DBConnection();
            PreparedStatement pst1=con.prepareStatement("select * from users where emailid=?");
            pst1.setString(1, userid);
            ResultSet rs=pst1.executeQuery();
            rs.next();
            String ans=req.getParameter("txtsecret_ans").trim();
            if(ans.equals(rs.getString("answer")))
            {
                  req.setAttribute("userid", userid);
                  RequestDispatcher rd=req.getRequestDispatcher("forgotpassword2.jsp");
                  rd.forward(req, res);
            }
            else
            {
                String question=rs.getString("secret_question");
                req.setAttribute("userid", userid);
                req.setAttribute("secret", question);
                req.setAttribute("option", "secret");
                req.setAttribute("div1", "hidden");
                req.setAttribute("errormsg","<div class='alert alert-danger' style='height:70px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>Secret answer does not match.Please try again.</div>");
                req.setAttribute("autofocus", "autofocus");
                 RequestDispatcher rd=req.getRequestDispatcher("forgotpassword1.jsp");
                 rd.forward(req, res); 
            }
           
        }
        }
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}