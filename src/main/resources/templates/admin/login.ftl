<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>后台管理页面</title>

    <link href="${springMacroRequestContext.contextPath}/css/bootstrap/bootstrap.css" rel="stylesheet">
    <link href="${springMacroRequestContext.contextPath}/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="${springMacroRequestContext.contextPath}/css/animate/animate.css" rel="stylesheet">
    <link href="${springMacroRequestContext.contextPath}/css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">IN+</h1>

            </div>
            <h3>飞扬管理系统</h3>
            <form class="m-t" role="form">
                <div class="form-group">
                    <input id="username" type="text" class="form-control" placeholder="用户名" required="">
                </div>
                <div class="form-group">
                    <input id="password" type="password" class="form-control" placeholder="密码" required="">
                </div>
                <button id="submit" type="button" class="btn btn-primary block full-width m-b">登录</button>
            </form>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="${springMacroRequestContext.contextPath}/js/jquery.min.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/bootstrap/bootstrap.js"></script>

</body>
<script>
    $("#submit").click(function () {
        var username = $("#username").val();
        var password = $("#password").val();
        $.ajax({
            url: "/admin/checkLogin",
            data: {
                username: username,
                password: password
            },
            success: function (result) {
                if(result.code == 0){
                    alert("登录成功!");
                    setTimeout(function () {
                        window.location.href = "/admin/page/index";
                    }, 2000);
                }else{
                    alert(result.msg);
                }
            }
        })
    })
</script>
</html>
