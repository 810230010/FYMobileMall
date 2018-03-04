<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>已审核闲置</title>

    <link href="${springMacroRequestContext.contextPath}/css/bootstrap/bootstrap.css" rel="stylesheet">
    <link href="${springMacroRequestContext.contextPath}/css/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/dataTables/datatables.min.css">
    <link href="${springMacroRequestContext.contextPath}/css/animate/animate.css" rel="stylesheet">
    <link href="${springMacroRequestContext.contextPath}/css/style.css" rel="stylesheet">
    <!--sweet alert css-->
    <link href="${springMacroRequestContext.contextPath}/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <!-- Mainly scripts -->
    <script src="${springMacroRequestContext.contextPath}/js/jquery.min.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/bootstrap/bootstrap.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <!-- Custom and plugin javascript -->
    <script src="${springMacroRequestContext.contextPath}/js/inspinia.js"></script>
    <!--datatables-->
    <script src="${springMacroRequestContext.contextPath}/js/plugins/dataTables/datatables.min.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/plugins/pace/pace.min.js"></script>
    <!--sweetalert scripts-->
    <script src="${springMacroRequestContext.contextPath}/js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/layer/layer.js"></script>

</head>

<body>

<div id="wrapper">

    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="${springMacroRequestContext.contextPath}/img/profile_small.jpg" />
                             </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="/admin/page/index">
                        <#if currentUser??>
                        <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${currentUser.nickname}</strong>
                        <#else>
                        <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">未登陆</strong>
                        </#if>
                        </span> <span class="text-muted text-xs block">操作 <b class="caret"></b></span> </span> </a>
                    <#if (currentUser.nickname)??>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="/admin/logout">退出</a></li>
                        </ul>
                    <#else>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="/admin/login">登陆</a></li>
                        </ul>
                    </#if>
                    </div>
                    <div class="logo-element">
                        IN+
                    </div>
                </li>
                <li>
                    <a href="/admin/page/index"><i class="fa fa-th-large"></i> <span class="nav-label">用户管理</span> <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="/admin/page/users">所有用户</a></li>
                    </ul>
                </li>
                <li>
                    <a href="css_animation.html#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">闲置管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="/admin/sell/page/checked">已审核闲置</a></li>
                        <li><a href="/admin/sell/page/check">待审核闲置</a></li>
                    </ul>
                </li>
                <li>
                    <a href="css_animation.html#"><i class="fa fa-sitemap"></i> <span class="nav-label">订单管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="css_animation.html#">已成交订单</a></li>
                        <li><a href="css_animation.html#">未成交订单</a></li>
                        <li><a href="css_animation.html#">售后处理</a></li>
                    </ul>
                </li>
                <li>
                    <a href="css_animation.html#"><i class="fa fa-sitemap"></i> <span class="nav-label">公告管理</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse">
                        <li><a href="/admin/notice/page/allNotice">查看公告</a></li>
                    </ul>
                </li>
            </ul>

        </div>
    </nav>

    <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="css_animation.html#"><i class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom" action="search_results.html">
                        <div class="form-group">
                            <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search">
                        </div>
                    </form>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message">Welcome to INSPINIA+ Admin Theme.</span>
                    </li>
                    <li class="dropdown">
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/a7.jpg">
                                    </a>
                                    <div class="media-body">
                                        <small class="pull-right">46h ago</small>
                                        <strong>Mike Loreipsum</strong> started following <strong>Monica Smith</strong>. <br>
                                        <small class="text-muted">3 days ago at 7:58 pm - 10.06.2014</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/a4.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right text-navy">5h ago</small>
                                        <strong>Chris Johnatan Overtunk</strong> started following <strong>Monica Smith</strong>. <br>
                                        <small class="text-muted">Yesterday 1:21 pm - 11.06.2014</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/profile.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right">23h ago</small>
                                        <strong>Monica Smith</strong> love <strong>Kim Smith</strong>. <br>
                                        <small class="text-muted">2 days ago at 2:30 am - 11.06.2014</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="mailbox.html">
                                        <i class="fa fa-envelope"></i> <strong>Read All Messages</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="profile.html">
                                    <div>
                                        <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                        <span class="pull-right text-muted small">12 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="grid_options.html">
                                    <div>
                                        <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="notifications.html">
                                        <strong>See All Alerts</strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>


                    <li>
                        <a href="login.html">
                            <i class="fa fa-sign-out"></i> Log out
                        </a>
                    </li>
                </ul>

            </nav>
        </div>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>已审核闲置</h2>
            </div>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5 id="rank">已审核闲置列表 </h5>
                            <a id="back" hidden="hidden"> <i class="fa fa-reply" style="color: #777777"></i></a>
                        </div>
                        <div class="ibox-content">
                            <div class="table-responsive">
                                <table id="datatable" class="table table-striped table-bordered table-hover dataTables-example" >
                                    <thead>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div>
                <strong>Copyright</strong> Example Company &copy; 2014-2017
            </div>
        </div>

    </div>
</div>





</body>
<script>
    $('#datatable').DataTable({
        "ajax": {
            'url': '/admin/sell/listCheckedSellItem',
            "data": function(d) {
                var param = {};
                param.page = d.start/d.length + 1;
                param.pageSize = d.length;
                param.draw = d.draw;
                param.orderColumn = d.columns[d.order[0]['column']]['data'];
                param.orderType = d.order[0]['dir'];
                return param;
            },
        },
        "columns": [
            {"data":"sellId","width":"7%","title":"","visible": false},
            {"data":"sellTitle","width": "10%","title":"闲置标题","orderable": false},
            {"data":"oneImage","width": "10%","title":"图片","orderable": false,
                "render": function (data, type, row) {
                    var html = '<div class="pull-left"><img src="' + row.oneImage + '" style="width: 60px;height: 60px;"></div>';
                    return html;
                }
            },
            {"data":"formattedPrice","width": "10%","title":"价格","orderable": false},
            {"data":"publisherName","width": "10%","title":"发布人","orderable": false},
            {"data":"publishTime","width": "10%","title":"发布时间","orderable": true},
            {"data":"stateString","width": "10%","title":"状态","orderable": true},
            {
                "data":"sellId",
                "width": "8%",
                "title":"操作",
                "orderable": false,
                "render": function (data, type, row) {
                        return [
                            '<a class="btn btn-primary btn-xs table-action btn-block detail" href="javascript:void(0)">',
                            '查看详情 <i class="fa fa-eye"></i>',
                            '</a>'
                        ].join('');
                }
            },
        ],
        "searching": false,
        "ordering":true,
        "serverSide": true,
        "deferRender": true,
        "processing": true,
        "autoWidth": false,
        "destroy": true,
        "lengthMenu": [ 5, 10, 15],
        "responsive": true,
        "dom": '<"html5buttons"B>lTfgitp',
        "buttons": [],
        "language": {
            "url": "${springMacroRequestContext.contextPath}/js/dataTables/Chinese.json",
        }
    });
    $.fn.dataTable.ext.errMode = 'none'; //不显示任何错误信息
    var table = $('#datatable').DataTable();
    // 查看闲置详情
    table.on( 'click', '.detail', function () {
        var tr = $(this).closest('tr');
        var data = table.row(tr).data();
        window.location.href = "/admin/sell/page/sellDetail?sellId=" + data.sellId;
    });




</script>
</html>
