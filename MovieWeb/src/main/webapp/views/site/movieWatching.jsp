<%
    System.out.println("Page requested");
%>
<%@ page language="java"  pageEncoding="utf-8"%>
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
    <style>
				.ratingSelect	 {
						display: inline-block;
						font-size: 0;
					}

					.ratingSelect	  input {
						display: none;
					}

				 .ratingSelect  label {
						display: inline-block;
						font-size: 24px;
						color: gray;
						/* cursor: pointer; */
					}

					.ratingSelect	 input:checked~label {
						color: orange;
					}

					.ratingSelect	 .star {
						font-size: 20px;
						color: #ccc;
						cursor: pointer;
						transition: color 0.3s ease;
						margin-right: 5px;
					}



				.ratingSelect	.star.active,
				.ratingSelect	.star.active~.star {
						color: #ffbf00;
					}
	
	
					.ratings {
						display: flex;
						flex-direction: column;
					}

				.ratings	.rating {
						display: flex;
						align-items: center;
						margin-bottom: 10px;
					}

				.ratings	.star {
						font-size: 20px;
						cursor: pointer;
						margin-right: 5px;
					}

				.ratings	.star.active {
						color: #f5b301;
					}

				.ratings	.selected-rating {
						font-size: 18px;
						font-weight: bold;
						margin-left: 10px;
					}

					p {
							font-size: 17px;
						}
				</style>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
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
                        <a href="#">Romance</a>
                        <span>Fate Stay Night: Unlimited Blade</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Anime Section Begin -->
    <section class="anime-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="anime__video__player">
                        <video id="player" playsinline controls data-poster="/MovieWeb/views/lib//videos/anime-watch.jpg">
                        <!-- <div id="videobody"></div> -->
                        <source src="/MovieWeb/uploads/${episode.source }" type="video/mp4" />
                            <!-- Captions are optional -->
                            <track kind="captions" label="English captions" src="#" srclang="en" default />
                        </video>
                        
                    </div>
                    <div class="anime__details__episodes">
                        <div class="section-title">
                            <h5>${movie.title  } <c:if test="${episode!=null }"> - ${episode.title }</c:if>  </h5>
                        </div>
                      <c:forEach var="item" items="${list }">
                           <!-- <a onclick="btnEpisode(${movie.movieId},${item.episodeId})">${item.title }</a> -->
                           <a href="/MovieWeb/moviedetails/episodeDetails?movieId=${movie.movieId}&episodeId=${item.episodeId}">${item.title }</a>
                      </c:forEach>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8">
                     <div class="anime__details__form">
									<div class="section-title">
										<h5>Đánh giá phim</h5>
									</div>
									<form action="/MovieWeb/rating" method="post">
										<div class="ratingSelect">
											<input type="radio" id="star5" name="rating" value="5" /> <label
												for="star5">&#9733;</label> <input type="radio" id="star4" name="rating"
												value="4" /> <label for="star4">&#9733;</label>
											<input type="radio" id="star3" name="rating" value="3" /> <label
												for="star3">&#9733;</label> <input type="radio" id="star2" name="rating"
												value="2" /> <label for="star2">&#9733;</label>
											<input type="radio" id="star1" name="rating" value="1" /> <label
												for="star1">&#9733;</label>

										</div>
										
										<div hidden="">
										<input hidden="" value="${movie.movieId }" name="movieId">
										<input hidden="" value="${episode.episodeId} " name="episodeId">
										<input hidden="" value="1" name="check">
										</div>
										
										<textarea placeholder="Your Comment" name="review"></textarea>
										<button type="submit">
											<i class="fa fa-location-arrow"></i> Review
										</button>
									</form>
								</div>
                    <div class="anime__details__review mt-5">
                        <div class="section-title">
                            <h5>Reviews</h5>
                        </div>
                        
                        	<c:forEach var="item" items="${listRating }">
										<div class="anime__review__item">
											<div class="anime__review__item__pic">
												<c:choose>
													<c:when test="${empty item.user.avatar }">
														<img src="https://i.pinimg.com/736x/c6/e5/65/c6e56503cfdd87da299f72dc416023d4.jpg"
															alt="">
													</c:when>
													<c:otherwise>
														<img alt="" src="/MovieWeb/uploads/${item.user.avatar }">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="anime__review__item__text">
												<h6>
													${item.user.username } <span>${item.createDate }</span> <span>
														<div class="ratings">
															<div class="rating" data-value="${item.ratingScore }">
																<span class="star" data-value="1">&#9733;</span>
																<span class="star" data-value="2">&#9733;</span>
																<span class="star" data-value="3">&#9733;</span>
																<span class="star" data-value="4">&#9733;</span>
																<span class="star" data-value="5">&#9733;</span>
																<div class="selected-rating">${item.ratingScore }</div>
															</div>
														</div>

													</span>
												</h6>
												<p>${item.review }</p>
											</div>
										</div>
									</c:forEach>
                       
                   
                    </div>
               
                </div>
            </div>
        </div>
    </section>
    <!-- Anime Section End -->

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
<script type="text/javascript">
// $(document).ready(function() {
// 	function btnEpisode(movieId, episodeId) {
// 	    var url = "/MovieWeb/moviedetails/episodeDetails?movieId=" + movieId + "&episodeId=" + episodeId;
// 	    $.get(url, function(data, status, xhr) {
// 	        var episode = data.episode;
// 	        console.log(episode.source)
// 	        var htmlVideo = "<source src='/MovieWeb/uploads/" + episode.source + "' type='video/mp4' />";
// 	        document.getElementById('videobody').innerHTML = htmlVideo;
// 	    }, "JSON");
// 	}


// });
        

	const ratings = document.querySelectorAll('.rating');

					ratings.forEach((rating) => {
						const stars = rating.querySelectorAll('.star');
						const selectedRating = rating.querySelector('.selected-rating');
						const value = rating.getAttribute('data-value');

						setRating(stars, value);

						stars.forEach((star) => {
							star.addEventListener('click', () => {
								setRating(stars, star.getAttribute('data-value'));
							});
						});
					});

					function setRating(stars, value) {
						stars.forEach((star) => {
							if (star.getAttribute('data-value') <= value) {
								star.classList.add('active');
							} else {
								star.classList.remove('active');
							}
						});
					}
    

</script>
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