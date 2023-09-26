<%@ page language="java"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Anime | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/style.css" type="text/css">
           <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>	
           <style type="text/css">
           #loading {
  position: fixed;
 
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 9999;
}
           </style>
</head>

<body>

    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
<div id="loading" style="display: none" >
  <img src="https://i.gifer.com/ZZ5H.gif" height="50px">
</div>
       <jsp:include page="/views/menu.jsp"></jsp:include>

    <!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" data-setbg="/MovieWeb/views/lib/img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>Sign Up</h2>
                        <p>Welcome to the official Anime blog.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Signup Section Begin -->
    <section class="signup spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>Quên mật khẩu</h3>
                        <form action="/MovieWeb/register" method="post">
                            <div class="input__item">
                                <input type="text" placeholder="Mật khẩu mới" name="newPassword" id="newPassword">
                                <span class="icon_lock"></span>
                            </div>
                            <div class="input__item">
                                <input type="text" placeholder="Xác nhận mật khẩu" name="rePassword" id="rePassword">
                                <span class="icon_lock"></span>
                            </div>
                          
                               <input type="text" hidden="" name="token" id="token" value="${token }">
                               
                            <button type="button" class="site-btn" onclick="btnChangePassword()">Đổi mật khẩu</button>
                        </form>
                        <h5>Already have an account? <a href="#">Log In!</a></h5>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__social__links">
                        <h3>Đăng nhập với:</h3>
                        <ul>
                            <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Sign in With Facebook</a>
                            </li>
                            <li><a href="#" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                            <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> Sign in With Twitter</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Signup Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer">
        <div class="page-up">
            <a href="#" id="scrollToTopButton"><span class="arrow_carrot-up"></span></a>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="footer__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="footer__nav">
                        <ul>
                            <li class="active"><a href="./index.html">Homepage</a></li>
                            <li><a href="./categories.html">Categories</a></li>
                            <li><a href="./blog.html">Our Blog</a></li>
                            <li><a href="#">Contacts</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                      Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                      <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>

                  </div>
              </div>
          </div>
      </footer>
      <!-- Footer Section End -->
<script >
function btnChangePassword() {
	
		  $("#loading").show();
	
		  var newPassword = $("#newPassword").val();
		    var rePassword = $("#rePassword").val();
		    var token = $("#token").val();
	
		    $.post('/MovieWeb/forgetpassword/changePassword', {
		    	newPassword: newPassword,
		    	rePassword: rePassword,
		    	token:token
		    
		    }).done( function (data) {
		        console.log(data.message);
		    	// Kết thúc hiệu ứng loading khi nhận được kết quả trả về từ server
				if(data.message){
					$("#loading").hide();
					
			        Swal.fire({
			        	  title: 'Thông báo',
			        	  text: data.message,
			        	  icon: 'info',
			        	  confirmButtonText: 'OK'
			        	}).then((result) => {
			        	  if (result.isConfirmed) {
			        	    window.location.href = '/MovieWeb/login';
			        	  }
			        	});
				}else{
					$("#loading").hide();
					
			        Swal.fire({
			        	  title: 'Thông báo',
			        	  text: data.error,
			        	  icon: 'info',
			        	  confirmButtonText: 'OK'
			        	}).then((result) => {
			        	
			        	});
				}
				  
		        
		    });
	
    
}

        // Sử dụng biến global message để hiển thị thông báo
      
    </script>
     <jsp:include page="/views/search.jsp"></jsp:include>

    <!-- Js Plugins -->
    <script src="/MovieWeb/views/lib/js/jquery-3.3.1.min.js"></script>
    <script src="/MovieWeb/views/lib/js/bootstrap.min.js"></script>
    <script src="/MovieWeb/views/lib/js/player.js"></script>
    <script src="/MovieWeb/views/lib/js/jquery.nice-select.min.js"></script>
    <script src="/MovieWeb/views/lib/js/mixitup.min.js"></script>
    <script src="/MovieWeb/views/lib/js/jquery.slicknav.js"></script>
    <script src="/MovieWeb/views/lib/js/owl.carousel.min.js"></script>
    <script src="/MovieWeb/views/lib/js/main.js"></script>

</body>

</html>