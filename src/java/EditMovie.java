import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import p1.*;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig
public class EditMovie extends HttpServlet
{
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        InputStream is[];
        is=new InputStream[]{null};
        String values[]=new String[9];
        int j=0;
        try
        {
            Collection<Part> p= req.getParts();
            Iterator i=p.iterator();
            while(i.hasNext())
            {
                 Part p1=(Part)i.next();
                
                 if(p1.getName().equalsIgnoreCase("txtpic"))
                 {
                    is[0]= p1.getInputStream();
                   
                 }
                 else
                 {
                    InputStream i1= p1.getInputStream();
                    int ch;
                    StringBuilder sb = new StringBuilder();
                    while((ch = i1.read()) != -1)
                    {
                        sb.append((char)ch);
                    }
                    values[j]=sb.toString();
                    j++;
                 }
            }
        
        
        Connection con=DB_Connection.get_DBConnection();
        if(values[8].equals("false"))
        {
        PreparedStatement pst1=con.prepareStatement("update movies set mname=?, description=?,cast=?,director=?, producer=?, language=?, duration=?, pic1=? where mcode=?");
        pst1.setString(1, values[1]);
        pst1.setString(2, values[2]);
        pst1.setString(3, values[3]);
        pst1.setString(4, values[4]);
        pst1.setString(5, values[5]);
        pst1.setString(6, values[6]);
        pst1.setInt(7, Integer.parseInt(values[7]));
        pst1.setBlob(8, is[0]);
        pst1.setString(9, values[0]);
       
        pst1.executeUpdate();
        }
        else
        {
                PreparedStatement pst1=con.prepareStatement("update movies set mname=?, description=?,cast=?,director=?, producer=?, language=?, duration=? where mcode=?");
                pst1.setString(1, values[1]);
                pst1.setString(2, values[2]);
                pst1.setString(3, values[3]);
                pst1.setString(4, values[4]);
                pst1.setString(5, values[5]);
                pst1.setString(6, values[6]);
                pst1.setInt(7, Integer.parseInt(values[7]));
               
                pst1.setString(8, values[0]);
                pst1.executeUpdate();
        }
        req.setAttribute("msg", "$('#modal-msg').modal('show');");
        RequestDispatcher rd=req.getRequestDispatcher("editmovies.jsp");
        rd.forward(req, res);
        }
        catch(Exception e)
        {
            pw.println(e);
        }
    }
        
}