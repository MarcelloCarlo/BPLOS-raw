<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="ISO-8859-1">
<title>BPLS | Login</title>

<!-- Bootstrap -->
<link href="build/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="build/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="build/css/nprogress.css" rel="stylesheet">
<!-- Animate.css -->
<link href="build/css/animate.min.css" rel="stylesheet">

<!-- Custom Theme Style -->
<link href="build/css/custom.min.css" rel="stylesheet">

</head>

<body class="login">
	
	  <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form action="index.jsp" method="post">
              <h1>BPLS Login</h1>
              <div>
                <input type="text" class="form-control" name="usrname" placeholder="Username" required="" />
              </div>
              <div>
                <input type="password" class="form-control" name="password" placeholder="Password" required="" />
              </div>
              <div>
                <input class="btn btn-default submit" type="submit" value="Log In"/>
              </div>

              <div class="clearfix"></div>

              <div class="separator">

                <div>
                  <h1> BPLS System</h1>
                  <p>©2018 BPLS</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
</body>
</html>