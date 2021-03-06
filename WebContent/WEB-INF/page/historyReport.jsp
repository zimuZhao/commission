<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Software Testing and Assurance Project - Commission">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>History Report</title>

    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet"/>
    <!-- hint style -->
    <link href="css/jquery.gritter.css" rel="stylesheet">
    <!-- Custom styles -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/daterangepicker.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <script src="js/lte-ie7.js"></script>
    <![endif]-->
</head>

<body>

<!-- Preloader -->
<div class="mask">
    <div id="loading-box">
        <div class="logo-pinner logo"></div>
        <div class="ibox"></div>
        <div class="iLoading"></div>
    </div>
</div>
<!--/Preloader -->

<!-- container section start -->
<section id="container" class="">

    <!--header start-->
    <header class="header dark-bg">
        <div class="toggle-nav">
            <div class="icon-reorder tooltips"
                 data-original-title="Toggle Navigation" data-placement="bottom">
                <i class="icon_menu"></i>
            </div>
        </div>

        <!--logo start-->
        <a href="bossInfoBrief.action" class="logo">Gunsmith <span class="lite">Admin</span></a>
        <!--logo end-->

        <div class="top-nav notification-row">
            <!-- notificatoin dropdown start-->
            <ul class="nav pull-right top-menu">
                <!-- user login dropdown start-->
                <li class="dropdown">
                    <a data-toggle="dropdown"
                       class="dropdown-toggle" href="#"> <span class="username">${sessionScope.boss.name}</span>
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu extended logout">
                        <div class="log-arrow-up"></div>
                        <li>
                            <a href="#"><i class="icon_clock_alt"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
                <!-- user login dropdown end -->
            </ul>
            <!-- notificatoin dropdown end-->
        </div>
    </header>
    <!--header end-->

    <!--sidebar start-->
    <aside>
        <div id="sidebar" class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu">
                <li class="">
                    <a class="" href="bossInfoBrief.action">
                        <i class="icon_house_alt"></i> <span>Home</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a class="" href="bossCurrentReport.action">
                        <i class="icon_document_alt"></i> <span>Monthly Report</span>
                    </a>
                </li>

                <li class="sub-menu active">
                    <a class="" href="bossHistoryReport.action">
                        <i class="icon_documents_alt"></i> <span>History Report</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a class="" href="bossManageSalesman.action">
                        <i class="icon_genius"></i> <span>Salesman Manage</span>
                    </a>
                </li>
            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->

    <!--main content start-->
    <section id="main-content">

        <section class="wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="icon_menu-circle_alt"></i> History Report</h3>
                </div>

                <div class="col-md-4 col-md-offset-8 col-xs-12 m-b-20">
                    <span>Please enter the query time :</span>
                    <input id="date-range-picker" class="pull-right form-control" type="text" name="date-range-picker">
                </div>

            </div>

            <div class="row">
                <!-- 区域地图统计（上月）starts-->
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            World Sales
                        </header>
                        <div class="panel-body">
                            <div id="worldSales" class="echart-h-500"></div>
                        </div>
                    </section>
                </div>
                <!-- 区域地图统计（上月）ends-->
            </div>


            <div class="row">
                <div class="col-lg-12">

                    <section class="panel">
                        <table class="table table-striped table-advance table-hover">
                            <thead>
                            <tr>
                                <th> Num</th>
                                <th> Date</th>
                                <th> Salesman</th>
                                <th> Locks</th>
                                <th> Stocks</th>
                                <th> Barrels</th>
                                <th> Sale</th>
                                <th> basicCommission</th>
                                <th> midCommission</th>
                                <th> highCommission</th>
                                <th> totalCommission</th>
                            </tr>
                            </thead>
                            <tbody id="salesHistory" class="hidden">
                            <tr>
                                <td>{num}</td>
                                <td>{date}</td>
                                <td>{salesman}</td>
                                <td>{locks}</td>
                                <td>{stocks}</td>
                                <td>{barrels}</td>
                                <td>{sale}</td>
                                <td>{basicCommission}</td>
                                <td>{midCommission}</td>
                                <td>{highCommission}</td>
                                <td>{totalCommission}</td>
                            </tr>

                            </tbody>
                        </table>

                        <table id="paging" class="table table-bordered"
                               style="WORD-BREAK: break-all; WORD-WRAP: break-word;">
                            <tfoot class="">
                            <tr>
                                <td>
                                    <ul class="pagination" active="active" disabled="disabled">
                                        <li class="previous"><span aria-hidden="true">Pre</span></li>
                                        <li class="page">
                                            <a></a>
                                        </li>
                                        <li class="next"><span aria-hidden="true">Next</span></li>
                                    </ul>
                                </td>
                            </tr>
                            </tfoot>
                        </table>

                    </section>


                </div>
            </div>

        </section>
    </section>
    <!--main content end-->
</section>
<!-- container section end -->


<!-- javascripts -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- nicescroll -->
<script src="js/jquery.nicescroll.js"></script>
<!--custome script for all page-->
<script src="js/scripts.js"></script>

<script src="js/moment.min.js"></script>
<script src="js/daterangepicker.js"></script>
<script src="js/echarts.js"></script>
<script src="js/world.js"></script>
<script src="js/jquery.gritter.min.js"></script>
<script src="js/jquery.table.js"></script>
<script src="js/custom/hint.js"></script>
<script src="js/custom/loading.js"></script>
<script src="js/custom/historyReport.js"></script>
<script src="js/custom/timepicker.js"></script>

</body>
</html>
