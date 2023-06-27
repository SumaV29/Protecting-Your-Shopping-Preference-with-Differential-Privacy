<%-- 
    Document   : index
    Created on : 9 Apr, 2021, 5:00:44 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Protecting Your Shopping Preference</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <!-- Load Require CSS -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font CSS -->
        <link href="assets/css/boxicon.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
        <!-- Load Template CSS -->
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="assets/css/custom.css">
    </head>
    <%
        if (request.getParameter("Product_puchased") != null) {
    %>
    <script>alert('Puchased Successfully');</script>
    <%            }
    %>
    <body>
        <!-- Header -->
        <nav id="main_nav" class="navbar navbar-expand-lg navbar-light bg-white shadow">
            <div class="container d-flex justify-content-between align-items-center">
                <a class="navbar-brand h1">
                    <i class='bx bx-buildings bx-sm text-dark'></i>
                </a>
                <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-toggler-success" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="navbar-toggler-success">
                    <div class="flex-fill mx-xl-5 mb-2">
                        <ul class="nav navbar-nav mx-xl-5 text-center text-dark">
                            <li class="nav-item">
                                <a class="nav-link btn-outline-primary rounded-pill px-3" href="User_Home.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active btn-outline-primary rounded-pill px-3" href="Products.jsp">Products</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn-outline-primary rounded-pill px-3" href="Purchase_details1.jsp">Purchase Details</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn-outline-primary rounded-pill px-3" href="index.jsp">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Close Header -->
        <!-- Start Banner Hero -->
        <div id="work_banner" class="banner-wrapper bg-light w-100 py-5">
            <div class="banner-vertical-center-work container text-light d-flex justify-content-center align-items-center py-5 p-0">
                <div class="banner-content col-lg-8 col-12 m-lg-auto text-center">
                    <h1 style="color: #3366ff;" class="banner-heading h2 display-3 pb-5 semi-bold-600 typo-space-line-center">
                        Protecting Your Shopping Preference with Differential Privacy
                    </h1>
                </div>
            </div>
        </div>
        <section class="container py-5">
            <div class="col-lg-9">
                <form action="Search_action.jsp" method="post">
                    <h3>Search product</h3>
                    <div class="col-lg-6 mb-4">
                        <div class="form-group mb-4">
                            <select class="form-control" name="category" required="required">
                                <option value="" style="color: black;">--Category--</option>
                                <option style="color: black;">Mobile</option>
                                <option style="color: black;">Laptop</option>
                                <option style="color: black;">Accessories</option>
                                <option style="color: black;">Electronics</option>
                                <option style="color: black;">Others</option>
                            </select>
                        </div>
                        <div class="col-lg-6 mb-4">
                            <div class="form-group mb-4">
                                <button type="submit" class="btn btn-success">
                                    <i class='bx bxs-search ms-1'></i>
                                    Search
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <center><h1 class="col-12 col-xl-8 h2 text-left text-primary pt-3">Products</h1></center><br><br>
            <div class="row projects gx-lg-5">
                <%
                    Connection con = SQLconnection.getconnection();
                    Statement st = con.createStatement();
                    try {
                        ResultSet rs = st.executeQuery("SELECT * FROM product ORDER BY id DESC");

                        while (rs.next()) {
                %>
                <a href="Product_details.jsp?pid=<%=rs.getString("id")%>&pname=<%=rs.getString("pname")%>" class="col-sm-6 col-lg-4 text-decoration-none project marketing social business">
                    <div class="service-work overflow-hidden card mb-5 mx-5 m-sm-0">
                        <img class="card-img-top" src="Getimage?id=<%=rs.getString("id")%>" width="180" height="280" alt="Product_image">
                        <div class="card-body">
                            <h5 class="card-title light-300 text-dark"><%=rs.getString("pname")%></h5>
                            <h5 class="card-text light-300 text-dark">
                                Rs.<%=rs.getString("price")%>
                            </h5>
                            <span class="text-decoration-none text-primary light-300">
                                Buy <i class='bx bxs-cart ms-1'></i>
                            </span>
                        </div>
                    </div>
                </a>
                <!-- <div class="col-md-4 mb-3">
                    <a href="#" class="recent-work card border-0 shadow-lg overflow-hidden">
                        <img class="recent-work-img card-img" src="Getimage?id=<%=rs.getString("id")%>" width="180" height="280" alt="Card image">
                        <div class="recent-work-vertical card-img-overlay d-flex align-items-end">
                            <div class="recent-work-content text-start mb-3 ml-3 text-dark">
                                <h3 class="card-title light-300"><%=rs.getString("pname")%></h3>
                                <p class="card-text">Rs.<%=rs.getString("price")%></p>
                            </div>
                        </div>
                    </a>
                </div> -->
                <%                                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                %>
            </div>
        </section>
        <footer>
            <div class="w-100 bg-primary py-3">
                <div class="container">
                    <div class="row pt-2">
                    </div>
                </div>
            </div>
        </footer>
        <!-- End Footer -->
        <!-- Bootstrap -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- Load jQuery require for isotope -->
        <script src="assets/js/jquery.min.js"></script>
        <!-- Isotope -->
        <script src="assets/js/isotope.pkgd.js"></script>
        <!-- Page Script -->
        <script>
            $(window).load(function () {
                // init Isotope
                var $projects = $('.projects').isotope({
                    itemSelector: '.project',
                    layoutMode: 'fitRows'
                });
                $(".filter-btn").click(function () {
                    var data_filter = $(this).attr("data-filter");
                    $projects.isotope({
                        filter: data_filter
                    });
                    $(".filter-btn").removeClass("active");
                    $(".filter-btn").removeClass("shadow");
                    $(this).addClass("active");
                    $(this).addClass("shadow");
                    return false;
                });
            });
        </script>
        <!-- Templatemo -->
        <script src="assets/js/templatemo.js"></script>
        <!-- Custom -->
        <script src="assets/js/custom.js"></script>
    </body>
</html>
