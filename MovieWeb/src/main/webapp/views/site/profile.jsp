<%@ page language="java" pageEncoding="utf-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">
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
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
            <style>
                .emp-profile {
                    padding: 3%;
                    margin-top: 3%;
                    margin-bottom: 3%;
                    border-radius: 0.5rem;
                    background: #fff;

                }

                .profile-img {
                    text-align: center;
                }

                .profile-img img {
                    width: 40%;
                    height: 60%;
                }

                .profile-img .file {
                    position: relative;
                    overflow: hidden;
                    margin-top: -20%;
                    width: 60%;
                    border: none;
                    border-radius: 0;
                    font-size: 15px;
                    background: #212529b8;
                }

                .profile-img .file input {
                    position: absolute;
                    opacity: 0;
                    right: 0;
                    top: 0;
                }


                .proile-rating {
                    font-size: 12px;
                    color: #818182;
                    margin-top: 5%;
                }

                .proile-rating span {
                    color: #495057;
                    font-size: 15px;
                    font-weight: 600;
                }



                .profile-head .nav-tabs .nav-link.active {
                    border: none;
                    border-bottom: 2px solid #339966;
                }

                .profile-tab label {
                    font-weight: 600;
                }

                .btn-form {
                    font-size: 13px;
                    color: #ffffff;
                    background: #e53637;
                    display: inline-block;
                    font-weight: 400;
                    letter-spacing: 2px;
                    text-transform: uppercase;

                    border-radius: 4px;
                    margin-right: 11px;
                }

                label,
                p,
                h5,
                h6 {
                    color: white
                }
            </style>
        </head>

        <body>
          

            <jsp:include page="/views/menu.jsp"></jsp:include>


            <div class="container emp-profile shadow-lg" style="background-color:#0b0c2a ;">

                <div class="row">
                    <div class="col-md-4 text-center">
                        <div class="profile-img">
                        <form action="" enctype="multipart/form-data">
                            <c:choose>
                            <c:when test="${empty sessionScope.user.avatar }">
                            <img src="https://bloganchoi.com/wp-content/uploads/2022/02/avatar-trang-y-nghia.jpeg"
                                alt="" height="100x" id="image-preview" style="object-fit: cover;" />
                            </c:when>
                            <c:otherwise>
                            <img src="/MovieWeb/uploads/${sessionScope.user.avatar }"
                                alt="" height="100x" id="image-preview" style="object-fit: cover;" />
                            </c:otherwise>
                            </c:choose>
                            <div class="file btn btn-lg btn-primary">
                                Change Photo
                                <input type="file" name="file" id="input-file" />
          
                            </div>
  								   <div class="mt-1">
                                <a class="btn-form px-3 py-2 text-white" onclick="btnUploadAvatar()" type="button">Upload <i class="bi bi-cloud-arrow-up-fill"></i></a>
                               </div>
                        </div>

                    </div>
