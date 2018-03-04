<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>查看公告</title>

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
                    <div class="dropdown profile-element">
                        <span>
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
                <h2>公告</h2>
            </div>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <a class="btn btn-primary" id="addNoticeBtn" data-toggle="modal" data-target="#addNoticeModal">添加公告</a>
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
        <!--添加公告-->
        <div class="modal fade" id="addNoticeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">添加公告页面</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" onsubmit="return false">
                            <div class="form-group">
                                <label for="sell-description" class="control-label col-md-2">公告内容</label>
                                <div class="col-md-10">
                                    <textarea class="form-control" id="noticeContent" style="height:200px"></textarea>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary btn-block" id="submit">提交</button>
                    </div>
                </div>
            </div>
        </div>
        <!--修改公告-->
        <div class="modal fade" id="updateNoticeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">修改公告页面</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" onsubmit="return false">
                            <div class="form-group">
                                <label for="sell-description" class="control-label col-md-2">公告内容</label>
                                <div class="col-md-10">
                                    <textarea class="form-control" id="updateContent" style="height:200px"></textarea>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary btn-block" id="update">修改</button>
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
    $("#submit").click(function () {
        var noticeContent = $("#noticeContent").val();
        $.ajax({
            url: "/admin/notice/addNotice",
            data:{
                noticeContent: noticeContent
            },
           success: function (result) {
               if(result.code == 0){
                   alert("添加公告成功");
                   setTimeout(function () {
                       window.location.reload();
                   }, 2000);
               }
           }
        })
    })
    $('#datatable').DataTable({
        "ajax": {
            'url': '/admin/notice/listAllNotice',
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
            {"data":"noticeId","width":"7%","title":"","visible": false},
            {"data":"noticeContent","width": "10%","title":"公告内容","orderable": false},
            {"data":"adminName","width": "10%","title":"发布者","orderable": false},
            {"data":"useString","width": "10%","title":"使用情况","orderable": false},
            {"data":"publishTime","width": "10%","title":"发布时间","orderable": true},
            {"data":"updateTime","width": "10%","title":"最新更新时间","orderable": true},
            {
                "data":"noticeId",
                "width": "8%",
                "title":"操作",
                "orderable": false,
                "render": function (data, type, row) {
                    if(row.isUsed == 0){
                        return [
                            '<a class="btn btn-primary btn-xs table-action btn-block update" data-toggle="modal" data-target="#updateNoticeModal">',
                            '修改公告 <i class="fa fa-pencil"></i>',
                            '</a>',
                            '<a class="btn btn-success btn-xs table-action btn-block use" href="javascript:void(0)">',
                            '使用公告 <i class="fa fa-check"></i>',
                            '</a>',
                            '<a class="btn btn-danger btn-xs table-action btn-block delete" href="javascript:void(0)">',
                            '删除公告 <i class="fa fa-times"></i>',
                            '</a>',
                        ].join('');
                    }else{
                        return [
                            '<a class="btn btn-primary btn-xs table-action btn-block update" data-toggle="modal" data-target="#updateNoticeModal">',
                            '修改公告 <i class="fa fa-pencil"></i>',
                            '</a>',
                            '<a class="btn btn-danger btn-xs table-action btn-block delete" href="javascript:void(0)">',
                            '删除公告 <i class="fa fa-times"></i>',
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
    // 修改公告
    table.on( 'click', '.update', function () {
        var tr = $(this).closest('tr');
        var data = table.row(tr).data();
        $("#updateContent").val(data.noticeContent);
        $("#update").click(function () {
            var noticeContent = $("#updateContent").val();
            $.ajax({
                url: "/admin/notice/updateNotice",
                data:{
                    noticeId: data.noticeId,
                    noticeContent: noticeContent
                },
                success: function (result) {
                    if(result.code == 0){
                        alert("修改公告成功");
                        setTimeout(function () {
                            window.location.reload();
                        }, 2000);
                    }
                }
            })
        })
    });
    //使用公告
    table.on( 'click', '.use', function () {
        var tr = $(this).closest('tr');
        var data = table.row(tr).data();
        $.ajax({
            url: "/admin/notice/useNotice",
            data: {
                noticeId: data.noticeId
            },
            success: function (result) {
                if(result.code == 0){
                    swal("成功！", "该公告首页已生效！","success");
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
    //删除公告
    table.on( 'click', '.delete', function () {

        var tr = $(this).closest('tr');
        var data = table.row(tr).data();
        swal({
                    title: "确定删除吗？",
                    text: "你将无法恢复该公告！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确定删除！",
                    closeOnConfirm: false
                },
                function(){
                    $.ajax({
                        url: "/admin/notice/deleteNotice",
                        data: {
                            noticeId: data.noticeId
                        },
                        success: function (result) {

                            if(result.code == 0){
                                swal("成功！", "该公告已删除！","success");
                                setTimeout(function () {
                                    window.location.reload();
                                }, 1500)
                            }
                        },
                        error: function(result){
                            alert("服务出错")
                        }
                    })
                }
        );


    });


</script>
</html>
