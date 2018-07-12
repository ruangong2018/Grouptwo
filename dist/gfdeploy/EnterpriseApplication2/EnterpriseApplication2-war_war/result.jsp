<%-- 
    Document   : result
    Created on : 2018-7-2, 23:16:42
    Author     : ckz
--%>

<%@page language="java" contentType="text/html;charset=UTF-8" 
        pageEncoding="UTF-8" import="java.net.*"%>
<%@page import = "java.io.*,java.util.*,java.sql.*" %>
<%@page import = "javax.servlet.http.*,javax.servlet.*" %>
<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
<head>
    <title>result</title>
    <!-- Meta -->
    <meta charset="GB2312">
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
    <link rel="stylesheet" href="style.css">
    <!-- Theme CSS -->  
    <link id="theme-style" rel="stylesheet" href="assets/css/styles.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->    
    <!--style type="text/css">
            .div1{  width: 40px; height: 20px; background-color: white; margin:0 auto} 
            .div2{ width: 700px ; height: 50px; background-color: white;}

            .div22{
                margin-left: 400px;margin-top: 10px;
            }
    </style-->
    <style type="text/css">
        
.filter-wrap {
    text-decoration:none;
    text-align:center;
    height: auto;
    padding: 30px 0 15px;
    position: relative;
    border-bottom: 1px solid #e5e9ef;
    display: table;
    width: 100%
}


.filter-wrap .filter-item {
    text-decoration:none;
    float: left;
    padding-left: 12px;
    padding-right: 12px;
    border-radius: 6px;
    margin-right: 22.5px
}

.filter-wrap .filter-item a {
    text-decoration:none;
    color: #222;
    font-size: 18px;
    line-height: 30px
}


.filter-wrap .filter-item.active {
    text-decoration:none;
    background-color: #00a1d6
}

.filter-wrap .filter-item.active a {
    text-decoration:none;
    color: #fff
}

.filter-wrap .filter-item:not(.active):hover a {
    color: #00a1d6
}
    </style>
</head> 

