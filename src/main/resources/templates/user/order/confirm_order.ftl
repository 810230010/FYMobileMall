<#-- 引入布局指令的命名空间 -->
<#import "${springMacroRequestContext.contextPath}/user/common/base.ftl" as defaultLayout>

<#-- 调用布局指令 -->
<@defaultLayout.layout base_title="确认订单" showLeftNav=false base_css=["${springMacroRequestContext.contextPath}/css/order.css"]>

<div class="container" style="padding-top: 30px">
    <div style="height: 60px;">
        <h4>确认收货地址<a href="#" class="pull-right" style="font-size: 14px" data-toggle="modal" data-target="#addAddressModal">添加收货地址地址</a></h4>
        <div class="divider-solid"></div>
    </div>
    <#--收货地址列表-->
    <div class="address-list">
        <#list addressList as address >
            <#if address_index == 0>
            <div class="address-item address-selected" addressId="${address.addressId}" address="${address.addressName}" accepter="${address.goodsTaker}" tel="${address.tel}">
                <span class="mark"><i class="fa fa-map-marker" style="color: #f40"></i>寄送至</span>
                <span class="address-item-text">${address.addressName}（${address.goodsTaker} 收）</span>
                <span class="pull-right">
                    <a href="" style="float: right;margin-right: 10px">[修改地址]</a>
                    <a href="" style="float: right">[删除地址]</a>
                </span>
            </div>
            <#else>
                <div class="address-item" data="${address}" address="${address.addressName}" accepter="${address.goodsTaker}" tel="${address.tel}">
                    <span class="mark" style="visibility: hidden"><i class="fa fa-map-marker" style="color: #f40"></i>寄送至</span>
                    <span class="address-item-text">${address.addressName}（${address.goodsTaker} 收）</span>
                    <span class="pull-right">
                        <a href="" style="float: right;margin-right: 10px">[修改地址]</a>
                        <a href="" style="float: right">[删除地址]</a>
                    </span>
                </div>
            </#if>
        </#list>
    </div>
    <#--确认订单信息-->
    <div style="height: 60px;;margin-top: 100px">
        <h4>确认订单信息</h4>
        <div class="divider-solid"></div>
    </div>
    <#--订单信息表-->
    <div class="order-table">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>标题</th>
                <th>图片</th>
                <th>卖家</th>
                <th>价格</th>
                <th>付款方式</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="col-md-2"><a>${sellItem.sellTitle}</a></td>
                <td class="col-md-2"><img src="${sellItem.image}" style="width: 40px; height: 40px" alt=""></td>
                <td class="col-md-3"><a>${sellItem.publisherName}</td>
                <td class="col-md-2"><span style="color:red">¥${sellItem.sellPrice}</span></td>
                <td class="col-md-3">
                    <div class="btn-group" data-toggle="buttons-radio">
                        <button class="btn btn-primary">货到付款</button>
                        <button class="btn btn-primary">在线付款</button>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="order-summary">
        <div class="col-md-3 pull-right" style="border:1px solid #f40;height:220px">
            <p>实付款: ¥<span style="color:#f40;font-size:24px" id="goodsPrice">1,000</span></p>
            <p>寄送至：<b id="goodsAddress">浙江省杭州市余杭区</b></p>
            <p>收货人： <b  id="goodsTaker">江建平</b></p>
            <p>联系电话： <b>17858936109</b></p>
            <p>付款方式：<b id="payType">在线付款</b></p>
            <button id="submitBtn" class="btn btn-info btn-block">提交订单</button>
        </div>
    </div>
</div>
<#--添加地址-->
<div class="modal fade" id="addAddressModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加地址页面</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="title" class="col-md-2 control-label text-center">收货地址</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="address" placeholder="请输入收货地址">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="title" class="col-md-2 control-label text-center">收货人</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="accepter" placeholder="请输入收货人">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="title" class="col-md-2 control-label text-center">联系号码</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="goodsTel" placeholder="请输入号码">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="addAddress" class="btn btn-primary btn-block">添加地址</button>
            </div>
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
    $(function () {

        $("#goodsAddress").html("${addressList[0].addressName}");
        $("#goodsTaker").html("${addressList[0].goodsTaker}");
        $("#goodsTel").html("${addressList[0].tel}");
        $("#goodsPrice").html("${sellItem.sellPrice}");
        $("#payType").html("货到付款");
    })
$(".address-item").click(function () {

    $(this).addClass('address-selected');
    $(this).children('.mark').css('visibility', 'visible');
    $(this).siblings().removeClass('address-selected');
    $(this).siblings().children('.mark').css('visibility','hidden');

    $("#goodsAddress").html($(this).attr('address'));
    $("#goodsTel").html($(this).attr('tel'));
    $("#goodsTaker").html($(this).attr('accepter'));
});
$("#addAddress").click(function () {

    var address = $("#address").val();
    var tel = $("#goodsTel").val();
    var accepter = $("#accepter").val();
    $.ajax({
        url: "/order/addresses",
        type: "POST",
        data:{
            addressName: address,
            goodsTaker: accepter,
            tel: tel
        },
        success: function (result) {
            if(result.code == 0){
                alert("收货地址添加成功!");
                setTimeout(function () {
                    window.location.reload();
                },1500)
            }
        },
        error:function (result) {
            alert("添加收货地址出错");
        }
    })
});
//提交订单
    $("#submitBtn").click(function () {
        var r=confirm("确定下单？");
        if(r == true){
            var price = "${sellItem.sellPrice}";
            $.ajax({
                url: "/order/makeOrder",
                type: "POST",
                data: {
                    sellItemId: "${sellItem.sellId}",
                    sellUserId: "${sellItem.publisherId}",
                    sellUserName: "${sellItem.publisherName}",
                    payPrice: price,
                    addressId: parseInt($(".address-selected").attr('addressId'))
                },
                success: function (result) {
                    if(result.code == 0){
                        window.location.href = "/order/page/success";
                    }
                },
                error: function (result) {
                    alert("下单失败");
                }
            })
        }
    })
</script>
</@defaultLayout.layout>