import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import p1.*;


public class SeatLayout extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        ArrayList <String> a1=new ArrayList<String>();
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(false);
        try
        {
            Connection con=DB_Connection.get_DBConnection();
        
            
            
            PreparedStatement pst2=con.prepareStatement("select * from bookings where sno=? and movie_date=? and timing=?");
            pst2.setInt(1, Integer.parseInt(hs.getAttribute("sno").toString()));
            pst2.setString(2, hs.getAttribute("showdate").toString());
            pst2.setString(3, hs.getAttribute("show").toString());
            ResultSet rs1=pst2.executeQuery();
            while(rs1.next())
            {
                 
                String x[]=rs1.getString("seatno").split(",");
                for(int i=0;i<x.length;i++)
                {
                    a1.add(x[i]);
                   
                }
            }
           
            
          
            pst2=con.prepareStatement("select * from screen where sno=?");
            
            pst2.setInt(1,Integer.parseInt(hs.getAttribute("sno").toString()));
            
            rs1=pst2.executeQuery();
                     
            rs1.next();
            String type=hs.getAttribute("type").toString();
            String sf="",pm="",ex="";
            if(type.equalsIgnoreCase("sofa"))
            {
                pm="disabled";
                ex="disabled";
                sf="";
            }
            else if(type.equalsIgnoreCase("premium"))
            {
                sf="disabled";
                ex="disabled";
                pm="";
            }
            else if(type.equalsIgnoreCase("executive"))
            {
                sf="disabled";
                ex="";
                pm="disabled";
                
            }
            String t="";
            int sofa=rs1.getInt(2);
            int premium=rs1.getInt(3);
            int exec=rs1.getInt(4);
            t=t+"<div class='text-primary' style='text-align: center;font-weight:bold'>Sofa</div><hr/>";
            t=t+"<div class='container-fluid'><form action='Payment'>";
            int c=65;
            String d="",cl="";
            for(int i=1,j=1;i<=sofa;i++,j++)
            {
                String id=(char)c+String.format("%02d",j);
                if(a1.contains(id))
                {
                    d="disabled";
                    cl="gray";
                }
                else
                {
                    
                    d="";
                    cl="#F42536";
                }
                t=t+"<input "+sf+" "+d+" type='checkbox' name='sofa' id='"+id+"' value='"+id+"'  style='position:absolute;cursor: pointer;padding: 0px 4px' />";
                t=t+"<label class='label1' for='"+id+"'  style='width:40px;border-radius: 2px;background: "+cl+";font-size: 18px;padding: 0px 4px;font-weight: bold;cursor: pointer;position:relative'>"+id+"</label>";
                t=t+"&nbsp&nbsp&nbsp";
                if(i%10==0)
                {
                    t=t+"<br/>";
                    c++;j=0;
                }
            }
            t=t+"<br/><div class='text-primary' style='text-align: center;font-weight:bold'>Premium</div><hr/>";
            for(int i=1,j=1;i<=premium;i++,j++)
            {
                String id=(char)c+String.format("%02d",j);
                if(a1.contains(id))
                {
                     d="disabled";
                    cl="gray";
                }   
                else
                {
                   
                    d="";
                    cl="#F42536";
                }
                
                t=t+"<input "+ pm+" "+d+" type='checkbox' name='premium' id='"+id+"' value='"+id+"'  style='position:absolute;cursor: pointer;padding: 0px 4px' />";
                t=t+"<label class='label1' for='"+id+"'  style='width:40px;border-radius: 2px;background: "+cl+";font-size: 18px;padding: 0px 4px;font-weight: bold;cursor: pointer;position:relative'>"+id+"</label>";
                t=t+"&nbsp&nbsp&nbsp";
                if(i%10==0)
                {
                    t=t+"<br/>";
                    c++;j=0;
                }
            }
            t=t+"<br/><div class='text-primary' style='text-align: center;font-weight:bold'>Executive</div><hr/>";
            for(int i=1,j=1;i<=exec;i++,j++)
            {
                
                String id=(char)c+String.format("%02d",j);
                if(a1.contains(id))
                {
                    d="disabled";
                    cl="gray";
                }
                else
                {
                                       
                    d="";
                    cl="#F42536";
                }
                
                t=t+"<input "+ ex+" "+d+" type='checkbox' name='executive' id='"+id+"' value='"+id+"'  style='position:absolute;cursor: pointer;padding: 0px 4px' />";
                t=t+"<label class='label1' for='"+id+"'  style='width:40px;border-radius: 2px;background: "+cl+";font-size: 18px;padding: 0px 4px;font-weight: bold;cursor: pointer;position:relative'>"+id+"</label>";
                t=t+"&nbsp&nbsp&nbsp";
                if(i%10==0)
                {
                    t=t+"<br/>";
                    c++;j=0;
                }
                
               
            }
            
            t=t+"<br/><div class='text-primary' style='text-align: center;font-weight:bold'>Screen this way</div><hr/>";
           
           t=t+"<button type='submit' style='margin-left:200px;width:25%' class='btn btn-danger' id='b1' value='ok' disabled>Make Payment</button>";
            t=t+"</form>";  
             t=t+"</div>";
            pw.println(t);
  }    
         
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}