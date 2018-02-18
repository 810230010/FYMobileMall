<#-- 引入布局指令的命名空间 -->
<#import "${springMacroRequestContext.contextPath}/user/common/base.ftl" as defaultLayout>

<#-- 调用布局指令 -->
<@defaultLayout.layout base_title="我售出的订单" showLeftNav=true base_css=["${springMacroRequestContext.contextPath}/css/profile.css"]>
<div style="float: left;background-color: #f5f5f5;margin-left: 30px;height: 700px" class="col-md-8">
    <div class="title">
        <h4>我的购买订单</h4>
    </div>
    <div class="divider-solid"></div>
    <div style="margin-top: 30px">
        <div class="table-responsive" style="font-size: 14px">
            <table id="dataTable" class="table table-striped table-bordered table-hover dataTables-example" >
                <thead>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="clearfix"></div>
<div class="padding" style="height: 300px;"></div>
<div class="back-to-top">
    <a href="#" class="btn btn-default">回到顶部</a>
</div>
<div class="car-maskmagix_vf_car"></div>
<div style="height:100px; background-color: black;color: white" class="text-center";>
    <h4 style="height:100px;line-height: 100px">2006-2090 飞扬版权所有@copyright</h4>
</div>
<script>
    $('#dataTable').DataTable({
        "ajax": {
            'url': '/profile/listMySellOrder',
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
            {"data":"orderId","width":"7%","title":"","visible": false},
            {"data":"sellTitle","width": "10%","title":"标题","orderable": false},
            {
                "data":"image",
                "width": "10%",
                "title":"图片",
                "orderable": false,
                "render": function (data, type, row) {
                    var html = '<div class="pull-left"><img src="' + row.image + '" style="width: 60px;height: 60px;"></div>';
                    return html;
                }
            },
            {"data":"buyUserName","width": "10%","title":"买家","orderable": false},
            {"data":"payPrice","width": "10%","title":"订单金额","orderable": false},
            {"data":"state","width": "10%","title":"订单状态","orderable": false},
            {"data":"payType","width": "10%","title":"支付类型","orderable": false},
            {"data":"createTime","width": "10%","title":"订单创建时间","orderable": false},
            {
                "data":"orderId",
                "width": "8%",
                "title":"操作",
                "orderable": false,
                "render": function (data, type, row) {
                    if(row.stateCode == 0){
                        return [
                            '<a class="btn btn-primary btn-xs table-action btn-block detail" href="javascript:void(0)">',
                            '查看详情 <i class="fa fa-eye"></i>',
                            '</a>',
                            '<a class="btn btn-primary btn-xs table-action btn-block send" href="javascript:void(0)">',
                            '已发货 <i class="fa fa-eye"></i>',
                            '</a>'
                        ].join('');
                    }else{
                        return [
                            '<a class="btn btn-primary btn-xs table-action btn-block detail" href="javascript:void(0)">',
                            '查看详情 <i class="fa fa-eye"></i>',
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
    var table = $('#dataTable').DataTable();
    table.on( 'click', '.detail', function () {
        var tr = $(this).closest('tr');
        var data = table.row(tr).data();
        window.location.href = "/profile/page/orderDetail?orderId=" + data.orderId;
    });
    table.on( 'click', '.send', function () {
        var tr = $(this).closest('tr');
        var data = table.row(tr).data();
        $.ajax({
            url: "/profile/sendMySellOrder",
            data: {
                orderId: data.orderId
            },
            success: function (result) {
                if(result.code == 0){
                    alert("修改订单状态为已发货成功!");
                    setTimeout(function () {
                        window.location.reload();
                    }, 1500)
                }
            },
            error: function(result){
                alert("修改订单状态服务出错")
            }
        })

    });

</script>
</@defaultLayout.layout>