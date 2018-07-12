/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package package1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Cookie;
import java.sql.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import package2.UserBean;

/**
 *
 * @author ASUS
 */
public class crtlservlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserBean u1=new UserBean();//游客
        UserBean u2=new UserBean();//企业
        response.setContentType("text/html;charset=GB2312");
        String s3=request.getParameter("hidtype");

            if(s3.equals("1"))//登录
            {
                String id=new String(request.getParameter("id").getBytes("ISO-8859-1"),"GB2312");
                String password =request.getParameter("psd");
                String loginstyle=request.getParameter("radio1");
                if(loginstyle.equals("1"))//游客登录
                {
                    try{
                       Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                       String url="jdbc:sqlserver://localhost:1433;DatabaseName=test";
                       Connection con =DriverManager.getConnection(url,"root","root");
                       Statement st = con.createStatement();	// SQL语句
                       ResultSet rs = st.executeQuery("Select * FROM 注册用户表 WHERE 注册用户表.用户名='"+id+"' AND 注册用户表.密码='"+password+"'");
                       if(!rs.next())
                       {
                           try (PrintWriter out = response.getWriter()) {  
                                out.println("<!DOCTYPE html>");
                                out.println("<html>");
                                out.println("<head>");
                                out.println("<title>Servlet CtrlServlet</title>");            
                                out.println("</head>");
                                out.println("<body>");
                                out.println("用户名或密码不正确<p>");
                                out.println("</body>");
                                out.println("</html>");
                            }
                       }
                        else
                        {
                           u1.setUsename(rs.getString(6));
                           u1.setNumber(rs.getString(1));
                           Cookie c1=new Cookie("username",u1.getUsename());
                           c1.setMaxAge(60*60*24);
                            response.addCookie(c1);
                            request.getRequestDispatcher("mainpage.jsp").forward(request, response); 
                        }
                     }
                    catch (Exception e) {
                         try (PrintWriter out = response.getWriter()) {  
                                out.println("<!DOCTYPE html>");
                                out.println("<html>");
                                out.println("<head>");
                                out.println("<title>Servlet CtrlServlet</title>");            
                                out.println("</head>");
                                out.println("<body>");
                                out.println("连接数据库失败<p>");
                                out.println("</body>");
                                out.println("</html>");
                            }
                    } 
                }//if(loginstyle==1)
                else if(loginstyle.equals("2"))
                {
                    try{
                       Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                       String url="jdbc:sqlserver://localhost:1433;DatabaseName=test";
                       Connection con =DriverManager.getConnection(url,"root","root");
                       Statement st = con.createStatement();	// SQL语句
                       ResultSet rs = st.executeQuery("Select * FROM 合作企业用户表 WHERE 合作企业用户表.企业名称='"+id+"' AND 合作企业用户表.密码='"+password+"'");
                       if(!rs.next())
                       {
                           try (PrintWriter out = response.getWriter()) {  
                                out.println("<!DOCTYPE html>");
                                out.println("<html>");
                                out.println("<head>");
                                out.println("<title>Servlet CtrlServlet</title>");            
                                out.println("</head>");
                                out.println("<body>");
                                out.println("用户名或密码不正确<p>");
                                out.println("</body>");
                                out.println("</html>");
                            }
                       }
                       else
                       {
                           if(rs.getString(4).equals("0"))
                           {
                               try (PrintWriter out = response.getWriter()) {  
                                out.println("<!DOCTYPE html>");
                                out.println("<html>");
                                out.println("<head>");
                                out.println("<title>Servlet CtrlServlet</title>");            
                                out.println("</head>");
                                out.println("<body>");
                                out.println("用户尚未通过验证，请等待后台验证<p>");
                                out.println("</body>");
                                out.println("</html>");
                                }
                           }
                           else
                           {
                                u2.setUsename(rs.getString(2));
                                u2.setNumber(rs.getString(1));
                                String newcompanyname=java.net.URLEncoder.encode(u2.getUsename(), "UTF-8");
                                Cookie c2=new Cookie("companyname",newcompanyname);
                                c2.setMaxAge(60*60*24);
                                response.addCookie(c2);
                                request.getRequestDispatcher("companypage.jsp").forward(request, response); //企业管理界面
                           }
                       }
                    }
                    catch (Exception e) {
                         try (PrintWriter out = response.getWriter()) {  
                                out.println("<!DOCTYPE html>");
                                out.println("<html>");
                                out.println("<head>");
                                out.println("<title>Servlet CtrlServlet</title>");            
                                out.println("</head>");
                                out.println("<body>");
                                out.println("连接数据库失败<p>");
                                out.println("</table>捕获异常："+e+"<br>");
                                out.println("</body>");
                                out.println("</html>");
                            }
                    } 
                }
            }  
            else if(s3.equals("2"))//订购转发
            {  
                String routenum =request.getParameter("routenum");
                String username =request.getParameter("username");
                if(username==null||username.equals("null")||username.equals("NULL"))
                {
                    try (PrintWriter out = response.getWriter()) {  
                        out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<title>Servlet CtrlServlet</title>");            
                        out.println("</head>");
                        out.println("<body>");
                        out.println("请登录之后再进行订单预订<p>");
                        out.println("</body>");
                        out.println("</html>");
                    }
                }
                else
                {
                    request.setAttribute("username", username); 
                    request.setAttribute("routenum", routenum);
                    request.getRequestDispatcher("createorder.jsp").forward(request, response);
                }  
            }
            else if(s3.equals("3"))//订购订单
            {
                String proname=new String(request.getParameter("proname").getBytes("ISO-8859-1"),"UTF8");//游客姓名 GB2312
                String proidcard =request.getParameter("proidcard");//身份证号
                String pronumber =request.getParameter("pronumber");//手机号
                int propm =Integer.parseInt(request.getParameter("propm"));//人数
                int procm =Integer.parseInt(request.getParameter("procm"));//儿童人数
                String moreidcard =request.getParameter("moreidcard");//附带身份证
                String routenum =request.getParameter("routenum");//路线编号
                String username =request.getParameter("username");//用户名
                try{
                       Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                       String url="jdbc:sqlserver://localhost:1433;DatabaseName=test";
                       Connection con =DriverManager.getConnection(url,"root","root");
                       Statement st = con.createStatement();	// SQL语句
                       ResultSet rs = st.executeQuery("Select COUNT(订单序号) FROM 游客报名表");
                       rs.next();
                       int count=Integer.parseInt(rs.getString(1));
                       count++;
                       String ordernum="signup_"+count;//订单编号
                       rs = st.executeQuery("Select 游客序号 FROM 注册用户表 WHERE 注册用户表.用户名='"+username+"'");
                       rs.next();
                       String pronum=rs.getString(1);//游客序号
                       int r=st.executeUpdate("INSERT INTO 游客报名表(订单序号,旅行路线序号,游客序号,游客姓名,身份证号,联系方式,总人数,儿童人数,附带游客身份证号)\n" +"VALUES ('"+ordernum+"','"+routenum+"','"+pronum+"','"+proname+"','"+proidcard+"','"+pronumber+"',"+propm+","+procm+",'"+moreidcard+"')");
                        try {
                            con.close(); 
                        } catch(SQLException e) {
                            e.printStackTrace();
                        }
                       request.setAttribute("username", username); 
                       request.getRequestDispatcher("success.jsp").forward(request, response);
                }
                catch (Exception e) {
                         try (PrintWriter out = response.getWriter()) {  
                                out.println("<!DOCTYPE html>");
                                out.println("<html>");
                                out.println("<head>");
                                out.println("<title>Servlet CtrlServlet</title>");            
                                out.println("</head>");
                                out.println("<body>");
                                out.println(e+"<p>");
                                out.println("</body>");
                                out.println("</html>");
                            }
                } 
            }
            else if(s3.equals("4"))//返回主页
            {  
              // String username =request.getParameter("username");
             //  request.setAttribute("username", username); 
               request.getRequestDispatcher("mainpage.jsp").forward(request, response); //企业管理界面
            }
            else if(s3.equals("5"))//游客注册
            {  
                String proname=new String(request.getParameter("proname").getBytes("ISO-8859-1"),"UTF8");//姓名 GB2312
                String username=new String(request.getParameter("username").getBytes("ISO-8859-1"),"UTF8");//用户名
                String mail =request.getParameter("mail");//邮箱
                String psd =request.getParameter("psd");//密码
                String psd_rep =request.getParameter("psd_rep");//确认密码
                String id_num =request.getParameter("id_num");//身份证
                String phone =request.getParameter("phone");//手机号
                try{
                       Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                       String url="jdbc:sqlserver://localhost:1433;DatabaseName=test";
                       Connection con =DriverManager.getConnection(url,"root","root");
                       Statement st = con.createStatement();	// SQL语句
                       ResultSet rs = st.executeQuery("Select 游客序号 FROM 注册用户表 WHERE 注册用户表.用户名='"+username+"'");
                       if(rs.next())
                       {
                           try (PrintWriter out = response.getWriter()) {  
                                out.println("<!DOCTYPE html>");
                                out.println("<html>");
                                out.println("<head>");
                                out.println("<title>Servlet CtrlServlet</title>");            
                                out.println("</head>");
                                out.println("<body>");
                                out.println("用户名已被注册<p>");
                                out.println("</body>");
                                out.println("</html>");
                            }
                       }
                       else if(!psd.equals(psd_rep))
                       {
                           try (PrintWriter out = response.getWriter()) {  
                                out.println("<!DOCTYPE html>");
                                out.println("<html>");
                                out.println("<head>");
                                out.println("<title>Servlet CtrlServlet</title>");            
                                out.println("</head>");
                                out.println("<body>");
                                out.println("两次输入的密码不一致，请重新输入<p>");
                                out.println("</body>");
                                out.println("</html>");
                            }
                       }
                       else
                       {
                            rs = st.executeQuery("Select COUNT(游客序号) FROM 注册用户表");
                            rs.next();
                            int count=Integer.parseInt(rs.getString(1));
                            count++;
                            String usernum="id_"+count;//订单编号
                            int r=st.executeUpdate("INSERT INTO 注册用户表(游客序号,游客姓名,身份证号,联系方式,邮箱,用户名,密码)\n" +"VALUES ('"+usernum+"','"+proname+"','"+id_num+"','"+phone+"','"+mail+"','"+username+"','"+psd+"')");
                             try {
                                 con.close(); 
                             } catch(SQLException e) {
                                 e.printStackTrace();
                             } 
                            request.getRequestDispatcher("success.jsp").forward(request, response);
                       }
                }
                catch (Exception e) {
                         try (PrintWriter out = response.getWriter()) {  
                                out.println("<!DOCTYPE html>");
                                out.println("<html>");
                                out.println("<head>");
                                out.println("<title>Servlet CtrlServlet</title>");            
                                out.println("</head>");
                                out.println("<body>");
                                out.println("连接数据库失败<p>");
                                out.println("</body>");
                                out.println("</html>");
                            }
                } 
            }
            else if(s3.equals("6"))//企业注册
            {  
                String name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF8");//企业名称
                String proname=new String(request.getParameter("proname").getBytes("ISO-8859-1"),"UTF8");//负责人姓名
                String societynum =request.getParameter("societynum");//社会编码
                String psd =request.getParameter("psd");//密码
                String psd_rep =request.getParameter("psd_rep");//确认密码
                String phonenum =request.getParameter("phonenum");//联系方式
                String prophone =request.getParameter("prophone");//负责人联系方式
                try{
                       Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                       String url="jdbc:sqlserver://localhost:1433;DatabaseName=test";
                       Connection con =DriverManager.getConnection(url,"root","root");
                       Statement st = con.createStatement();	// SQL语句
                       ResultSet rs = st.executeQuery("Select 企业注册序号 FROM 合作企业用户表 WHERE 合作企业用户表.企业名称='"+name+"'OR 合作企业用户表.企业社会编码='"+societynum+"' ");
                       if(rs.next())
                       {
                           try (PrintWriter out = response.getWriter()) {  
                                out.println("<!DOCTYPE html>");
                                out.println("<html>");
                                out.println("<head>");
                                out.println("<title>Servlet CtrlServlet</title>");            
                                out.println("</head>");
                                out.println("<body>");
                                out.println("用户名已被注册<p>");
                                out.println("</body>");
                                out.println("</html>");
                            }
                       }
                       else if(!psd.equals(psd_rep))
                       {
                           try (PrintWriter out = response.getWriter()) {  
                                out.println("<!DOCTYPE html>");
                                out.println("<html>");
                                out.println("<head>");
                                out.println("<title>Servlet CtrlServlet</title>");            
                                out.println("</head>");
                                out.println("<body>");
                                out.println("两次输入的密码不一致，请重新输入<p>");
                                out.println("</body>");
                                out.println("</html>");
                            }
                       }
                       else
                       {
                            rs = st.executeQuery("Select COUNT(企业注册序号) FROM 合作企业用户表");
                            rs.next();
                            int count=Integer.parseInt(rs.getString(1));
                            count++;
                            String usernum="company_"+count;//订单编号
                            int r=st.executeUpdate("INSERT INTO 合作企业用户表(企业注册序号,企业名称,企业社会编码,是否通过认证,联系方式,负责人名称,负责人联系方式,密码)\n" +"VALUES ('"+usernum+"','"+name+"','"+societynum+"',0,'"+phonenum+"','"+proname+"','"+prophone+"','"+psd+"')");
                            try {
                                con.close(); 
                            } catch(SQLException e) {
                            e.printStackTrace();
                            } 
                            request.getRequestDispatcher("success.jsp").forward(request, response);
                       }
                }
                catch (Exception e) {
                         try (PrintWriter out = response.getWriter()) {  
                                out.println("<!DOCTYPE html>");
                                out.println("<html>");
                                out.println("<head>");
                                out.println("<title>Servlet CtrlServlet</title>");            
                                out.println("</head>");
                                out.println("<body>");
                                out.println("连接数据库失败<p>");
                                out.println("</body>");
                                out.println("</html>");
                            }
                } 
            }
            else if(s3.equals("7"))//主界面开始清空cookies
            {  
                Cookie cookie = null;
                Cookie[] cookies = null;
                // 获取当前域名下的cookies，是一个数组
                cookies = request.getCookies();
                if( cookies != null ){
                    for (int i = 0; i < cookies.length; i++){
                    cookie = cookies[i];
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                    }
                }
                request.getRequestDispatcher("mainpage.jsp").forward(request, response);
            }
            else if(s3.equals("8"))//发布信息
            {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String routenum =request.getParameter("routenum");
                String title=new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF8");//标题 GB2312
                String include =new String(request.getParameter("include").getBytes("ISO-8859-1"),"UTF8");//包含景点
                String companyname =new String(request.getParameter("companyname").getBytes("ISO-8859-1"),"UTF8");
                String companynum =request.getParameter("companynum");
                String stime=request.getParameter("stime");
                String etime=request.getParameter("etime");
                String detail =new String(request.getParameter("detail").getBytes("ISO-8859-1"),"UTF8");//包含景点
                String picture =request.getParameter("picture");//图片
                float price =Float.parseFloat(request.getParameter("price"));
                try{
                       Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                       String url="jdbc:sqlserver://localhost:1433;DatabaseName=test";
                       Connection con =DriverManager.getConnection(url,"root","root");
                       Statement st = con.createStatement();	// SQL语句
                       int r=st.executeUpdate("INSERT INTO 旅游线路表(旅游路线序号,包含主要景点,行程开始日期,详细信息,图片,行程结束日期,标题)\n" +"VALUES ('"+routenum+"','"+detail+"','"+stime+"','"+detail+"','"+picture+"','"+etime+"','"+title+"')");
                       r=st.executeUpdate("INSERT INTO 旅游线路组织表(旅游线路序号,旅行社编号,价格)\n" +"VALUES ('"+routenum+"','"+companynum+"',"+price+")");
                       try {
                            con.close(); 
                        } catch(SQLException e) {
                            e.printStackTrace();
                        }
                       request.getRequestDispatcher("companypage.jsp").forward(request, response);
                }
                catch (Exception e) {
                         try (PrintWriter out = response.getWriter()) {  
                                out.println("<!DOCTYPE html>");
                                out.println("<html>");
                                out.println("<head>");
                                out.println("<title>Servlet CtrlServlet</title>");            
                                out.println("</head>");
                                out.println("<body>");
                                out.println("连接数据库失败<p>");
                                out.println(e);
                                out.println("</body>");
                                out.println("</html>");
                            }
                } 
            }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
