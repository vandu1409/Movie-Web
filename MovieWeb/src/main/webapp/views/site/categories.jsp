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
<div id="loading" style="display: none" >
  <img src="https://i.gifer.com/ZZ5H.gif" height="50px">
</div>

   <jsp:include page="/views/menu.jsp"></jsp:include>

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <a href="./categories.html">Categories</a>
                        <span>Romance</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Product Section Begin -->
    <section class="product-page spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8" id= "movie-search">
                 </div>
                <div class="col-lg-4 col-md-6 col-sm-8">
                    <div class="product__sidebar">
                        <div class="product__sidebar__view">
                       
                            <div class="section-title">
                                <h5>Top Views</h5>
                            </div>
                            
                            <c:forEach var="item" items="${listTopView }">
                            <div class="filter__gallery">
                                <div class="product__sidebar__view__item set-bg mix day years"
                                data-setbg="/MovieWeb/uploads/${item.image }" >
                                <div class="ep">${item.status }</div>
                                <div class="view"><i class="fa fa-eye"></i> ${item.viewByMovie }</div>
                                   <h5><a href="/MovieWeb/moviedetails?movieId=${item.movieId }">${item.title }</a></h5>
                            </div>
                            </c:forEach>
            </div>
        </div>
    </div>


</div>
</div>
</div>
</section>
<!-- Product Section End -->

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
  	<script src="https://code.jquery.com/jquery-3.6.4.js"
		integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			console.log('đã chạy')
			pagination(6, 1,'${keyword}');
		});
		


		function handleSizeChange(value,search) {
			// Gọi hàm pagination với giá trị mới được chọn
			pagination(value, 1,search)
		}

		function pagination(size, page, search) {
			$("#loading").show();
			var size = size;
			var page = page;
			var search = search
			$.get('/MovieWeb/movie/search', {
				size : size,
				page : page,
				keyword : search
			}).done(function(data) {
				$("#loading").hide();
				$('#movie-search').html(data)

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