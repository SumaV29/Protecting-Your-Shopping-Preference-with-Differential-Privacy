<%-- 
    Document   : index
    Created on : 9 Apr, 2021, 5:00:44 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                <a class="nav-link active btn-outline-primary rounded-pill px-3" href="index.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn-outline-primary rounded-pill px-3" href="User_login.jsp">User</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn-outline-primary rounded-pill px-3" href="Merchant_login.jsp">Merchant</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn-outline-primary rounded-pill px-3" href="Bank_login.jsp">Online Bank</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn-outline-primary rounded-pill px-3" href="Paymentapp_login.jsp">Payment Application</a>
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
                    <h2 style="color: #3366ff;" class="banner-heading h2 display-3 pb-5 semi-bold-600 typo-space-line-center">
                        Protecting Your Shopping Preference with Differential Privacy
                    </h2>
                </div>
            </div>
        </div>
        <section class="container py-5">
            <div class="feature-work container my-4">
                <div class="row d-flex d-flex align-items-center">
                    <div class="col-lg-12">
                        <center><h1 class="feature-work-heading h2 py-3 semi-bold-600">ABSTRACT</h1></center><br>
                        <p class="feature-work-body light-300" align="justify" style="font-size: 18px;">
                            Online banks may disclose consumers’ shopping
                            preferences due to various attacks. With differential privacy,
                            each consumer can disturb his consumption amount locally
                            before sending it to online banks. However, directly applying
                            differential privacy in online banks will incur problems in reality
                            because existing differential privacy schemes do not consider
                            handling the noise boundary problem. In this paper, we propose
                            an Optimized Differential prIvate Online tRansaction scheme
                            (O-DIOR) for online banks to set boundaries of consumption
                            amounts with added noises. We then revise O-DIOR to design a
                            RO-DIOR scheme to select different boundaries while satisfying
                            the differential privacy definition. Moreover, we provide in-depth
                            theoretical analysis to prove that our schemes are capable to
                            satisfy the differential privacy constraint. Finally, to evaluate
                            the effectiveness, we have implemented our schemes in mobile
                            payment experiments. Experimental results illustrate that the
                            relevance between the consumption amount and online bank
                            amount is reduced significantly, and the privacy losses are less
                            than 0.5 in terms of mutual information.
                        </p>
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
