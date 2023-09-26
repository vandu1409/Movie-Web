<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Anime Template">
<meta name="keywords" content="Anime, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Anime | Template</title>
<base href="/">
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<!-- <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"> -->
<link rel="stylesheet" href="/MovieWeb/views/lib/css/mdb.min.css"
	type="text/css">
<link rel="stylesheet"
	href="/MovieWeb/views/lib/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/MovieWeb/views/lib/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/MovieWeb/views/lib/css/plyr.css"
	type="text/css">
<link rel="stylesheet" href="/MovieWeb/views/lib/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="/MovieWeb/views/lib/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/MovieWeb/views/lib/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/MovieWeb/views/lib/css/style.css"
	type="text/css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style type="text/css">
.title h4 {
	font-weight: 600;
	line-height: 21px;
	text-transform: uppercase;
	padding-left: 20px;
	position: relative;
	font-family: "Oswald", sans-serif;
}

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

	<div id="loading" style="display: none">
		<img src="https://i.gifer.com/ZZ5H.gif" height="50px">
	</div>
	<jsp:include page="/views/menu.jsp"></jsp:include>

	<div class="container mt-3 mb-3 p-4">
		<div class="card shadow p-4" style="background-color: #0b0c2a;">
			<div class="login__form">
				<form action="" method="post" enctype="multipart/form-data">

					<div class="w-100 mb-3 title">
						<h3 class="text-white">Quản lí tài khoản</h3>
					</div>

					<div class="row mt-5">
						<div class="col-lg-6">
							<div class="input__item ">
								<input type="text" placeholder="Username" name="username"
									id="username" value="${currentUser.username }"> <span class="icon_profile"></span>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="input__item">
								<input type="email" placeholder="Email address" name="email"
									id="email" value="${currentUser.email }"> <span class="icon_mail"></span>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-6 ">
							<div class="input__item">
								<input type="text" placeholder="Fullname" name="fullname"
									id="fullname" value="${currentUser.fullname }"> <span class="icon_profile"></span>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="input__item">
								<input type="text" placeholder="Password" name="password"
									id="password" value="${currentUser.password }"> <span class="icon_lock"></span>
							</div>
						</div>
					</div>


					<div class="row ">

						<div class="col-lg-6">
							<div class="text-white">
								<label class="mr-2">Tài khoản admin?</label> <br> 
								<c:choose>
								<c:when test="${currentUser.role }">
									 <label><input
									type="checkbox" class="form-control-inline mx-1" value="1"
									id="role" checked="checked"> ADMIN</label> <label>
								</c:when>
								
								<c:otherwise>
						 <label><input
									type="checkbox" class="form-control-inline mx-1" value="1"
									id="role"> ADMIN</label> <label>
								</c:otherwise>
								</c:choose>
							</div>
						</div>


					</div>



					<div class="mt-3">
				<c:choose>
				<c:when test="${isEdit }">
				<a class="btn btn-warning" type="button" onclick="update()">
							<i class='bx bxs-pencil'></i>Cập nhật
						</a>
				</c:when>
				
				<c:otherwise>
						<a class="btn btn-success" onclick="btnRegister()" type="button">
							<i class='bx bx-plus-medical'></i>Thêm
						</a>
				</c:otherwise>
				</c:choose>
						
					 <a class="btn btn-info"
							href="/MovieWeb/admin/user/add"><i class='bx bx-loader'></i>Mới</a>
						<a href="/MovieWeb/admin/user/list" class="btn btn-primary"><i
							class='bx bx-list-ul'></i> Danh sách</a>

					</div>
				</form>
			</div>


		</div>

		<!-- /.container-fluid -->

	</div>

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
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>

				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->
	<script>
function btnRegister() {
	
		  $("#loading").show();
	
		  var username = $("#username").val();
		    var email = $("#email").val();
		    var password = $("#password").val();
		    var fullname =$("#fullname").val();
		    var admin = $("#role").val();
		    $.post('/MovieWeb/register', {
		    	username: username,
		    	email: email,
		    	password: password,
		    	fullname:fullname,
		    	admin:admin
		    }).done( function (data) {
		        console.log(data.message);
		    	// Kết thúc hiệu ứng loading khi nhận được kết quả trả về từ server
				
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
		        
		    });
	
    
}

function update() {
	
	  $("#loading").show();

	  var username = $("#username").val();
	    var email = $("#email").val();
	    var password = $("#password").val();
	    var fullname =$("#fullname").val();
	    var admin = $("#role").val();
	    $.post('/MovieWeb/admin/user/update', {
	    	username: username,
	    	email: email,
	    	password: password,
	    	fullname:fullname,
	    	admin:admin
	    }).done( function (data) {
	        console.log(data.message);
	    	// Kết thúc hiệu ứng loading khi nhận được kết quả trả về từ server
			
			  $("#loading").hide();
			
	        if(data.message){
	        	Swal.fire({
		        	  title: 'Thông báo',
		        	  text: data.message,
		        	  icon: 'info',
		        	  confirmButtonText: 'OK'
		        	}).then((result) => {
		        	  
		        	});
	        	
	        }else{
	        	
	        	Swal.fire({
		        	  title: 'Thông báo',
		        	  text: data.error,
		        	  icon: 'info',
		        	  confirmButtonText: 'OK'
		        	})
		        	
	        }
	        
	    });


}
      
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