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
       <link rel="stylesheet" href="/MovieWeb/views/lib/css/mdb.min.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/MovieWeb/views/lib/css/style.css" type="text/css">

<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<base href="/">
    <style>
        tr,th,tr,tbody{
          font-weight: bold;
          color:white;
          border: white;
        }

    </style>
  
</head>

<body>
    <!-- Page Preloder -->
  
       <jsp:include page="/views/menu.jsp"></jsp:include>
    
    <div class="container mt-5">
       <div class="table-responsive p-2">
                                    <a class="btn btn-success" href="/MovieWeb/admin/user/list">
                                       <i class="fa fa-list" aria-hidden="true"></i> Danh sách tài khoản</a>
                                </div>
                                <div class="d-flex flex-row-reverse mb-3">
                                    <form class=" navbar-search"
                                        method="get" action="">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small"
                                                placeholder="Search for..." aria-label="Search"
                                                aria-describedby="basic-addon2" name="search" value="${search }">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary " type="submit" style="padding:  12px 20px">
                                             <i class='bx bx-search-alt-2'></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
        <table class="table table-bordered ">
       							 <div class="product__page__filter">
                                        <p class="text-white" style="font-size: 17px">Size:</p>
                                        <form action="">
                                              <input hidden="" name="page" value="1">
			                                    <select name="size" onchange="this.form.submit()">
												    <option value="5" ${size == '5' ? 'selected' : ''}>5</option>
												    <option value="10" ${size == '10' ? 'selected' : ''}>10</option>
												    <option value="15" ${size == '15' ? 'selected' : ''}>15</option>
												    <option value="20" ${size == '20' ? 'selected' : ''}>20</option>
												    <option value="25" ${size == '25' ? 'selected' : ''}>25</option>
											</select>
                                  
                                        <input hidden="" name="search" value="${search }">
                                       </form>
                                    </div>
            <thead>
                <tr>
                    <th scope="col">Ảnh</th>
                    <th scope="col">Tên</th>
                    <th scope="col">Tên đăng nhập</th>
                    <th scope="col">Email</th>
                    <th scope="col">Quyền</th>
           			 <th scope="col">Xác thực</th>
   
                </tr>
            </thead>
            <tbody>
             <c:forEach var="item" items="${list }">
                <tr scope="row">
                    <td>
                <c:choose>
						<c:when test="${empty item.avatar }">
									<img src="https://i.pinimg.com/736x/c6/e5/65/c6e56503cfdd87da299f72dc416023d4.jpg"
										alt="" height="50px">
						</c:when>
						<c:otherwise>
									<img alt="" src="/MovieWeb/uploads/${item.avatar }" height="50px">
						</c:otherwise>
						</c:choose>
                    </td>
                    <td >${item.fullname }</td>
                     <td >${item.username }</td>
                     <td >${item.email }</td>
    	 <td>                
      <c:choose>
                      <c:when test="${item.role }">
                      Admin
                      </c:when>
                      <c:otherwise>
                      User
                      </c:otherwise>
                      </c:choose>
                      </td>
                      
             <td>
                 <c:choose>
                      <c:when test="${item.activated }">
                     	 Đã active
                      </c:when>
                      <c:otherwise>
                      	 Chưa active
                      </c:otherwise>
                      </c:choose>
             </td>
                   
                   
                    <td>
                    
                        <a onclick="btnRestore(this)" data-id="${item.username }"
                            class="btn btn-danger"><i class='bx bx-refresh'></i> Khôi phục</i>
                           </a>
                    
                    </td>
                     </tr>
             </c:forEach>

            </tbody>
        </table>
   <div class="product__pagination">
   <c:forEach var="item" items="${pageNumber }">
   
                   <c:choose>
							  <c:when test="${item eq page}">
							    <a href="/MovieWeb/admin/user/userDeleted?page=${item }&size=${size}&search=${search}" class="current-page">${item }</a>
							  </c:when>
							  <c:otherwise>
						  <a href="/MovieWeb/admin/user/userDeleted?page=${item }&size=${size}&search=${search}">${item }</a>
							  </c:otherwise>
							</c:choose>
   
 
   </c:forEach>
                        
                      
                    </div>
    </div>

        <!-- /.container-fluid -->

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
<script type="text/javascript">
function btnRestore(element) {
	var userId = $(element).data('id')
	 $.get('/MovieWeb/admin/user/restore?username='+userId, {
	    	
	    }).done( function (data) {
	    	
	    	  if(data.message){
		        	Swal.fire({
			        	  title: 'Thông báo',
			        	  text: data.message,
			        	  icon: 'info',
			        	  confirmButtonText: 'OK'
			        	}).then((result) => {
			        	  if (result.isConfirmed) {
			        	    window.location.href = '/MovieWeb/admin/user/userDeleted';
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