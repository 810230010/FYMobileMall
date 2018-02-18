<#-- 引入布局指令的命名空间 -->
<#import "${springMacroRequestContext.contextPath}/user/common/base.ftl" as defaultLayout>

<#-- 调用布局指令 -->
<@defaultLayout.layout base_title="我发布的闲置" showLeftNav=true base_css=["${springMacroRequestContext.contextPath}/css/profile.css"]>
<div style="float: left;background-color: #f5f5f5;margin-left: 30px;height: 700px" class="col-md-8">
    <div class="title">
        <h4>我的需求</h4>
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
            'url': '/profile/listMyNeed',
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
            {"data":"needId","width":"7%","title":"","visible": false},
            {"data":"needTitle","width": "10%","title":"标题","orderable": false},
            {"data":"commentNo","width": "10%","title":"留言数","orderable": true},
            {"data":"publishTime","width": "10%","title":"发布日期","orderable": false},
            {
                "data":"needId",
                "width": "10%",
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
    var table = $('#dataTable').DataTable();
    table.on( 'click', '.detail', function () {
        var tr = $(this).closest('tr');
        var data = table.row(tr).data();
        window.location.href = "/buy/page/need/detail?itemId=" + data.needId;
    });
    table.on( 'click', '.close', function () {
        var tr = $(this).closest('tr');
        var data = table.row(tr).data();
        $.ajax({
            url: "/profile/closeSellItem",
            data: {
                sellId: data.sellId
            },
            success: function (result) {
                if(result.code == 0){
                    alert("关闭闲置成功!");
                    setTimeout(function () {
                        window.location.reload();
                    }, 1500)
                }
            },
            error: function(result){
                alert("关闭闲置服务出错")
            }
        })

    });

</script>
</@defaultLayout.layout>