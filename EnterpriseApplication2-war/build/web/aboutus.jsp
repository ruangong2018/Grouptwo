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
                        <span class="logo-title">������Ϣ����ϵͳ</span>
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
                            <li class="nav-item"><a href="mainpage.jsp">��ҳ</a></li>
                            <!--li class="nav-item"><a href="tour.html">Tour</a></li-->
                            <li class="active nav-item"><a href="aboutus.jsp">��������</a></li>
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
                                    out.println("<li class='nav-item'><a href='login.jsp'>��¼</a></li> ");
                                }
                                else if(username.getName()!=null)
                                {
                                    out.println("<li class='nav-item dropdown'> ");
                                    out.println("<a class='dropdown-toggle' data-toggle='dropdown' data-hover='dropdown' data-delay='0' data-close-others='false' href='blog.html'>"+username.getValue()+"<i class='fa fa-angle-down'></i></a> ");
                                    out.println("<ul class='dropdown-menu'><li><a href='personal.jsp'>��������</a></li> <li><a href='makesure.jsp'>ע��</a></li></ul></li>");
                                }
                            %>
                            <%--li class="nav-item"><a href="login.jsp">��¼</a></li--%>                           
                            <li class="nav-item dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false" href="blog.html">ע�� <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="register1.jsp">�ο�ע��</a></li>
                                    <li><a href="register2.jsp">��ҵע��</a>
                                </ul>
                            </li><!--//dropdown--> 
                            
                        </ul><!--//nav-->
                    </div><!--//navabr-collapse-->
                </nav><!--//main-nav-->           
            </div><!--//container-->
        </header><!--//header-->
        
        <section id="faq" class="faq section has-bg-color">
            <div class="container">
                <h2 class="title text-center">��������</h2>
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a data-parent="#accordion"
                                data-toggle="collapse" class="panel-toggle" href="#faq1"><i class="fa fa-plus-square"></i>�������Ŷ���ôѡ?</a></h4>
                            </div>
                
                            <div class="panel-collapse collapse" id="faq1">
                                <div class="panel-body">
                                    �����ҵ��г̿�ԣ�������ࡢ�ͱ�ߵ��Ŷ�
                                </div>
                            </div>
                        </div><!--//panel-->
                
                        <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a data-parent="#accordion"
                                data-toggle="collapse" class="panel-toggle" href="#faq2"><i class="fa fa-plus-square"></i>�������г���ô����</a></h4>
                            </div>
                
                            <div class="panel-collapse collapse" id="faq2">
                                <div class="panel-body">
                                    �����Ҿ��㡢��·�ߡ��ҾƵ�
                                </div>
                            </div>
                        </div><!--//panel-->
                
                        <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a data-parent="#accordion"
                                                           data-toggle="collapse" class="panel-toggle" href="#faq3"><i class="fa fa-plus-square"></i>�������л��ǹ�������?</a></h4>
                            </div>
                
                            <div class="panel-collapse collapse" id="faq3">
                                <div class="panel-body">
                                    ���ڹ��⾰�㹩��ѡ��
                                </div>
                            </div>
                        </div><!--//panel-->
                        
                        <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a data-parent="#accordion"
                                data-toggle="collapse" class="panel-toggle" href="#faq4"><i class="fa fa-plus-square"></i>��Ȼ��������?</a></h4>
                            </div>
                
                            <div class="panel-collapse collapse" id="faq4">
                                <div class="panel-body">
                                    ������Ȼ�����¡��������ĵ��黳
                                </div>
                            </div>
                        </div><!--//panel--> 
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a data-parent="#accordion"
                                data-toggle="collapse" class="panel-toggle" href="#faq5"><i class="fa fa-plus-square"></i>��������?</a></h4>
                            </div>
                
                            <div class="panel-collapse collapse" id="faq5">
                                <div class="panel-body">
                                    �����Ρ������Ρ�������
                                </div>
                            </div>
                        </div><!--//panel-->
                
                        <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a data-parent="#accordion"
                                data-toggle="collapse" class="panel-toggle" href="#faq6"><i class="fa fa-plus-square"></i>�����˶�?</a></h4>
                            </div>
                
                            <div class="panel-collapse collapse" id="faq6">
                                <div class="panel-body">
                                    3���ھ����˶�
                                </div>
                            </div>
                        </div><!--//panel-->
                
                        <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a data-parent="#accordion"
                                data-toggle="collapse" class="panel-toggle" href="#faq7"><i class="fa fa-plus-square"></i>����ʹ��?</a></h4>
                            </div>
                
                            <div class="panel-collapse collapse" id="faq7">
                                <div class="panel-body">
                                    ����롢��ʼ��������ʼ����
                                </div>
                            </div>
                        </div><!--//panel-->
                        
                        <div class="panel">
                            <div class="panel-heading">
                                <h4 class="panel-title"><a data-parent="#accordion"
                                data-toggle="collapse" class="panel-toggle" href="#faq8"><i class="fa fa-plus-square"></i>��ҵ����?</a></h4>
                            </div>
                
                            <div class="panel-collapse collapse" id="faq8">
                                <div class="panel-body">
                                    ѡ����ҵע�᷽ʽ
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
