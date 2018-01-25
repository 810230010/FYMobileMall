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
        <img id="logo" src="img/icon.jpg" alt="">
    </div>
    <div class="col-md-4" id="navigation-wrapper" style="height:40px;line-height: 40px">
        <ul id="navigation">
            <li class="item active"><a href="#">首页</a></li>
            <li class="item"><a href="#">所有发布</a></li>
            <li class="item"><a href="#">支付方式</a></li>
        </ul>
    </div>
    <div id="operation" class="col-md-6">

    </div>
</div>
</body>

<script>
    //给导航栏添加active样式
    $("li.item").mouseover(function(event) {
        $(this).addClass('active');
    }).mouseleave(function(event) {
        $(this).removeClass('active');
    });
</script>
</html>