<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>管理用户页面</title>

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
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">Admin</strong>
                             </span> <span class="text-muted text-xs block">Art Director <b class="caret"></b></span> </span> </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="profile.html">Profile</a></li>
                            <li class="divider"></li>
                            <li><a href="login.html">退出</a></li>
                        </ul>
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
                        <li><a href="graph_flot.html">已审核闲置</a></li>
                        <li><a href="graph_morris.html">待审核闲置</a></li>
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
                        <li><a href="css_animation.html#">查看公告</a></li>
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
                <h2>用户列表</h2>
            </div>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5 id="rank">所有用户 </h5>
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
            'url': '/admin/user/listAllUser',
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
            {"data":"userId","width":"7%","title":"","visible": false},
            {"data":"nickname","width": "10%","title":"昵称","orderable": false},
            {"data":"tel","width": "10%","title":"手机号码","orderable": false},
            {"data":"createTime","width": "10%","title":"创建时间","orderable": false},
            {"data":"stateString","width": "10%","title":"用户状态","orderable": false},
            {"data":"userTypeString","width": "10%","title":"用户类型","orderable": false},
            {
                "data":"userId",
                "width": "8%",
                "title":"操作",
                "orderable": false,
                "render": function (data, type, row) {
                    if(row.userType == 1){
                    }else if(row.userType == 0 && row.state == 1){
                        return [
                            '<a class="btn btn-danger btn-xs table-action btn-block forbid" href="javascript:void(0)">',
                            '拉黑 <i class="fa fa-eye"></i>',
                            '</a>'
                        ].join('');
                    }else if(row.userType == 0 && row.state == 0){
                        return [
                            '<a class="btn btn-warning btn-xs table-action btn-block recover" href="javascript:void(0)">',
                            '恢复可用 <i class="fa fa-eye"></i>',
                            '</a>'
                        ].join('');
                    }

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
    // 拉黑用户
    table.on( 'click', '.forbid', function () {
        var tr = $(this).closest('tr');
        var data = table.row(tr).data();
        $.ajax({
            url: "/admin/user/forbidUser",
            data: {
                userId: data.userId
            },
            success: function (result) {
                if(result.code == 0){
                    layer.msg("拉黑该用户成功!");
                    setTimeout(function () {
                        window.location.reload();
                    },1500)
                }
            },
            error: function (result) {
                alert("服务出错!")
            }
        })
    });
    //恢复用户
    table.on( 'click', '.recover', function () {
        var tr = $(this).closest('tr');
        var data = table.row(tr).data();
        $.ajax({
            url: "/admin/user/recoverUser",
            data: {
                userId: data.userId
            },
            success: function (result) {
                if(result.code == 0){
                    layer.msg("恢复用户成功!");
                    setTimeout(function () {
                        window.location.reload();
                    }, 1500)
                }
            },
            error: function(result){
                alert("服务出错")
            }
        })

    });


</script>
</html>
