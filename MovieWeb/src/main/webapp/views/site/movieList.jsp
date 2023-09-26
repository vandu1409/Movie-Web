<%@ page language="java" pageEncoding="utf-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
     
      <c:forEach var="item" items="${list }">
                            <div class="col-lg-4 col-md-6 col-sm-6" id="movie-list">
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

                          
                              <div class="product__pagination" id="pagination">
                    <c:if test="${totalPage>0 }">
                     <c:forEach var="item" items="${pageNumber }">
                       <a href="" class="" page="${item }">${item }</a>
                    </c:forEach>
                    </c:if>
                        
                    </div>
                    
                    
                    <script type="text/javascript">
                    $(document).ready(function() {
                    	  // Khởi tạo trang đầu tiên
                    	  loadMovies(1);

                    	  // Xử lý khi người dùng click vào một phân trang
                    	  $(document).on("click", "#pagination a", function(e) {
                    	    e.preventDefault();
                    	    var page = $(this).data("page");
                    	    loadMovies(page);
                    	  });
                    	});

                    	function loadMovies(page) {
                    	  // Thực hiện AJAX request để lấy danh sách phim
                    	  $.ajax({
                    	    url: "/MovieWeb/movie/pagination",
                    	    data: {
                    	      page: page
                    	    },
                    	    success: function(response) {
                    	      // Cập nhật danh sách phim trên trang
                    	      $("#movie-list").html(response);
                    	      // Cập nhật danh sách phân trang trên trang
                    	      $("#pagination").html($("#pagination-data", response).html());
                    	    },
                    	    error: function(xhr, status, error) {
                    	      console.log("AJAX error: " + status + " - " + error);
                    	    }
                    	  });
                    	}

</script>