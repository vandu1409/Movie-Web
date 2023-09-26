
<%@ page language="java"   pageEncoding="utf-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
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
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <!-- Css Styles -->
    <!-- <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"> -->
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="/MovieWeb/views/lib/css/mdb.min.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/style.css" type="text/css">
    
      <style>
        .video-container {
            position: relative;
            padding-bottom: 56.25%;
            /* 16:9 */
            height: 0;
        }

        .video-container video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
        
      
    </style>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <jsp:include page="/views/menu.jsp"></jsp:include>
    <div class="container mt-4 mb-5">
        <div class="card shadow p-3">
               <form action="/MovieWeb/admin/episode" method="post" enctype="multipart/form-data">
               <h4 class="text-center mb-3">Thêm tập phim</h4>
            <div class="row mt-1">
                <div class="col-md-6 mb-3">
                    <div class="">
                        <label for="movieId">Tên phim</label>
                        <input type="text" class="form-control" id="movieId" name="movieId" value="${movie.movieId }"  required hidden="">
                             <input type="text" class="form-control" id="movieId" name="" value="${movie.title }" disabled="disabled" >
                    </div>
                    <div class="mt-2">
                        <label for="episodeId">Mã tập phim</label>
                        <input type="text" class="form-control" id="episodeId" name="episodeId" value="${episode. episodeId}" >
                    </div>
                    <div class="mt-2">
                        <label >Video</label> <br>
                        <input type="file" class="form-control" name="source" id="source" value="${episode. source}">
                    </div>
                    <div class="mt-2">
                        <label for="title">Tên tập</label>
                        <input type="text" class="form-control" id="title" name="title" value="${episode. title}" required>
                    </div>
              
                    <div class="mt-2">
                        <label for="createDate">Ngày tạo</label>
                        <input type="date" class="form-control" id="createDate" name="createDate" value="${episode. createDate}"  required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="video-container">
                        <video controls src="/MovieWeb/uploads/${episode.source }"></video>
                    </div>
                </div>
            </div>
            <div class="row">
            
            </div>
            <div class="row">
                <div class="col-md-12 mb-3">
                    <label for="description">Mô tả</label>
                    <textarea class="form-control" id="description" name="description" rows="5" >${episode.description }</textarea>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-12">
                <c:choose>
                <c:when test="${isEdit }">
                  
                     <button class="btn btn-warning" type="submit" formaction="/MovieWeb/admin/episode/update" ><i
                                                        class='bx bxs-pencil'></i>Cật nhật</button>
                      <a class="btn btn-danger"  href="/MovieWeb/admin/episode/delete?movieId=${movie.movieId }&episodeId=${episode.episodeId}" ><i
                                                        class='bx bx-trash'></i>Xóa</a>
                </c:when>
                
                <c:otherwise>
                <button class="btn btn-primary" type="submit" formaction="/MovieWeb/admin/episode/insert" ><i
                                                        class='bx bx-plus-medical'></i>Thêm tập</button>
                </c:otherwise>
                </c:choose>
                  
                       <a class="btn btn-info"  href="/MovieWeb/admin/episode/add?movieId=${movie.movieId }" ><i
                                                        class='bx bx-loader'></i>Làm mới</a>
                       <a class="btn btn-success"  href="/MovieWeb/admin/episode/list?movieId=${movie.movieId }" ><i
                                                        class='bx bx-list-ul'></i>Danh sách</a>
                </div>
            </div>
        </form>
           

        </div>

        <!-- /.container-fluid -->

    </div>

    <!-- Footer Section Begin -->
    <footer class="footer mt-4">
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
                        Copyright &copy;
                        <script>document.write(new Date().getFullYear());</script> All rights reserved | This template
                        is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com"
                            target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>

                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

 <jsp:include page="/views/search.jsp"></jsp:include>
    <script>
        // Listen for file input change
        const sourceInput = document.getElementById('source');
        sourceInput.addEventListener('change', function () {
            const file = this.files[0];
            if (file && file.type.startsWith('video/')) {
                const videoContainer = document.querySelector('.video-container');
                const videoElement = videoContainer.querySelector('video');
                videoElement.src = URL.createObjectURL(file);
                videoContainer.classList.remove('d-none');
            }
        });
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