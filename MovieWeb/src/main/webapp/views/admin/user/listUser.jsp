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

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
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
<base href="/">
<style>
tr, th, tr, tbody {
	font-weight: bold;
	color: white;
	border: white;
}
</style>

</head>

<body>
	<!-- Page Preloder -->

	<jsp:include page="/views/menu.jsp"></jsp:include>

	<div class="container mt-5 shadow-lg p-4" id="list-user">
		

	</div>

	<!-- Footer Section Begin -->
	<footer class="footer mt-5">
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
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>

				</div>
			</div>
		</div>
	</footer>
	<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
	<!-- Footer Section End -->
	<script type="text/javascript">
	
	$(document).ready(function() {
		console.log('đã chạy')
		pagination(5,1,null);
	});
	
function btnDelete(element) {
	var userId = $(element).data('id')
	 $.get('/MovieWeb/admin/user/delete?username='+userId, {
	    	
	    }).done( function (data) {
	    	
	    	  if(data.message){
		        	Swal.fire({
			        	  title: 'Thông báo',
			        	  text: data.message,
			        	  icon: 'info',
			        	  confirmButtonText: 'OK'
			        	}).then((result) => {
			        	  if (result.isConfirmed) {
			        	    window.location.href = '/MovieWeb/admin/user/list';
			        	  }
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
function handleSearchClick(size,page) {
    var search = $('#search-input').val()
    console.log(search)
    pagination(size,1,search)
} 

function handleSizeChange(value,search) {
    // Gọi hàm pagination với giá trị mới được chọn
    pagination(value,1,search)
}


function pagination(size,page,search) {
	var size =size;
	var page = page;
	var search = search
	 $.get('/MovieWeb/admin/user/pagination', {
	    	size:size,
	    	page:page,
	    	search:search
	    }).done( function (data) {
	    	$('#list-user').html(data)
	    
	    	
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