<body>

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
        <!-- 传参,搜索参数-->
        <%
            String search =new String(request.getParameter("search").getBytes("ISO-8859-1"),"UTF-8");
        %> 
        <div class="head">
            <br>
            <br>
        </div>
        
        <!-- 搜索栏-->
        <!--div class="div1"><%--search d1--%>
            <form><%--class="search-form"--%>
                <tr><input type="text" name="search" placeholder=<%--=search--%> ><button type="submit" class="btn btn-cta btn-cta-primary" value="搜索"></button></tr>
            </form>
	</div-->
        <div class="fixed-container">
            <div class="signup" style="height: 60">
                    <div class="container text-center">
                        <form class="signup-form">
                            <div class="form-group">
                                <label class="sr-only" for="semail1">keywords</label>
                                <input type="text" name="search" class="form-control" placeholder=<%=search%>>
                            </div>
                            <button type="submit" class="btn btn-cta btn-cta-primary">搜索</button>
                        </form><!--//signup-form-->
                    </div><!--//contianer-->
                </div><!--//signup-->
            </div>
        
        <!-- 排序条件选择-->
         <%
            String getorder =request.getParameter("order");
            String order="标题";
            if(getorder==null){
                order="标题";
                getorder="def";
            }else if(getorder.equals("sdate")){
                order="行程开始日期";
            }else if(getorder.equals("price")){
                order="价格";
            }else if(getorder.equals("durtime")){
                order="datediff(DAY,行程开始日期,行程结束日期) desc";
            }else{
                order="标题";
            }
        %> 
        <%
            int curPage=1;//当前的页码  
            int maxPage;//总的页数  
            int maxRows=0;//总的行数  
            int rowsPerPage=3;//每页的行数 
        %>
        
            
        <div class="filter-wrap">
            <ul style="list-style-type:none;display:inline-block;">
                <li id="def" class="filter-item active">
                    <a href="result.jsp?search=<%=search%>" style="text-decoration:none;">默认排序</a>
                </li>
                <li id="sdate" class="filter-item">
                    <a href="result.jsp?search=<%=search%>&order=sdate" style="text-decoration:none;">最近时间</a>
                </li>
                <li id="price" class="filter-item">
                    <a href="result.jsp?search=<%=search%>&order=price" style="text-decoration:none;">最低价格</a>
                </li>
                <li id="durtime" class="filter-item">
                    <a href="result.jsp?search=<%=search%>&order=durtime" style="text-decoration:none;">最长行程</a>
                </li>
            </ul>
           
        </div>
        <script>
            var a1=document.getElementById('def');
            var a2=document.getElementById('<%=getorder%>');
            a1.className='filter-item'
            a2.className='filter-item active'
        </script>
        <br>
        <!-- 连接数据库-->
        <sql:setDataSource var="snapshot" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                           url="jdbc:sqlserver://localhost:1433;DatabaseName=test"
                           user="root" password="root"/>
        <!-- 结果数量 -->
        <sql:query dataSource = "${snapshot}" var="result">
        SELECT count(*) count
            from 旅游线路组织表 join 旅游线路表 on 旅游线路组织表.旅游线路序号=旅游线路表.旅游路线序号 
            join 合作企业用户表 on 合作企业用户表.企业注册序号=旅游线路组织表.旅行社编号
                where 旅游线路表.包含主要景点 like '%<%=search%>%' or 企业名称 like '%<%=search%>%'
                or 标题 like '%<%=search%>%';
        
        </sql:query> 
        
        <!-- 设置分页参数-->
       
        <c:forEach var="row" items="${result.rows}">
            <c:set value="${row.count}" var="maxRows" scope="request" />
            <% 
                maxRows=Integer.parseInt(request.getAttribute("maxRows").toString()); 
                //out.print(maxRows);
            %>
        </c:forEach>
        <%
            if(maxRows%rowsPerPage==0){
                maxPage=maxRows/rowsPerPage;
                
            }else{
                maxPage=maxRows/rowsPerPage+1;
            }
            String temp=request.getParameter("page");
            if(temp==null){
                temp="1";
            }else{
                curPage=Integer.parseInt(temp);
            }
            int top =rowsPerPage*(curPage-1);
            
        %>
        <!--搜索-->
        <sql:query dataSource = "${snapshot}" var="result">
            SELECT top <%=rowsPerPage%> 旅游线路序号,包含主要景点,行程开始日期,行程结束日期,价格,标题,图片,企业名称
            from 旅游线路组织表 join 旅游线路表 on 旅游线路组织表.旅游线路序号=旅游线路表.旅游路线序号 
            join 合作企业用户表 on 合作企业用户表.企业注册序号=旅游线路组织表.旅行社编号
                where (旅游线路表.包含主要景点 like '%<%=search%>%' or 企业名称 like '%<%=search%>%'
                or 标题 like '%<%=search%>%' ) and 旅游线路序号 not in
                (select top <%=top%> 旅游线路序号
                from 旅游线路组织表 join 旅游线路表 on 旅游线路组织表.旅游线路序号=旅游线路表.旅游路线序号 
            join 合作企业用户表 on 合作企业用户表.企业注册序号=旅游线路组织表.旅行社编号
                where 旅游线路表.包含主要景点 like '%<%=search%>%' or 企业名称 like '%<%=search%>%'
                or 标题 like '%<%=search%>%' order by <%=order%> ) order by <%=order%>;
        </sql:query> 
        <!--搜索结果-->
        <c:forEach var="row" items="${result.rows}">
            
            <div class="list-wrap" style="margin: 0 auto;width: 900px;padding: 20px 0 20px 0;
                    position: relative;border-bottom: 1px solid #e5e9ef;height: 145px;text-align:center;" >
                <div id="picture" style="float: left;width: 160px;height: 100px;">
                        <img src="pic-src/${row.图片}" width="160px" height="100px"/>
                </div>
                <div id="info" style="float: left;width: 560px;height: 100px;text-align: left;padding: 0 0 0 20px">
                    <a title="title" href="detail.jsp?detail=${row.旅游线路序号}&username=<%=username%>" target="_blank" style="font-size: 22px;text-decoration:none;color: #000000;padding:0 0 2px 0;">
                            <c:out value="${row.标题}"/>
                    </a>
                    <div style="color: #666666;white-space: nowrap;" >
                        <div style="padding: 2px 0 5px 0">
                        <c:out value="${row.行程开始日期}"/>至<c:out value="${row.行程结束日期}"/>
                        </div>
                        包含主要景点:<c:out value="${row.包含主要景点}"/>
                        <br>
                        <div style="color: #999999">
                        旅行社:<c:out value="${row.企业名称}"/>
                        </div>
                    </div>
                </div>
                <div id="price" style="float: left;width: 180px;height: 100px;text-align: left;padding: 5px 0 0 10px">
                    <strong style="color: #e4393c;font-weight: 400;font-family: Verdana;font-size:23px; ">
                        <em>¥</em>
                        <strong>${row.价格}</strong>
                    </strong>    
                </div>
            </div>
        </c:forEach> 
        <br/>
        <p>
            <br/>
        </p>
        <div style="margin: 0 auto;text-align: center" >
       
        <% if(curPage>1){ %>
            <a href="result.jsp?search=<%=search%>&order=<%=getorder%>&page=<%=curPage-1%>">上一页</a>
        <% } %>
        &#160; 
        
        总页数: <%=maxPage%>&#160;&#160;&#160;
        当前页数:<%=curPage%>
        
        &#160;
        <% if(curPage<maxPage){ %>
        <a href="result.jsp?search=<%=search%>&order=<%=getorder%>&page=<%=curPage+1%>">下一页</a>
        <% } %>
        
        </div>
        
        
        <p>
            <br/><br/>
        </p>
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
