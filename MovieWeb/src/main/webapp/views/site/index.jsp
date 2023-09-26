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
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>	

</head>

<body>
    <!-- Page Preloder -->
  

       <jsp:include page="/views/menu.jsp"></jsp:include>

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="hero__slider owl-carousel">
                <div class="hero__items set-bg" data-setbg="/MovieWeb/views/lib/img/hero/hero-1.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Adventure</div>
                                <h2>Fate / Stay Night: Unlimited Blade Works</h2>
                                <p>After 30 days of travel across the world...</p>
                                <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="/MovieWeb/views/lib/img/hero/hero-1.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Adventure</div>
                                <h2>Fate / Stay Night: Unlimited Blade Works</h2>
                                <p>After 30 days of travel across the world...</p>
                                <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="/MovieWeb/views/lib/img/hero/hero-1.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Adventure</div>
                                <h2>Fate / Stay Night: Unlimited Blade Works</h2>
                                <p>After 30 days of travel across the world...</p>
                                <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="trending__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>Trending Now</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="/MovieWeb/movie/all" class="primary-btn">View All <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                   
                
                       <c:forEach var="item" items="${list }">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/MovieWeb/uploads/${item.image }">
                                        <div class="ep">${item.status }</div>
                                        <div class="comment"><i class="fa fa-comments"></i> ${item.ratingByMovie }</div>
                                        <div class="view"><i class="fa fa-eye"></i> ${item.viewByMovie}</div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>${item.genre }</li>
                                            <li>Movie</li>
                                        </ul>
                                        <h5><a href="/MovieWeb/moviedetails?movieId=${item.movieId }">${item.title }</a></h5>
                                    </div>
                                </div>
                            </div>
                       </c:forEach>
               
                        </div>
                    </div>
                    <div class="popular__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>Danh sách phim hay</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="/MovieWeb/movie/all" class="primary-btn">View All <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                   <c:forEach var="item" items="${listRandom }">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="/MovieWeb/uploads/${item.image }">
                                        <div class="ep">${item.status }</div>
                                        <div class="comment"><i class="fa fa-comments"> </i> ${item.ratingByMovie }</div>
                                        <div class="view"><i class="fa fa-eye"></i>  ${item.viewByMovie}</div>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                                  <li>${item.genre }</li>
                                            <li>Movie</li>
                                        </ul>
                                        <h5><a href="/MovieWeb/moviedetails?movieId=${item.movieId }">${item.title }</a></h5>
                                    </div>
                                </div>
                            </div>
                   </c:forEach>
                     
                          
                 
                       
                           
                        </div>
                    </div>
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
    <div class="product__sidebar__comment">
        <div class="section-title">
            <h5>Phim ngẫu nhiên</h5>
        </div>
       
              <c:forEach var="item" items="${listRandom1 }">
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