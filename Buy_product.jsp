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
        <!-- Load Tempalte CSS -->
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="assets/css/custom.css">
    </head>
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
            <%
                String pid = request.getParameter("pid");
                String pname = request.getParameter("pname");

                Connection con = SQLconnection.getconnection();
                Statement st = con.createStatement();
                try {
                    ResultSet rs = st.executeQuery("SELECT * FROM product WHERE id = '" + pid + "'");

                    while (rs.next()) {
            %>
            <center><h1 class="col-12 col-xl-8 h2 text-left text-primary pt-3">Buy Product</h1></center><br><br>
            <div class="row pb-4">
                <div class="col-lg-6">
                    <img src="Getimage?id=<%=rs.getString("id")%>" width="400" height="350" />
                    <br><p><%=rs.getString("pname")%></p>
                    <h5 class="card-text light-300 text-dark">
                        Rs.<%=rs.getString("price")%>
                    </h5>
                </div>
                <div class="col-lg-5">
                    <form class="contact-form row" method="post" action="buy.jsp" role="form">
                        <div class="col-12">
                            <br>
                            <div class="form-group mb-4">
                                <input type="hidden" value="<%=pid%>" name="pid">
                                <input type="hidden" value="<%=pname%>" name="pname">
                                <input type="hidden" value="<%=rs.getString("price")%>" name="price">
                                <label>Account No :</label>
                                <input type="text" class="form-control form-control-lg light-300" name="acc_no" placeholder="Enter Account Number" required="required" />
                            </div>
                        </div>
                        <div class="col-12">
                            <br>
                            <div class="form-group mb-4">
                                <label>Password :</label>
                                <input type="password" class="form-control form-control-lg light-300" name="pass" placeholder="Enter Your Password" required="required" />
                            </div>
                        </div>
                        <div class="col-12">
                            <label>Mode Of Payment :</label><br><br>
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" id="exampleRadios1" checked>
                                <span class="form-check-sign"></span>
                                Payment Application
                            </label>
                        </div>
                        <div class="col-md-12">
                            <br>
                            <button type="submit" class="btn btn-success rounded-pill px-md-5 px-4 py-2 radius-0 text-light light-300">
                                <i class='bx bxs-cart ms-1'></i>&nbsp;&nbsp;BUY</button>
                        </div>
                    </form>
                </div>
            </div>
            <%                                        }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }

            %>
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
