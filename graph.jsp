<%-- 
    Document   : index
    Created on : 9 Apr, 2021, 5:00:44 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.google.gson.Gson"%>
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
                                <a class="nav-link btn-outline-primary rounded-pill px-3" href="Merchant_Home.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn-outline-primary rounded-pill px-3" href="Add_product.jsp">Add Product</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn-outline-primary rounded-pill px-3" href="View_products.jsp">View Products</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn-outline-primary rounded-pill px-3" href="User_details.jsp">User Details</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active btn-outline-primary rounded-pill px-3" href="graph.jsp">Graph</a>
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
            <div class="feature-work container my-4">
                <div class="row d-flex d-flex align-items-center">
                    <div class="col-lg-12">
                        <center><h1 class="feature-work-heading h2 py-3 semi-bold-600">Analysis</h1></center><br>
                            <%
                                String val1 = "", val2 = "", val3 = "";
                                String val11 = "", val22 = "", val33 = "";
                                int i = 0;

                                try {
                                    Connection con = SQLconnection.getconnection();

                                    Statement st = con.createStatement();
                                    ResultSet rs0 = st.executeQuery("SELECT  COUNT(id) AS value_occurrence FROM  product");
                                    rs0.next();
                                    {

                                        val1 = rs0.getString("value_occurrence");
                                    }
                                    rs0.close();
                                    Statement st1 = con.createStatement();
                                    ResultSet rs2 = st1.executeQuery("SELECT  COUNT(id) AS value_occurrence FROM  purchased");
                                    rs2.next();
                                    {
                                        val2 = rs2.getString("value_occurrence");
                                    }
                                    System.out.println("count------------------> " + val1);
                                    System.out.println("count------------------> " + val2);

                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }

                            %>
                        <script type="text/javascript">
                            window.onload = function () {

                                var chart = new CanvasJS.Chart("chartContainer", {
                                    animationEnabled: true,
                                    exportEnabled: true,
                                    title: {
                                        text: ""
                                    },
                                    axisY: {
                                        includeZero: true
                                    },
                                    data: [{
                                            type: "column", //change type to bar, line, area, pie, etc
                                            //indexLabel: "{y}", //Shows y value on all Data Points
                                            indexLabelFontColor: "#5A5757",
                                            indexLabelPlacement: "outside",
                                            dataPoints: [{y: <%=val1%>, label: "Total Products"},
                                                {y: <%=val2%>, label: "Purchased Products"}]
                                        }]
                                });
                                chart.render();

                            }
                        </script>
                        <div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
                    </div>
                </div>
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

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <!-- About us Skills Circle progress  -->
        <script>
                            // First circle
                            new Circlebar({
                                element: "#circle-1",
                                type: "progress",
                                maxValue: "90"
                            });

                            // Second circle
                            new Circlebar({
                                element: "#circle-2",
                                type: "progress",
                                maxValue: "84"
                            });

                            // Third circle
                            new Circlebar({
                                element: "#circle-3",
                                type: "progress",
                                maxValue: "60"
                            });

                            // Fourth circle
                            new Circlebar({
                                element: "#circle-4",
                                type: "progress",
                                maxValue: "74"
                            });

        </script>
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