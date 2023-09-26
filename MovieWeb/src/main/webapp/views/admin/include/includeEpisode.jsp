<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="table-responsive p-2">
	<a class="btn btn-success"
		href="/MovieWeb/admin/episode/add?movieId=${movieId }"><i
		class='bx bx-plus-medical'></i>Thêm tập phim</a> <a class="btn btn-info"
		href="/MovieWeb/admin/movie/list"><i class='bx bx-list-ul'></i>Danh
		sách phim</a>
</div>

<div class="d-flex flex-row-reverse mb-3">
	<form class=" navbar-search" method="post">
		<div class="input-group">
			<input type="text" class="form-control bg-light border-0 small"
				placeholder="Search for..." aria-label="Search"
				aria-describedby="basic-addon2" name="search" id="search-input" value="${search }">
			<div class="input-group-append">
				<button class="btn btn-primary " type="button" onclick="handleSearchClick(${size},${page},'${movieId }')">
					<i class='bx bx-search'></i>
				</button>
			</div>
		</div>
	</form>
</div>
<table class="table table-bordered ">
	<div class="">
		<label class="text-white">Size:</label> <br> <select name="size"
			onchange="handleSizeChange(this.value,'${search }','${movieId }')" class="ml-2 mt-2">
			<option value="3" ${size == '3' ? 'selected' : ''}>3</option>
			<option value="6" ${size == '6' ? 'selected' : ''}>6</option>
			<option value="9" ${size == '9' ? 'selected' : ''}>9</option>
			<option value="12" ${size == '12' ? 'selected' : ''}>12</option>
		</select>

	</div>
	<thead>
		<tr>
			<th scope="col">Phim</th>
			<th scope="col">Tên phim</th>
			<th scope="col">Tên tập</th>
			<th scope="col">Ngày tạo</th>
			<th scope="col">Lượt xem</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${list }">
			<tr scope="row">
				<td><img alt="" src="/MovieWeb/uploads/${item.movie.image }"
					height="50px"></td>
				<td>${item.movie.title }</td>
				<td>${item.title }</td>
				<td>${item.createDate }</td>
				<td>${item.viewByEpisode }</td>
				<td><a
					href="/MovieWeb/admin/episode/edit?movieId=${item.movie.movieId }&episodeId=${item.episodeId	}"
					class="btn btn-info"><i class='bx bxs-pencil'></i> Edit</a> <a
					onclick="btnDelete(${item.movie.movieId},${item.episodeId })" class="btn btn-danger"><i
						class='bx bx-trash'></i> Xóa</a></td>
			</tr>
		</c:forEach>

	</tbody>
</table>
         <div class="product__pagination">
                    
                     <c:forEach var="item" items="${pageNumber }">
                      <c:choose>
							  <c:when test="${item eq page}">
							<%--     <a class="current-page" href="/MovieWeb/movie/search?page=${item}&size=${size}&keyword=${keyword}">${item}</a> --%>
							    	    <a class="current-page" onclick="pagination(${size}, ${item } ,'${search}','${movieId }')">${item}</a>
							  </c:when>
							  <c:otherwise>
							   <%--  <a href="/MovieWeb/movie/search?page=${item}&size=${size}&keyword=${keyword}">${item}</a> --%>
							   <a class="" onclick="pagination(${size}, ${item } ,'${search}','${movieId }')">${item}</a>
							  </c:otherwise>
							</c:choose>

                    </c:forEach>
                
                       
                    </div>
</div>

<!-- /.container-fluid -->