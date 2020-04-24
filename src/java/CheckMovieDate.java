
import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import p1.*;

 public class CheckMovieDate extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        
        try
        {
      
      
        String start=req.getParameter("start");
        String sno=req.getParameter("sno");
        String mcode=req.getParameter("mcode");
              
        Connection con=DB_Connection.get_DBConnection();
        
        //to insert new movie or insert second time in future
        PreparedStatement pst1=con.prepareStatement("Select * from movie_screen where  sno=? and mcode=? and  start_date > (select min(start_date) from movie_screen where mcode!=? order by start_date asc) ");
        pst1.setString(1,sno);
        pst1.setString(2,mcode);
         pst1.setString(3,mcode);
        
        ResultSet rs=pst1.executeQuery();
        if(rs.next()==false)
        {
            pw.println("success");
        }
        else
        {
            pst1.close();
            rs.close();
            //check for assign same movie on same date on same screen
            pst1=con.prepareStatement("Select * from movie_screen where  sno=? and start_date=? and mcode=?");
            pst1.setString(1,sno);
            pst1.setString(2,new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(start)));
            pst1.setString(3,mcode);

            rs=pst1.executeQuery();
            if(rs.next())
            {

                   pw.println("error");



            }
            else
            {
                //check for another movie on same screen 
                    pst1.close();
                    rs.close();
                    pst1=con.prepareStatement("Select * from movie_screen where  sno=? and start_date=? and mcode!=?");
                    pst1.setString(1,sno);
                    pst1.setString(2,new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(start)));
                    pst1.setString(3,mcode);
                    rs=pst1.executeQuery();
                    if(rs.next())
                    {
                       pw.println("assigned");
                    }
                    else //check for range dates if movie present
                    {
                        String v="",v1="";
                        pst1=con.prepareStatement("Select * from movie_screen where  sno=? and mcode=? and start_date < ? order by start_date desc");
                        pst1.setString(1,sno);
                        pst1.setString(2,mcode);
                        pst1.setString(3,new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(start)));
                        rs=pst1.executeQuery();
                        if(rs.next())
                        {
                            v=rs.getString("start_date");


                        }

                       pst1.close();
                       rs.close();


                        pst1=con.prepareStatement("Select * from movie_screen where  sno=? and mcode!=? and start_date > ? order by start_date asc");
                        pst1.setString(1,sno);
                        pst1.setString(2,mcode);
                        pst1.setString(3,new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(start)));
                        rs=pst1.executeQuery();
                        java.util.Date st=new SimpleDateFormat("yyyy-MM-dd").parse(new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(start)));

                        if(rs.next())
                        {
                            v1=rs.getString("start_date");
                            // 
                        }

                        if(v1.equals(""))
                        {
                            pw.println("error");
                        }
                        else if(st.after(new SimpleDateFormat("yyyy-MM-dd").parse(v)) && st.before(new SimpleDateFormat("yyyy-MM-dd").parse(v1)))
                        {
                             pw.println("error");
                        }
                        else
                        {
                             pw.println("success");
                        }
                    }
            } 


            }
    
        }
        catch(Exception e)
        {
           
        }
    }
        
}/*
 
 * * 
 * if(rs.next())
        {
           if(mcode.equals(rs.getString("mcode")))
           {
               pw.println("error");
           }
           else
           {
               pw.println("success");
           }
            
        }
        else
        {
           
                pw.println("success");
            
        }
 * 
 * 
 * 
 * ____________________
 * PreparedStatement pst1=con.prepareStatement("Select * from movie_screen where  sno=? and ? < (select min(start_date) from movie_screen where mcode!=? and  start_date > ?)");
        pst1.setString(1,sno);
        pst1.setString(2,new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(start)));
        pst1.setString(3,mcode);
        pst1.setString(4,new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(start)));
       // pst1.setString(2,new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(start)));
        ResultSet rs=pst1.executeQuery();
 */