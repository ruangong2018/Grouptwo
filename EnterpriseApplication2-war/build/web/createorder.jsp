<%-- 
    Document   : createorder
    Created on : 2018-7-5, 22:17:00
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language ="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    ﻿<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
    <head>
    <title>Createorder</title>
    <!-- Meta -->
    <meta charset="GB2312">
    <meta http-equiv="Content-Type" content="text/html; charset=GB2312">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">    
    <link rel="shortcut icon" href="favicon.ico">  
    <!---<link href='http://fonts.googleapis.com/css?family=Lato:300,400,300italic,400italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>--->
    <!-- Global CSS -->
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">   
    <!-- Plugins CSS -->    
    <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="assets/plugins/pe-icon-7-stroke/css/pe-icon-7-stroke.css"> 
    <link rel="stylesheet" href="assets/plugins/animate-css/animate.min.css">
    <!-- Theme CSS -->  
    <link id="theme-style" rel="stylesheet" href="assets/css/styles.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head> 

<body class="tour-page">

    <!-- * Facebook Like button script starts -->
    <div id="fb-root"></div>
    <script>(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "/connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
    fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));</script>
    <!-- * Facebook Like button script ends -->
    
    <div class="wrapper">
        <!-- ******HEADER****** --> 
        <header id="header" class="header">  
            <div class="container">            
                <h1 class="logo pull-left">
                    <a href="#">
                        <span class="logo-title">旅游信息自助系统</span>
                    </a>
                </h1><!--//logo-->              
                <nav id="main-nav" class="main-nav navbar-right" role="navigation">
                    <div class="navbar-header">
                        <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button><!--//nav-toggle-->
                    </div><!--//navbar-header-->            
                    <div class="navbar-collapse collapse" id="navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li class="nav-item"><a href="mainpage.jsp">主页</a></li>
                            <!--li class="nav-item"><a href="tour.html">Tour</a></li-->
                            <li class="nav-item"><a href="aboutus.jsp">关于我们</a></li>
                            <%
                               Cookie username = null;
                                Cookie[] cookies = null;
                                cookies = request.getCookies();
                                if( cookies != null ){
                                    for (int i = 0; i < cookies.length; i++){
                                        username = cookies[i];
                                        if(username.getName()==null)
                                        {
                                            continue;
                                        }
                                        else if(!username.getName().equals("JSESSIONID"))
                                        {
                                            break;
                                        }
                                        else if(username.getName().equals("JSESSIONID"))
                                        {
                                            username=null;
                                        }
                                    }
                                }
                                if(username==null||username.getName()==null||username.getName().equals("null")||username.getName().equals("NULL"))
                                {
                                    out.println("<li class='nav-item'><a href='login.jsp'>登录</a></li> ");
                                }
                                else if(username.getName()!=null)
                                {
                                    out.println("<li class='nav-item dropdown'> ");
                                    out.println("<a class='dropdown-toggle' data-toggle='dropdown' data-hover='dropdown' data-delay='0' data-close-others='false' href='blog.html'>"+username.getValue()+"<i class='fa fa-angle-down'></i></a> ");
                                    out.println("<ul class='dropdown-menu'><li><a href='personal.jsp'>个人中心</a></li> <li><a href='makesure.jsp'>注销</a></li></ul></li>");
                                }
                            %>
                            <%--li class="nav-item"><a href="login.jsp">登录</a></li--%>                           
                            <li class="nav-item dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false" href="blog.html">注册 <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="register1.jsp">游客注册</a></li>
                                    <li><a href="register2.jsp">企业注册</a>
                                </ul>
                            </li><!--//dropdown--> 
                            
                        </ul><!--//nav-->
                    </div><!--//navabr-collapse-->
                </nav><!--//main-nav-->           
            </div><!--//container-->
        </header><!--//header-->
        
        <!-- ******FEATURES****** --> 
        <section id="features" class="features section">
            <div class="container">
                <h2 class="title text-center">订单详细</h2>
                <div class="item row">
                    
            <%
            String routenum=(String)request.getAttribute("routenum");
            try{
                 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                 String url="jdbc:sqlserver://localhost:1433;DatabaseName=test";
                Connection con =DriverManager.getConnection(url,"root","root");
                Statement st = con.createStatement();	// SQL语句
             //   String str1=request.getParameter("proname");
              //  ResultSet rs = st.executeQuery("SELECT 价格 FROM Sale WHERE 商品编号=4"); 
               ResultSet rs = st.executeQuery("Select * FROM 旅游线路表 WHERE 旅游线路表.旅游路线序号='"+routenum+"'");
               rs.next();
               out.println("<div class='content col-md-5 col-sm-5 col-xs-12 pull-right col-md-offset-1 col-sm-offset-1 col-xs-offset-0 from-right'> ");
               out.println("<h3 class='title'>"+rs.getString(2)+"</h3> ");
               out.println("<div class='details'> <p>行程开始时间： "+rs.getString(3)+"</p></div>");
               out.println("<div class='details'> <p>行程结束时间： "+rs.getString(6)+"</p></div>");
               out.println("<div class='details'> <p>"+rs.getString(4)+"</p></div></div>");
               out.println("<div class='figure col-md-6 col-sm-6 col-xs-12 from-left'> ");
               out.println("<img class='img-responsive' src='"+rs.getString(5)+"' alt='' /></div>");
            }
            catch (Exception e) {
                out.println("</table>捕获异常："+e+"<br>");
            }
        %>
                </div><!--//item-->
                <form action="crtlservlet" method="POST">
                    <div class="wlfg-wrap clearfix">
                           <p align=center>姓名：      <input type="text" name="proname" id="nick"  autocomplete="off"  data-validate="require-nick"  class="moco-form-control"  placeholder="请输入姓名." required="required"/></p>
                           <p align=center>身份证号：      <input type="text" name="proidcard" id="nick"  autocomplete="off"  data-validate="require-nick"  class="moco-form-control"  placeholder="请输入证件号." required="required"/></p>
                           <p align=center>手机号：      <input onkeyup="value=value.replace(/[^\d{1,}]/g,'')" type="text" name="pronumber" id="nick"  autocomplete="off"  data-validate="require-nick"  class="moco-form-control"  placeholder="请输入手机号." required="required"/></p>
                           <p align=center>总人数：      <input onkeyup="value=value.replace(/[^\d{1,}]/g,'')" type="text" name="propm" id="nick"  autocomplete="off"  data-validate="require-nick"  class="moco-form-control"  placeholder="请输入人数." required="required"/></p>
                           <p align=center>儿童人数：      <input onkeyup="value=value.replace(/[^\d{1,}]/g,'')" type="text" name="procm" id="nick"  autocomplete="off"  data-validate="require-nick"  class="moco-form-control"  placeholder="请输入儿童人数." required="required"/></p>
                           <p align=center>其他游客身份证：   <input type="text" name="moreidcard" id="nick"  autocomplete="off"  data-validate="require-nick"  class="moco-form-control" placeholder="请输入证件号."/></p>
                           <input type="hidden" name="routenum" value="<%=routenum%>">
                           <input type="hidden" name="username" value="<%=username.getValue()%>">
                           <input type="submit" value="提交">
                           <input type="hidden" name="hidtype" value="3">
                    </div>
                </form>
                <hr />
        </section>
            
    </div><!--//wrapper-->
    
    <!-- ******FOOTER****** --> 
    <footer class="footer">
        <div class="footer-content">
            <div class="container">
                <div class="row">
                    <div class="footer-col col-md-5 col-sm-7 col-sm-12 about">
                        <div class="footer-col-inner">
                            <h3 class="title">About Us</h3>
                            <p>Maecenas ac vehicula velit, nec facilisis elit. Phasellus non porttitor justo, eu bibendum elit. Maecenas pharetra non ligula quis ultricies. Nulla varius vestibulum ligula quis hendrerit. Maecenas et fermentum massa. Ut hendrerit, nulla fringilla venenatis pulvinar, nisl est adipiscing nunc, quis consequat mi mauris vel felis.</p>
                            <p><a class="more" href="#">Learn more <i class="fa fa-long-arrow-right"></i></a></p>
                            
                        </div><!--//footer-col-inner-->
                    </div><!--//foooter-col-->
                    <div class="footer-col col-md-3 col-sm-4 col-md-offset-1 links">
                        <div class="footer-col-inner">
                            <h3 class="title">Links</h3>
                            <ul class="list-unstyled">
                                <li><a href="#"><i class="fa fa-caret-right"></i>Knowledge Base</a></li>
                                <li><a href="#"><i class="fa fa-caret-right"></i>Jobs</a></li>
                                <li><a href="#"><i class="fa fa-caret-right"></i>Press</a></li>
                                <li><a href="#"><i class="fa fa-caret-right"></i>Terms of services</a></li>
                                <li><a href="#"><i class="fa fa-caret-right"></i>Privacy Policy</a></li>
                            </ul>
                        </div><!--//footer-col-inner-->
                    </div><!--//foooter-col-->                 
                    <div class="footer-col col-md-3 col-sm-12 contact">
                        <div class="footer-col-inner">
                            <h3 class="title">Get in touch</h3>
                            <div class="row">
                                <p class="tel col-md-12 col-sm-4"><i class="fa fa-phone"></i>0800 123 4567</p>
                                <p class="email col-md-12 col-sm-4"><i class="fa fa-envelope"></i><a href="#">support@website.com</a></p>
                                <p class="email col-md-12 col-sm-4"><i class="fa fa-comment"></i><a href="#">Live Chat</a></p>    
                            </div> 
                        </div><!--//footer-col-inner-->            
                    </div><!--//foooter-col-->   
                </div><!--//row-->
            </div><!--//container-->        
        </div><!--//footer-content-->
    </footer><!--//footer-->
    
    <!-- Javascript -->          
    <script type="text/javascript" src="assets/plugins/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script> 
    <script type="text/javascript" src="assets/plugins/bootstrap-hover-dropdown.min.js"></script>
    <script type="text/javascript" src="assets/plugins/jquery-inview/jquery.inview.min.js"></script>
    <script type="text/javascript" src="assets/plugins/isMobile/isMobile.min.js"></script>     
    <script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
    <script type="text/javascript" src="assets/plugins/jquery-placeholder/jquery.placeholder.js"></script>    
    <script type="text/javascript" src="assets/plugins/FitVids/jquery.fitvids.js"></script>
    <script type="text/javascript" src="assets/plugins/flexslider/jquery.flexslider-min.js"></script>    
    <script type="text/javascript" src="assets/js/main.js"></script> 
    
    <!-- Vimeo video API -->
    <script src="http://a.vimeocdn.com/js/froogaloop2.min.js"></script>
    <script type="text/javascript" src="assets/js/vimeo.js"></script> 
    
    <!--[if !IE]>-->
    <script type="text/javascript" src="assets/js/animations.js"></script> 
    <!--<![endif]-->          
</body> 
</html>
