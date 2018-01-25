<html>
<head>
    <title>首页</title>
    <link href="css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap/bootstrap.js"></script>
</head>
<style type="text/css">
    .header{
        background-color: black;
        height: 60px;
        padding-top: 10px;
        padding-bottom: 10px;
    }
    #logo{
        height: 40px;
        line-height: 40px;
    }
    ul#navigation {
        list-style: none;
        width: 400px;
    }
    li.item{
        float: left;
        color: white;
        width: 100px;
        text-align: center;
        cursor: pointer;
        margin-left: 4px;
    }
    li.item a{
        text-decoration: none;
        color: silver;
    }
    li.item a:hover{
        color: white;
    }
    li.item.active{
        border-bottom: 1px solid white;
    }

</style>
<body>
<!--菜单-->
<div class="header">
    <div class="col-md-2">
        <img id="logo" src="img/icon.png" alt="">
    </div>
    <div class="col-md-4" id="navigation-wrapper" style="height:40px;line-height: 40px">
        <ul id="navigation">
            <li class="item active" activeFlag="true"><a href="#">首页</a></li>
            <li class="item" activeFlag="false"><a href="#">所有发布</a></li>
            <li class="item" activeFlag="false"><a href="#">支付方式</a></li>
        </ul>
    </div>
    <div id="operation" class="col-md-6">
        <div id="cart"></div>
        <div id="collect">

        </div>
        <div id="person-info">

        </div>
    </div>
</div>
</body>

<script>
    //给导航栏添加active样式
    $("li.item").mouseover(function(event) {
        if(!$(this).hasClass('active')){
            $(this).addClass('active');
        }
    }).mouseleave(function(event) {
        $("li.item").each(function(index, el) {
            if($(this).attr('activeFlag') == "false"){
                $(this).removeClass('active');
            }
        });
    }).click(function(event) {
        var click_index = $(this).index("li.item");
        var length = $("li.item").length;
        for(var i=0; i<length; i++){
            if(i != click_index){
                $("li.item").eq(i).removeClass('active');
                $("li.item").eq(i).attr('activeFlag', 'false');
            }else
                $("li.item").eq(i).attr('activeFlag', 'true');
        }
    });
</script>
</html>