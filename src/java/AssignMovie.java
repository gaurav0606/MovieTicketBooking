import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import p1.*;



public class AssignMovie extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
         PrintWriter pw=res.getWriter();
        try
        {
       
        int sno=Integer.parseInt(req.getParameter("txtsno").trim());
        String mcode=req.getParameter("txtmcode").trim();
        int costsofa=Integer.parseInt(req.getParameter("txtcostsofa").trim());
        int costpremium=Integer.parseInt(req.getParameter("txtcostpremium").trim());
        int costexec=Integer.parseInt(req.getParameter("txtcostexec").trim());
        String start_date=req.getParameter("txtstartdate").trim();
        String assigned=req.getParameter("assigned").trim();
        
        String slots=req.getParameter("hslots").trim();
       
      /*  Calendar c1 = Calendar.getInstance();
        c1.setTime(new SimpleDateFormat("dd/MM/yyyy").parse(start_date)); 
        c1.add(Calendar.DATE, -1);
        pw.println(new SimpleDateFormat("yyyy-MM-dd").format(c1.getTime()));*/
        Connection con=DB_Connection.get_DBConnection();
        
        /*PreparedStatement pst1=con.prepareStatement("update movie_screen set end_date=? where sno=? and end_date is null");
        pst1.setString(1, new SimpleDateFormat("yyyy-MM-dd").format(c1.getTime()));
        pst1.setInt(2, sno);
        
        pst1.execute();
        pst1.close();*/
        if(assigned.equalsIgnoreCase("assigned"))
        {
            PreparedStatement pst1=con.prepareStatement("update movie_screen set mcode=?,cost_sofa=?,cost_premium=?,cost_exec=?,timings=? where sno=? and start_date=?");
            pst1.setString(1, mcode);
            pst1.setInt(2, costsofa);
            pst1.setInt(3, costpremium);
            pst1.setInt(4, costexec);
            pst1.setString(5, slots);
            pst1.setInt(6, sno);
            pst1.setString(7, new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(start_date)));
            pst1.execute();
        }
        else
        {
            PreparedStatement pst1=con.prepareStatement("insert into movie_screen values(?,?,?,?,?,?,?)");
            pst1.setInt(1, sno);
            pst1.setString(2, mcode);
            pst1.setString(3,new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(start_date)));
            pst1.setString(4, slots);
            pst1.setInt(5, costsofa);
            pst1.setInt(6, costpremium);
            pst1.setInt(7, costexec);


            pst1.executeUpdate();
        }
        req.setAttribute("msg", "$('#modal-msg').modal('show');");
        RequestDispatcher rd=req.getRequestDispatcher("assignmovie.jsp");
        rd.forward(req, res);
        }
        catch(Exception e)
        {
            pw.println(e);
        }
    }
        
}