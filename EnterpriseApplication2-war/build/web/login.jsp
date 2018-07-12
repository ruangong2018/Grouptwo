<%-- 
    Document   : login
    Created on : 2018-7-3, 15:30:31
    Author     : jockma
--%>

<%@page contentType="text/html" pageEncoding="gb2312"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>系统登录界面</title>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
</head> 
    <center><body class="home-page">
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
                            <li class="active nav-item"><a href="mainpage.jsp">主页</a></li>
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
        <h1>用户注册登录</h1>
        
        <form method="POST" action="crtlservlet">
            
            <table border="2" >
                <tr>
                    <th>账号：</th>
                    <th><INPUT TYPE="TEXT" NAME="id"><p></th>
                </tr>
                <tr>
                    <th>密码：</th>
                    <th><INPUT TYPE="PASSWORD" NAME="psd"><p></th>
                </tr>
                <tr>
                    <th>登录方式：</th>
                    <th>
                        <input type="radio" name="radio1" checked="checked" value="1" id="vistor"/><label for="vistor">游客登录</label>
                        <input type="radio" name="radio1" value="2" id="copemate"/><label for="copemate">合作用户登录</label>
                    </th>
                </tr>
                <table border="1">
                    <tr>
                    <th><input type="submit" value="提交"></th>
                    <th><input type="reset" value="重置"</th>
                    <th><input type="button" value="游客注册" onclick="javascrtpt:window.location.href='register1.jsp'"></th>
                    <th><input type="button" value="合作用户注册" onclick="javascrtpt:window.location.href='register2.jsp'"></th>
                </tr>
                </table>         
            </table>
            <input type="hidden" name="hidtype" value="1">
        </form>
        
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

