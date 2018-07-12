<%-- 
    Document   : mainpage
    Created on : 2018-7-2, 20:03:46
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>mainpage</title>
    <!-- Meta -->
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<body class="home-page">

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
        
        <!-- ******PROMO****** --> 
        <section id="promo" class="promo section">  
            <div class="container intro">
                <h2 class="title">欢迎使用<br />旅游网站自助系统</h2>
                <p class="summary">开启想要的旅游~</p>
                <a class="btn btn-cta btn-cta-secondary" href="aboutus.jsp">了解更多</a>
            </div><!--//intro-->
            
            <div class="fixed-container">
                <div class="signup">
                    <div class="container text-center">
                        <h3 class="title">查询</h3>
                        <p class="summary">车辆/酒店/景点</p>
                        <form class="signup-form" action="result.jsp?page=1" method="GET">
                            <div class="form-group">
                                <label class="sr-only" for="semail1">keywords</label>
                                <input type="text" name="search" class="form-control" placeholder="输入查询信息">
                                <input type="hidden" name="username" value="<%=username%>">
                            </div>
                            <button type="submit" class="btn btn-cta btn-cta-primary">搜索</button>
                        </form><!--//signup-form-->
                    </div><!--//contianer-->
                </div><!--//signup-->
                <div class="social text-center">
                    <div class="container">
                        <span class="line"> 选择你喜欢的版块:</span> 
                        
                        <!--//twitter tweet button code starts -->
                        <div class="twitter-tweet">
                            <a href="https://twitter.com/share" class="twitter-share-button" data-via="3rdwave_media" data-hashtags="bootstrap">Tweet</a><script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
                        </div>
                        <!--//twitter tweet button code ends -->
                        
                        <!--//facebook like button code starts-->
                        <div class="fb-like" data-href="tempo/" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true" ></div>
                        <!--//facebook like button code ends-->      
                    </div>         
                </div><!--//social-->   
            </div>  
            <div class="bg-slider-wrapper">
                <div id="bg-slider" class="flexslider bg-slider">
                    <ul class="slides">
                        <li class="slide slide-1"></li>
                        <li class="slide slide-2"></li>
                        <li class="slide slide-3"></li>
                    </ul>
                </div>
            </div><!--//bg-slider-wrapper--> 
        </section><!--//promo-->
        <div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>
        
        <!-- ******PRESS****** --> 
        <div class="press">
            <div class="container text-center">
                <div class="row">
                    <ul class="list-unstyled">
                        <li class="col-md-2 col-sm-4 col-xs-6">国内游<a href="result.jsp?page=1&search=北工大"><img class="img-responsive" src="assets/images/press/press-7.png" alt=""></a></li>
                        <li class="col-md-2 col-sm-4 col-xs-6">国外游<a href="#"><img class="img-responsive" src="assets/images/press/press-9.png" alt=""></a></li>
                        <li class="col-md-2 col-sm-4 col-xs-6 xs-break">人文景观<a href="#"><img class="img-responsive" src="assets/images/press/press-8.png" alt=""></a></li>                    
                        <li class="col-md-2 col-sm-4 col-xs-6 sm-break">自然景观<a href="#"><img class="img-responsive" src="assets/images/press/press-10.png" alt=""></a></li>
                        <li class="col-md-2 col-sm-4 col-xs-6 xs-break">亲子游<a href="#"><img class="img-responsive" src="assets/images/press/press-11.png" alt=""></a></li>
                        <li class="col-md-2 col-sm-4 col-xs-6">情侣游<a href="#"><img class="img-responsive" src="assets/images/press/press-12.png" alt=""></a></li>
                    </ul>
                </div>
            </div>
        </div><!--//press-->  
            
        <!-- ******WHY****** --> 
        <section id="why" class="why section">
            <div class="container">
                <h2 class="title text-center">推荐线路</h2>
                <p class="intro text-center">多跳线路供您选择</p>
                <div class="row">
                    <div class="benefits col-md-7 col-sm-6 col-xs-12">                    
                        
                        <div class="item clearfix">    <!--item clearfix-->
                            <div class="icon col-md-3 col-xs-12 text-center">
                                <span class="pe-icon pe-7s-rocket"></span>
                            </div><!--//icon-->
                            <div class="content col-md-9 col-xs-12">
                                    <h3 class="title">Brings you consectetuer adipiscing elit</h3>
                                    <p class="desc">State a benefit of your product/services here. You can change the icon on the left to any of the 500+ <a href="http://fortawesome.github.io/Font-Awesome/icons/" target="_blank">FontAwesome icons</a> available. Maecenas ultrices pellentesque nisi, eu volutpat nunc. </p>
                            </div><!--//content-->                            
                        </div><!--//item-->
                        <div class="item clearfix">                            
                            <div class="icon col-md-3  col-xs-12 text-center">
                                <span class="pe-icon pe-7s-piggy"></span>
                            </div><!--//icon-->
                            <div class="content col-md-9 col-xs-12">
                                <h3 class="title">No more velit tristique condimentum</h3>
                                <p class="desc">State a benefit of your product/services here. You can change the icon on the left to any of the 500+ <a href="http://fortawesome.github.io/Font-Awesome/icons/" target="_blank">FontAwesome icons</a> available. Maecenas ultrices pellentesque nisi, eu volutpat nunc. </p>
                            </div><!--//content-->
                        </div><!--//item-->
                        <div class="item clearfix">                            
                            <div class="icon col-md-3  col-xs-12 text-center">
                                <span class="pe-icon pe-7s-users"></span>
                            </div><!--//icon-->
                            <div class="content col-md-9 col-xs-12">
                                <h3 class="title">Connect lectus ultricies dolor vulputate</h3>
                                <p class="desc">State a benefit of your product/services here. You can change the icon on the left to any of the 500+ <a href="http://fortawesome.github.io/Font-Awesome/icons/" target="_blank">FontAwesome icons</a> available. Maecenas ultrices pellentesque nisi, eu volutpat nunc. </p>
                            </div><!--//content-->
                        </div><!--//item-->
                        <div class="item clearfix">
                            <div class="icon col-md-3  col-xs-12 text-center">
                                <span class="pe-icon pe-7s-bicycle"></span>
                            </div><!--//icon-->
                            <div class="content col-md-9 col-xs-12">
                                <h3 class="title">Liberate vulputate eleifend tellus</h3>
                                <p class="desc">State a benefit of your product/services here. You can change the icon on the left to any of the 500+ <a href="http://fortawesome.github.io/Font-Awesome/icons/" target="_blank">FontAwesome icons</a> available. Maecenas ultrices pellentesque nisi, eu volutpat nunc. Cras pharetra turpis pharetra iaculis euismod.</p>
                            </div><!--//content-->
                        </div><!--//item-->
                        <div class="item last clearfix">
                            <div class="icon col-md-3  col-xs-12 text-center">
                                <span class="pe-icon pe-7s-joy"></span>
                            </div><!--//icon-->
                            <div class="content col-md-9 col-xs-12">
                                <h3 class="title">Helps laoreet auctor libero</h3>
                                <p class="desc">State a benefit of your product/services here. You can change the icon on the left to any of the 500+ <a href="http://fortawesome.github.io/Font-Awesome/icons/" target="_blank">FontAwesome icons</a> available. Maecenas ultrices pellentesque nisi, eu volutpat nunc. Pellentesque fermentum purus nec mi vulputate interdum. Ut eu vulputate mi, nec imperdiet enim. Ut faucibus faucibus turpis et luctus. Quisque bibendum tristique purus eu pulvinar. Cras pharetra turpis pharetra iaculis euismod. Nullam ac ullamcorper turpis, quis tristique dui.</p>
                            </div><!--//content-->
                        </div><!--//item-->
                        <div class="clearfix"></div>
                        <div class="text-center">
                            <a class="btn btn-cta btn-cta-secondary" href="tour.html" >Learn how it works</a>
                        </div>
                    </div> 
                    <!--//people-->
                        </div><!--//item-->
                    </div>                   
                </div><!--//row-->
            </div><!--//container-->
        </section><!--//why-->
       
            
    </div><!--//wrapper-->
    
    <!-- ******FOOTER****** --> 
    <footer class="footer">
        <div class="bottom-bar">
            <div class="container">
                <div class="row">
                    <small class="copyright col-md-6 col-sm-6 col-xs-12">有 bug 请联系 xxxxxxxxxx </small>
                    <ul class="social col-md-6 col-sm-6 col-xs-12 list-inline">
                        <li><a href="#" ><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#" ><i class="fa fa-facebook"></i></a></li>                        
                        <li><a href="#" ><i class="fa fa-linkedin"></i></a></li>
                        <li class="last"><a href="#" ><i class="fa fa-youtube"></i></a></li>
                    </ul><!--//social-->
                </div><!--//row-->
            </div><!--//container-->
        </div><!--//bottom-bar-->
    </footer><!--//footer-->
    
    <!-- Login Modal -->
    <div class="modal modal-login" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 id="loginModalLabel" class="modal-title text-center">Log in to your account</h4>
                </div>
                <div class="modal-body">
                    <div class="social-login text-center">                        
                        <ul class="list-unstyled social-login">
                            <li><button class="twitter-btn btn" type="button"><i class="fa fa-twitter"></i>Log in with Twitter</button></li>
                            <li><button class="facebook-btn btn" type="button"><i class="fa fa-facebook"></i>Log in with Facebook</button></li>
                            <li><button class="google-btn btn" type="button"><i class="fa fa-google-plus"></i>Log in with Google</button></li>
                        </ul>
                    </div>
                    <div class="divider"><span>Or</span></div>
                    <div class="login-form-container">
                        <form class="login-form">                
                            <div class="form-group email">
                                <label class="sr-only" for="login-email">Your email</label>
                                <input id="login-email" name="login-email" type="email" class="form-control login-email" placeholder="Your email">
                            </div><!--//form-group-->
                            <div class="form-group password">
                                <label class="sr-only" for="login-password">Password</label>
                                <input id="login-password" name="login-password" type="password" class="form-control login-password" placeholder="Password">
                                <p class="forgot-password">
                                    <a href="#" id="resetpass-link" data-toggle="modal" data-target="#resetpass-modal">Forgot password?</a>
                                </p>
                            </div><!--//form-group-->
                            <button type="submit" class="btn btn-block btn-cta-primary">Log in</button>
                            <div class="checkbox remember">
                                <label>
                                    <input type="checkbox"> Remember me
                                </label>
                            </div><!--//checkbox-->
                        </form>
                    </div><!--//login-form-container-->
                </div><!--//modal-body-->
                <div class="modal-footer">
                    <p>New to Tempo? <a class="signup-link" id="signup-link" href="#">Sign up now</a></p>                    
                </div><!--//modal-footer-->
            </div><!--//modal-content-->
        </div><!--//modal-dialog-->
    </div><!--//modal-->
    
    <!-- Signup Modal -->
    <div class="modal modal-signup" id="signup-modal" tabindex="-1" role="dialog" aria-labelledby="signupModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 id="signupModalLabel" class="modal-title text-center">New to Tempo? Sign up now.</h4>
                    <p class="intro text-center">It only takes 3 minutes!</p>
                    <p></p>
                </div>
                <div class="modal-body">
                    <div class="social-login text-center">                        
                        <ul class="list-unstyled social-login">
                            <li><button class="twitter-btn btn" type="button"><i class="fa fa-twitter"></i>Sign up with Twitter</button></li>
                            <li><button class="facebook-btn btn" type="button"><i class="fa fa-facebook"></i>Sign up with Facebook</button></li>
                            <li><button class="google-btn btn" type="button"><i class="fa fa-google-plus"></i>Sign up with Google</button></li>
                        </ul>
                        <p class="note">Don't worry, we won't post anything without your permission.</p>
                    </div>
                    <div class="divider"><span>Or</span></div>
                    <div class="login-form-container">
                        <form class="login-form">                
                            <div class="form-group email">
                                <label class="sr-only" for="signup-email">Your email</label>
                                <input id="signup-email" name="signup-email" type="email" class="form-control login-email" placeholder="Your email">
                            </div><!--//form-group-->
                            <div class="form-group password">
                                <label class="sr-only" for="signup-password">Your password</label>
                                <input id="signup-password" name="signup-password" type="password" class="form-control login-password" placeholder="Password">
                            </div><!--//form-group-->
                            <button type="submit" class="btn btn-block btn-cta-primary">Sign up</button>
                            <p class="note">By signing up, you agree to our terms of services and privacy policy.</p>
                        </form>
                    </div><!--//login-form-container-->
                </div><!--//modal-body-->
                <div class="modal-footer">
                    <p>Already have an account? <a class="login-link" id="login-link" href="#">Log in</a></p>                    
                </div><!--//modal-footer-->
            </div><!--//modal-content-->
        </div><!--//modal-dialog-->
    </div><!--//modal-->
    
    <!-- Reset Password Modal -->
    <div class="modal modal-resetpass" id="resetpass-modal" tabindex="-1" role="dialog" aria-labelledby="resetpassModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 id="resetpassModalLabel" class="modal-title text-center">Password Reset</h4>
                </div>
                <div class="modal-body">
                    <div class="resetpass-form-container">
                        <p class="intro">Please enter your email address below and we'll email you a link to a page where you can easily create a new password.</p>
                        <form class="resetpass-form">                
                            <div class="form-group email">
                                <label class="sr-only" for="reg-email">Your email</label>
                                <input id="reg-email" name="reg-email" type="email" class="form-control login-email" placeholder="Your email">
                            </div><!--//form-group-->
                            <button type="submit" class="btn btn-block btn-cta-primary">Reset Password</button>
                        </form>
                    </div><!--//login-form-container-->
                </div><!--//modal-body-->
                <div class="modal-footer">
                    <p>I want to <a class="back-to-login-link" id="back-to-login-link" href="#">return to login</a></p>                    
                </div><!--//modal-footer-->
            </div><!--//modal-content-->
        </div><!--//modal-dialog-->
    </div><!--//modal-->
    
    <!-- *****CONFIGURE STYLE****** -->
    <div class="config-wrapper">
        <div class="config-wrapper-inner">
            <a id="config-trigger" class="config-trigger" href="#"><i class="fa fa-cog"></i></a>
            <div id="config-panel" class="config-panel">
                <h5>Choose Colour</h5>
                <ul id="color-options" class="list-unstyled list-inline">
                    <li class="theme-1 active" ><a data-style="assets/css/styles.css" href="#"></a></li>
                    <li class="theme-2"><a data-style="assets/css/styles-2.css" href="#"></a></li>
                    <li class="theme-3"><a data-style="assets/css/styles-3.css" href="#"></a></li>
                    <li class="theme-4"><a data-style="assets/css/styles-4.css" href="#"></a></li>                   
                    <li class="theme-5"><a data-style="assets/css/styles-5.css" href="#"></a></li>                     
                    <li class="theme-6"><a data-style="assets/css/styles-6.css" href="#"></a></li>
                    <li class="theme-7"><a data-style="assets/css/styles-7.css" href="#"></a></li>
                    <li class="theme-8"><a data-style="assets/css/styles-8.css" href="#"></a></li>                    
                    <li class="theme-9"><a data-style="assets/css/styles-9.css" href="#"></a></li>
                    <li class="theme-10"><a data-style="assets/css/styles-10.css" href="#"></a></li>
                </ul><!--//color-options-->
                <a id="config-close" class="close" href="#"><i class="fa fa-times-circle"></i></a>
            </div><!--//configure-panel-->
        </div><!--//config-wrapper-inner-->
    </div><!--//config-wrapper-->
 
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




