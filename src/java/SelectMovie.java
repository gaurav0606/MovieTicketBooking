import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import p1.*;


public class SelectMovie extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(false);
        String mcode=req.getParameter("mcode");
        String sdate=req.getParameter("sdate");
       
        try
        {
         
       
            Connection con=DB_Connection.get_DBConnection();
        
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date date = new java.util.Date();
            String today=dateFormat.format(date);
            String sd="";
            if(sdate!=null)
            {
                 sd=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd/MM/yyyy").parse(sdate));
            
            }
            else
            {
                sd=today;
            }
           
            
                    
            
            PreparedStatement pst2=con.prepareStatement("select  timings from movie_screen where start_date in(select max(start_date) from movie_screen where start_date<=? and mcode=? group by sno) and mcode=?");
            pst2.setString(1,today);
            pst2.setString(2, mcode);
             pst2.setString(3, mcode);
           
            ResultSet rs1=pst2.executeQuery();
            String slots="";
            while (rs1.next())
                slots=slots+rs1.getString("timings")+",";
               
            
            
            String slots1[]=slots.split(",");
            String sl="";
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
            java.util.Date time = sdf.parse(sdf.format(new java.util.Date()));
            for (int i=0;i<(slots1.length);i++)
            {
                if(sd.equals(today))
                {
                    java.util.Date time1=sdf.parse(slots1[i]);
                    long e=((time1.getTime() - time.getTime())/1000)/60; 
                    if(e>=60)
                    sl=sl+"<span style='font-size:14px;cursor:pointer' id='sp1' class='label label-danger'>"+slots1[i] +"</span> ";        
                }
                else
                {
                    sl=sl+"<span style='font-size:14px;cursor:pointer' id='sp1' class='label label-danger'>"+slots1[i] +"</span> ";        
                }
            }
            String disabled="";
            if(sl=="")
            {   disabled="disabled";
                sl="<div style='color: #a94442;padding-top:5px;font-weight:bolder'>No shows to display</div>";
            }
            rs1.close();
            pst2.close();
            
            pst2=con.prepareStatement("select * from movies,movie_screen where movies.mcode=? and movies.mcode=movie_screen.mcode");
            pst2.setString(1, mcode);
            rs1=pst2.executeQuery();
             
            String option="";
            Calendar cl=Calendar.getInstance();
            int count=6-cl.get(Calendar.DAY_OF_WEEK);
            count=(count==0?7:count);
            count=(count==-1?6:count);
            for(int i=1;i<=count;i++)
            {
                String t_date1=cl.get(Calendar.YEAR)+"-"+String.format("%02d",cl.get(Calendar.MONTH)+1)+"-"+String.format("%02d",cl.get(Calendar.DAY_OF_MONTH));
                if(sd.equals(t_date1))
                {
                     String t_date=String.format("%02d",cl.get(Calendar.DAY_OF_MONTH))+"/"+String.format("%02d",cl.get(Calendar.MONTH)+1)+"/"+cl.get(Calendar.YEAR);
                     option=option+"<option value='"+t_date+"' selected>"+t_date+"</option>";
                      
                }
                else
                {
                     String t_date=String.format("%02d",cl.get(Calendar.DAY_OF_MONTH))+"/"+String.format("%02d",cl.get(Calendar.MONTH)+1)+"/"+cl.get(Calendar.YEAR);
                     option=option+"<option value='"+t_date+"'>"+t_date+"</option>";
                }
                       
                cl.add(Calendar.DAY_OF_MONTH,1);
                
            }
            String t="";
            
            if(rs1.next())
            {
                
                              

                t=t+"<div class='row' style=';height:100%'> <div class='panel panel-danger'>  <div class='panel-body'>";
                t=t+"<div class='col-md-3'><img src='GetMovieImage?mcode="+rs1.getString("movies.mcode")+"'style='width:100%;height:200px' alt='Offer 1' class='img-responsive'></img></div>";
                            
                t=t+"<div class='col-md-3'><div style='font-size: 30px;font-weight:bold;font-family:monospace;'>"+rs1.getString("movies.mname")+"</div>"; 
                
                t=t+"<div style='font-weight:lighter;font-size:14px;text-transform: capitalize'>"+rs1.getString("movies.language")+"</div>";
                t=t+"<div style='padding-top:10px;text-transform: capitalize'><b>Director: </b>"+rs1.getString("movies.director")+" </div>";
                t=t+"<div style='text-transform: capitalize'><b>Producer: </b>"+rs1.getString("movies.producer")+" </div>";
                t=t+"<div style='text-transform: capitalize'><b>Cast: </b>"+rs1.getString("movies.cast")+" </div>";
                t=t+"<div><b>Duration: </b><div style='display:inline;font-family:monospace;font-size: 18px;color:green;'>"+(rs1.getInt("movies.duration")/60)+" hrs "+(rs1.getInt("movies.duration")%60)+ " mins</div></div>";
                t=t+"<div style='text-transform: capitalize; white-space:pre-wrap'><b>Story Line: </b>"+rs1.getString("description")+" </div>";
                t=t+"</div>";
                t=t+"<div class=' col-md-2'><label>Select Timing :</label>";
                t=t+"<div>"+sl+"</div><div id='timingerr' style='color: #a94442;padding-top:5px;font-weight:bolder'></div>";
                t=t+"<br/><br/><div class='form-group'><label  for='date'>Change Date:</label><select class='form-control' id='date' name='date'>"+option+"</select></div></div>";
                t=t+"<div class='col-md-offset-2 col-md-2'><form id='frmaddproduct' action='ReviewBooking'   method='get'>";
                t=t+"<div class='form-group'><label  for='tickets'>No of Tickets:</label><select class='form-control' id='tickets' name='tickets'><option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option></select></div>";
                t=t+"<div class='form-group'><label  for='type'>Ticket Type:</label><select class='form-control' id='type' name='type'><option value='Premium'>Premium ("+rs1.getString("cost_premium")+"/-) </option><option value='Sofa'>Sofa ("+rs1.getString("cost_sofa")+"/-)</option><option value='Executive'>Executive ("+rs1.getString("cost_exec")+"/-)</option></select></div>";
                t=t+"<input type='hidden' id='show' name='show'></input>";
                t=t+"<input type='hidden'  name='mcode' id='mcode' value='"+rs1.getString("movies.mcode")+"' ></input>";
                t=t+"<input type='hidden'  name='mname' value='"+rs1.getString("movies.mname")+"' ></input>";
                t=t+"<input type='hidden'  name='Sofa' value='"+rs1.getString("cost_sofa")+"' ></input>";
                t=t+"<input type='hidden'  name='Premium' value='"+rs1.getString("cost_premium")+"' ></input>";
                t=t+"<input type='hidden'  name='Executive' value='"+rs1.getString("cost_exec")+"' ></input>";
                t=t+"<input type='hidden'  name='date' value='"+sd+"' ></input>";
                t=t+"<div class='form-group'><button "+ disabled+" class='btn btn-danger' style=';cursor: pointer;width:100%;'>Book Now</button></div>";
                t=t+"</form></div>";
                
                //t=t+"<div class='row'>";
                //t=t+"<form id='frmcart' class='form' name='frmcart' action='Cart' method='post'><div class='col-md-offset-1 col-md-3'><button type='submit' id='cart' class='btn btn-primary btn-lg' style='font-size:15px;margin-right:25px'><span class='glyphicon glyphicon-shopping-cart'></span> Go to Cart</button> <button type='submit' id='buy' class='btn btn-primary btn-lg' style='font-size:15px'> <span class='fa fa-list-ol '></span> Buy now</button></div>";
                //t=t+"<div class='col-md-2'><div class='input-group'> <span class='input-group-btn'><button type='button' id='minus' class='btn btn-danger btn-sm text-center'  ><span class='glyphicon glyphicon-minus' ></span></button></span><input type=text id='quantity' name='quantity' value='1' min='0' max='100' class='form-control text-center input-sm'> <span class='input-group-btn'><button type='button' id='plus' class='btn btn-success btn-sm'><span class='glyphicon glyphicon-plus' ></span></button></span></div></div>";
               
                //t=t+"<input type='hidden' id='pcode' name='pcode' value='"+rs1.getString("pcode")+"'></form>";
                //t=t+"<div id='m1' style='color: #a94442;padding-bottom: 10px '></div>";
  
                                
                 pw.println(t);
            }
            else
            {
                
           pw.println("<p style='font-weight:bolder;color:red;font-size:20px'><i style='font-weight:bolder;color:red;font-size:25px' class='fa fa-frown-o'></i> Oopsss....No Products to Display </style> ");

            }
                

       }    
         
        catch(Exception e)
        {
            pw.println(e);
        }

              
        
    }
}