import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.*;
import p1.*;


public class ReviewBooking extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(true);
        
        String mcode=req.getParameter("mcode");
        String mname=req.getParameter("mname");
        String show=req.getParameter("show");
        String showdate=req.getParameter("date");
        int tickets=Integer.parseInt(req.getParameter("tickets"));
        String type=req.getParameter("type");
        int cost=Integer.parseInt(req.getParameter(type));
          
        SimpleDateFormat newDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String today = newDateFormat.format(new java.util.Date());
        
        Connection con=DB_Connection.get_DBConnection();
        int sno=0;
        try
        {
        PreparedStatement pst2=con.prepareStatement("select sno from movie_screen where start_date in(select max(start_date) from movie_screen where start_date<=?) and mcode=?");
        pst2.setString(1,today);
        pst2.setString(2, mcode);
        ResultSet rs1=pst2.executeQuery();
        rs1.next();
        sno=rs1.getInt("sno");
        pst2.close();
        rs1.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        hs.setAttribute("mcode", mcode);
        hs.setAttribute("mname", mname);
        hs.setAttribute("show", show);
        hs.setAttribute("showdate", showdate);
        hs.setAttribute("tickets", tickets);
        hs.setAttribute("type", type);
        hs.setAttribute("total",(tickets*cost));
        hs.setAttribute("sno",sno);
        

        try
        {
         
            SimpleDateFormat newDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
            Date MyDate = newDateFormat1.parse(showdate);
            newDateFormat.applyPattern("EEEE d MMM yyyy");
            String showdate1 = newDateFormat.format(MyDate);
            
        
            String t="";
            

            t=t+"<div class='row' style=';height:100%'> <div class='panel panel-danger'>  <div class='panel-body'>";
            t=t+"<div class='col-md-3'><img src='GetMovieImage?mcode="+mcode+"'style='width:100%;height:200px' alt='Offer 1' class='img-responsive'></img></div>";

            t=t+"<div class='col-md-9'><div style='font-size: 30px;font-weight:bold;font-family:monospace;'>"+mname+"</div>";
             t=t+"<div style='text-transform: capitalize;font-weight:bold' class='text-info'><b>Show Date: </b>"+showdate1+" </div>";

            
            t=t+"<div style='padding-top:10px;text-transform: capitalize'><b>Show Timing: </b>"+show+" </div>";
            t=t+"<div style='text-transform: capitalize'><b>Total Tickets: </b>"+tickets+" </div>";
            t=t+"<div style='text-transform: capitalize'><b>Seat Type: </b>"+type+" </div>";
            t=t+"<div style='text-transform: capitalize'><b>Screen no: </b>Screen "+sno+" </div>";
           
            t=t+"<br/><div style='text-transform: capitalize;;font-size: 18px;color:green'><b>Grand Total: <i class='fa fa-rupee'></i> "+(tickets*cost)+"/- </b></div>";
            t=t+"<br/><a style='float:right' class='btn btn-danger' href='seatlayout.jsp?total="+(tickets*cost)+"'>Select Seats </a>";
            //t=t+"<br/><a style='float:right' class='btn btn-danger' href='payment.jsp?total="+(tickets*cost)+"'> <i class='fa fa-credit-card-alt'></i> Make Payment </a>";
            t=t+"</div></div>";

            req.setAttribute("msg",t);
            req.setAttribute("mcode",mcode);
            RequestDispatcher rd=req.getRequestDispatcher("reviewbooking.jsp");
            rd.forward(req, res); 
            
                

       }    
         
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}