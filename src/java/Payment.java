import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;


public class Payment extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        PrintWriter pw=res.getWriter();
        res.setContentType("text/html");
        HttpSession hs=req.getSession(true);
        
        String seatnos="",s1="";
        String sofa[]=req.getParameterValues("sofa");
        String premium[]=req.getParameterValues("premium");
        String executive[]=req.getParameterValues("executive");
        
        if(sofa!=null)
        {
            for(int i=0;i<sofa.length;i++)
            {
                seatnos=seatnos+","+sofa[i];
                s1=seatnos.substring(1);
            }
        }
        else if(premium!=null)
        {
            for(int i=0;i<premium.length;i++)
            {
                seatnos=seatnos+","+premium[i];
                s1=seatnos.substring(1);
            }
        }
        else if(executive!=null)
        {
            for(int i=0;i<executive.length;i++)
            {
                seatnos=seatnos+","+executive[i];
                s1=seatnos.substring(1);
            }
        }
      hs.setAttribute("seats", s1);
    
      
        RequestDispatcher rd=req.getRequestDispatcher("payment.jsp");
        rd.forward(req, res);
            
                

       }    
         
                     
        
    
}