<%-- 
    Document   : aboutus
    Created on : 2018-7-12, 3:21:56
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="gb2312"%>
<!DOCTYPE html>
<html>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>aboutus</title>
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
                            <li class="active nav-item"><a href="aboutus.jsp">关于我们</a></li>
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
        
        <section id="faq" class="faq section has-bg-color">
            <div class="container">
                <h2 class="title text-center">关于我们</h2>
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a data-parent="#accordion"
                                data-toggle="collapse" class="panel-toggle" href="#faq1"><i class="fa fa-plus-square"></i>组团游团队怎么选?</a></h4>
                            </div>
                
                            <div class="panel-collapse collapse" id="faq1">
                                <div class="panel-body">
                                    帮你找到行程宽裕、好评多、餐标高的团队
                                </div>
                            </div>
                        </div><!--//panel-->
                
                        <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a data-parent="#accordion"
                                data-toggle="collapse" class="panel-toggle" href="#faq2"><i class="fa fa-plus-square"></i>自由行行程怎么定？</a></h4>
                            </div>
                
                            <div class="panel-collapse collapse" id="faq2">
                                <div class="panel-body">
                                    帮你找景点、找路线、找酒店
                                </div>
                            </div>
                        </div><!--//panel-->
                
                        <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a data-parent="#accordion"
                                                           data-toggle="collapse" class="panel-toggle" href="#faq3"><i class="fa fa-plus-square"></i>出国旅行还是国内旅行?</a></h4>
                            </div>
                
                            <div class="panel-collapse collapse" id="faq3">
                                <div class="panel-body">
                                    国内国外景点供您选择
                                </div>
                            </div>
                        </div><!--//panel-->
                        
                        <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a data-parent="#accordion"
                                data-toggle="collapse" class="panel-toggle" href="#faq4"><i class="fa fa-plus-square"></i>自然还是人文?</a></h4>
                            </div>
                
                            <div class="panel-collapse collapse" id="faq4">
                                <div class="panel-body">
                                    既有自然的清新、又有人文的情怀
                                </div>
                            </div>
                        </div><!--//panel--> 
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a data-parent="#accordion"
                                data-toggle="collapse" class="panel-toggle" href="#faq5"><i class="fa fa-plus-square"></i>特殊旅游?</a></h4>
                            </div>
                
                            <div class="panel-collapse collapse" id="faq5">
                                <div class="panel-body">
                                    亲子游、情侣游、蜜月游
                                </div>
                            </div>
                        </div><!--//panel-->
                
                        <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a data-parent="#accordion"
                                data-toggle="collapse" class="panel-toggle" href="#faq6"><i class="fa fa-plus-square"></i>订单退订?</a></h4>
                            </div>
                
                            <div class="panel-collapse collapse" id="faq6">
                                <div class="panel-body">
                                    3天内均可退订
                                </div>
                            </div>
                        </div><!--//panel-->
                
                        <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a data-parent="#accordion"
                                data-toggle="collapse" class="panel-toggle" href="#faq7"><i class="fa fa-plus-square"></i>怎样使用?</a></h4>
                            </div>
                
                            <div class="panel-collapse collapse" id="faq7">
                                <div class="panel-body">
                                    别多想、开始搜索、开始旅行
                                </div>
                            </div>
                        </div><!--//panel-->
                        
                        <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a data-parent="#accordion"
                                data-toggle="collapse" class="panel-toggle" href="#faq8"><i class="fa fa-plus-square"></i>商业合作?</a></h4>
                            </div>
                
                            <div class="panel-collapse collapse" id="faq8">
                                <div class="panel-body">
                                    选定企业注册方式
                                </div>
                            </div>
                        </div><!--//panel--> 
                    </div>
                </div><!--//row-->
            </div><!--//container-->        
        </section><!--//faq-->
        
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
