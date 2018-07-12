<%-- 
    Document   : companypage
    Created on : 2018-7-12, 5:17:13
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language ="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>companypage</title>
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
    <link rel="stylesheet" href="assets/plugins/flexslider/flexslider.css">
    <!-- Theme CSS -->  
    <link id="theme-style" rel="stylesheet" href="assets/css/styles.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]--> 
    
    <script type="text/javascript">

        window.onload = function(){
        if(location.href.indexOf('#reloaded')==-1){
        location.href=location.href+"#reloaded";
        location.reload();
        }
    }
</script>
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
                            <li class="active nav-item"><a href="companypage.jsp">主页</a></li>
                            <!--li class="nav-item"><a href="tour.html">Tour</a></li-->
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
                                    out.println("<a class='dropdown-toggle' data-toggle='dropdown' data-hover='dropdown' data-delay='0' data-close-others='false' href='blog.html'>"+java.net.URLDecoder.decode(username.getValue(),"UTF-8")+"<i class='fa fa-angle-down'></i></a> ");
                                    out.println("<ul class='dropdown-menu'><li><a href='makesure.jsp'>注销</a></li></ul></li>");
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
        
        <div class="fixed-container">
                <div class="signup">
                    <div class="container text-center">
                        <form class="signup-form" action="public.jsp">
                            <button type="submit" class="btn btn-cta btn-cta-primary">发布新信息</button>
                            <input type="hidden" name="hidtype" value="4">
                        </form><!--//signup-form-->
                    </div><!--//contianer-->
                </div><!--//signup-->
            </div>    
        <%
            try{
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url="jdbc:sqlserver://localhost:1433;DatabaseName=test";
                Connection con =DriverManager.getConnection(url,"root","root");
                Statement st = con.createStatement();	// SQL语句
                Statement st1 = con.createStatement();
                ResultSet rs = st.executeQuery("Select 企业注册序号 FROM 合作企业用户表 WHERE 合作企业用户表.企业名称='"+java.net.URLDecoder.decode(username.getValue(),"UTF-8")+"'");
                rs.next();
                String usenum=rs.getString(1);
                rs=st.executeQuery("Select 旅游线路序号 FROM 旅游线路组织表 WHERE 旅游线路组织表.旅行社编号='"+usenum+"'");
                ResultSet rs1;
                while(rs.next())
                {
                    String route_num=rs.getString(1);
                    rs1=st1.executeQuery("Select 标题,图片,行程开始日期,行程结束日期,包含主要景点 FROM 旅游线路表 WHERE 旅游线路表.旅游路线序号='"+route_num+"'");
                    rs1.next();
                    out.println("<div class='list-wrap' style='margin: 0 auto;width: 900px;padding: 20px 0 20px 0;position: relative;border-bottom: 1px solid #e5e9ef;height: 145px;text-align:center;' >");
                    out.println("<div id='picture' style='float: left;width: 160px;height: 100px;'>");
                    out.println("<img src='"+rs1.getString(2)+"' width='160px' height='100px'/></div>");
                    out.println("<div id='info' style='float: left;width: 560px;height: 100px;text-align: left;padding: 0 0 0 20px'>");
                    out.println("<a title='title' href='#' target='_blank' style='font-size: 22px;text-decoration:none;color: #000000;padding:0 0 2px 0;'>");
                    out.println(""+rs1.getString(1)+"</a>");
                    out.println("<div style='color: #666666;white-space: nowrap;' ><div style='padding: 2px 0 5px 0'>");
                    out.println(""+rs1.getString(3)+"至"+rs1.getString(4)+"</div>");
                    out.println("包含主要景点:"+rs1.getString(5)+"<br>");
                    out.println("</div></div>");
                    rs1=st1.executeQuery("Select 价格 FROM 旅游线路组织表 WHERE 旅游线路组织表.旅游线路序号='"+route_num+"'");
                    rs1.next();
                    out.println(" <div id='price' style='float: left;width: 180px;height: 100px;text-align: left;padding: 5px 0 0 10px'>");
                    out.println("<strong style='color: #e4393c;font-weight: 400;font-family: Verdana;font-size:23px; '>");
                    out.println("<em>¥</em><strong>"+rs1.getString(1)+"</strong></strong>");
                    out.println("</div></div>");
                }
            }
            catch (Exception e) {
                out.println("</table>捕获异常："+e+"<br>");
            }
        %>
        
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
