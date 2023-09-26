<%@ page language="java"   pageEncoding="utf-8"%>
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
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <!-- <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"> -->
        <link rel="stylesheet" href="/MovieWeb/views/lib/css/mdb.min.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/style.css" type="text/css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
       <jsp:include page="/views/menu.jsp"></jsp:include>
    <div class="container mt-3 mb-3 p-4"  >
        <div class="card shadow p-4">
            <form action="/MovieWeb/admin/movie" method="post" enctype="multipart/form-data">
                <h4>Thêm phim mới</h4>

                <div class="row">
                    <div class="col-4">
                        <label for="">Id</label>
                        <input type="text" name="movieId" class="form-control" value="${movie.movieId }">
                    </div>
                    <div class="col-4">
                        <label for="">Tên phim</label>
                        <input type="text" name="title" class="form-control" value="${movie.title }">
                    </div>

                    <div class="col-4">
                        <label for="">Hình ảnh</label>
                        <input type="file" name="image" class="form-control" >
                    </div>
                </div>

                <div class="row">
                    <div class="col-6">
                        <label for="">Tác giả</label>
                        <input type="text" name="author" class="form-control" value="${movie.author }">
                    </div>
                    <div class="col-6">
                        <label for="">Studio</label>
                        <input type="text" name="studios" class="form-control" value="${movie.studios }">
                    </div>
                </div>

                <div class="row">
                    <div class="col-6">
                        <label for="">Trạng thái</label>
                        <input type="text" name="status" class="form-control" value="${movie.status }">
                    </div>
                    <div class="col-6">
                        <label for="">Thể loại</label>
                        <input type="text" name="genre" class="form-control" value="${movie.genre }">
                    </div>
                </div>

                <div class="row">
                    <div class="col-6">
                        <label for="">Ngày phát sóng</label>
                        <input type="date" name="releaseDate" class="form-control" value="${movie.releaseDate }">
                    </div>
                    <div class="col-6">
                        <label for="">Thời gian</label>
                        <input type="text" name="duration" class="form-control" value="${movie.duration }">
                    </div>
                </div>

                <div class="row">
                    <div class="col-8">
                        <label>Mô tả</label>
                        <textarea name="description" id="" cols="30" rows="5" class="form-control" >${movie.description }</textarea>
                    </div>
                </div>

                <div class="mt-3">
                   <c:choose>
                   <c:when test="${isEdit }">
                   
                   <button class="btn btn-success" formaction="/MovieWeb/admin/movie/update"><i class='bx bxs-pencil'></i>Cập nhật</button>
                    <a class="btn btn-danger" href="/MovieWeb/admin/movie/delete?movieId=${movie.movieId }"><i class='bx bx-trash'></i>Xóa</a>
                   </c:when>
                   
                   <c:otherwise>
                    <button class="btn btn-success" formaction="/MovieWeb/admin/movie/insert"><i
                            class='bx bx-plus-medical'></i>Thêm</button>
                   </c:otherwise>
                   </c:choose>
                    
                    <a class="btn btn-info" href="/MovieWeb/admin/movie"><i class='bx bx-loader'></i>Mới</a>
                    <a href="/MovieWeb/admin/movie/list" class="btn btn-primary"><i class='bx bx-list-ul'></i> Danh sách</a>

                </div>
            </form>


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