</form>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-12">
                                <div class="profile-head">

                                    <h5 class="">
                                        Văn dự
                                    </h5>
                                    <h6>
                                        Thành viên mới
                                    </h6>

                                    <div class="d-flex justify-content-end">
                                        <button type="button" class="btn-form p-2 " data-toggle="modal"
                                            data-target="#exampleModal" name="btnAddMore">Thay
                                            đổi thông tin </button>
                                        <button type="button" class="btn-form p-2 " data-toggle="modal"
                                            data-target="#modalchangepass" name="btnAddMore">Đổi
                                            mật khẩu </button>
                                    </div>

                                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home"
                                                role="tab" aria-controls="home" aria-selected="true"><b>Thông
                                                    tin</b></a>
                                        </li>

                                    </ul>
                                    <div class="tab-content profile-tab mt-3" id="myTabContent">
                                        <div class="tab-pane fade show active" id="home" role="tabpanel"
                                            aria-labelledby="home-tab">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Tên đăng nhập</label>
                                                </div>
                                                <div class="col-md-6">
                                                    <p>${sessionScope.user.username}</p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Họ và tên</label>
                                                </div>
                                                <div class="col-md-6">
                                                    <p>${sessionScope.user.fullname}</p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Email</label>
                                                </div>
                                                <div class="col-md-6">
                                                    <p>${sessionScope.user.email}</p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label>Loại tài khoản</label>
                                                </div>
                                                <div class="col-md-6">
                                                    <c:choose>
                                                        <c:when test="${sessionScope.user.role }">
                                                            <p>Admin</p>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p>User</p>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>

            </div>



            <!-- start modal info -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="background-color: #0b0c2a;">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Thay đổi thông tin</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form >
                                <div class="form-group">
                                    <label for="">Họ và tên</label>
                                    <input type="text" class="form-control"  id="user-fullname">
                                </div>
                                <div class="form-group">
                                    <label for="">Email</label>
                                    <input type="text" class="form-control"  id="user-email">
                                </div>

                        
                                <div class="form-group mt-1">
                                    <button class="btn-form p-2 w-100" type="button" onclick="btnChangeInfo()">Thay đổi</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <!-- end modal info -->

            <!-- start modal change password -->
            <div class="modal fade" id="modalchangepass" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="background-color: #0b0c2a;">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Thay đổi thông tin</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="">
                                <div class="form-group">
                                    <label for="">Mật khẩu hiện tại</label>
                                    <input type="text" class="form-control" id="currentPassword" name="password"
                                        required>

                                </div>
                                <div class="form-group">
                                    <label for="">Mật khẩu mới</label>
                                    <input type="text" class="form-control" id="newPassword" name="newPassword" required
                                        >

                                </div>

                                <div class="form-group">
                                    <label for="">Xác nhận mật khẩu</label>
                                    <input type="text" class="form-control" id="rePassword" name="rePassword">

                                </div>
                                <div class="form-group mt-3">
                                    <button class="btn-form p-2 w-100" type="button" onclick="btnChangePassword()">Thay đổi</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <!-- end modal chang password -->
            </div>
   <script>
                const inputFile = document.getElementById("input-file");
                const imagePreview = document.getElementById("image-preview");

                inputFile.addEventListener("change", function () {
                    const file = this.files[0];
                    const reader = new FileReader();

                    reader.addEventListener("load", function () {
                        imagePreview.src = reader.result;
                    });

                    reader.readAsDataURL(file);
                });

                function btnChangePassword() {
                    var currentPass = $("#currentPassword").val();
                    var newPassword = $("#newPassword").val();
                    var rePassword = $("#rePassword").val();
                    $.post('/MovieWeb/profile/changePass', {
                        currentPassword: currentPass,
                        newPassword: newPassword,
                        rePassword: rePassword
                    }).done( function (data) {
                
                        console.log(data.message);
                        
            	    	  if(data.message){
        		        	Swal.fire({
        			        	  title: 'Thông báo',
        			        	  text: data.message,
        			        	  icon: 'success',
        			        	  confirmButtonText: 'OK'
        			        	}).then((result) => {
        			        	  if (result.isConfirmed) {
        			        	    window.location.href = '/MovieWeb/profile';
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
              
                
                
                	function btnUploadAvatar() {
                		  console.log('đã thực hiện');
                		  var formData = new FormData();
                		  var fileInput = document.getElementById('input-file');
                		  formData.append('image', fileInput.files[0]);
                		  console.log('đã thực hiện');
                		  $.ajax({
                		    url: '/MovieWeb/profile/uploadAvatar',
                		    type: 'POST',
                		    data: formData,
                		    processData: false,
                		    contentType: false,
                		    success: function(data) {
                		      console.log(data.messaage);
                		      const Toast = Swal.mixin({
                                  toast: true,
                                  position: 'top-end',
                                  showConfirmButton: false,
                                  timer: 3000,
                                  timerProgressBar: true,
                                  didOpen: (toast) => {
                                      toast.addEventListener('mouseenter', Swal.stopTimer)
                                      toast.addEventListener('mouseleave', Swal.resumeTimer)
                                  }
                                  
                              })

                              Toast.fire({
                                  icon: 'info',
                                  title: data.message
                              })
                		    },
                		    error: function(xhr, status, error) {
                		
                		      Swal.fire(
                		        'Lỗi',
                		        'Đã xảy ra lỗi khi tải lên ảnh',
                		        'error'
                		      );
                		    }
                		  });
                		}

                	
                	function btnChangeInfo() {
              		  console.log('đã thực hiện');
              		var fullname = $("#user-fullname").val();
              		var email = $("#user-email").val()
              		  $.ajax({
              		    url: '/MovieWeb/profile/changeInfo',
              		    type: 'POST',
              		    data :{fullname:fullname,
              		    email:email},
  
              		    success: function(data) {
              		    	
              		      console.log(data.messaage);
              		      
              	    	  if(data.message){
          		        	Swal.fire({
          			        	  title: 'Thông báo',
          			        	  text: data.message,
          			        	  icon: 'success',
          			        	  confirmButtonText: 'OK'
          			        	}).then((result) => {
          			        	  if (result.isConfirmed) {
          			        	    window.location.href = '/MovieWeb/profile';
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
                    },
              		    error: function(xhr, status, error) {
              		
              		      Swal.fire(
              		        'Lỗi',
              		        'Thay đổi thông tin thất bại!',
              		        'error'
              		      );
              		    }
              		  });
              		}

				

            </script>
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
                                <script>document.write(new Date().getFullYear());</script> All rights reserved | This
                                template
                                is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a
                                    href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </p>

                        </div>
                    </div>
                </div>
            </footer>
            <!-- Footer Section End -->

            <!-- Search model Begin -->
            <div class="search-model">
                <div class="h-100 d-flex align-items-center justify-content-center">
                    <div class="search-close-switch"><i class="icon_close"></i></div>
                    <form class="search-model-form">
                        <input type="text" id="search-input" placeholder="Search here.....">
                    </form>
                </div>
            </div>
            <!-- Search model end -->
         
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