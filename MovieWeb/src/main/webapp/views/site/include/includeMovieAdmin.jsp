<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="table-responsive p-2">
	<a class="btn btn-success" href="/MovieWeb/admin/movie"> Thêm phim
		<i class="fa fa-plus" aria-hidden="true"></i>
	</a>
</div>
<div class="d-flex flex-row-reverse mb-3">
	<form class=" navbar-search" method="get" action="">
		<div class="input-group">
			<input type="text" class="form-control bg-light border-0 small"
				placeholder="Search for..." aria-label="Search"
				aria-describedby="basic-addon2" name="search" id="search-input" value="${search }">
			<div class="input-group-append">
				<button class="btn btn-primary " type="button" onclick="handleSearchClick(${size},${page })"
					style="padding: 12px 20px">
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
			<input hidden="" name="page" value="1"> <select name="size"
				onchange="handleSizeChange(this.value,'${search }')">
				<option value="5" ${size == '5' ? 'selected' : ''}>5</option>
				<option value="10" ${size == '10' ? 'selected' : ''}>10</option>
				<option value="15" ${size == '15' ? 'selected' : ''}>15</option>
				<option value="20" ${size == '20' ? 'selected' : ''}>20</option>
				<option value="25" ${size == '25' ? 'selected' : ''}>25</option>
			</select> <input hidden="" name="search" value="${search }">
		</form>
	</div>
	<thead>
		<tr>
			<th scope="col">Ảnh</th>
			<th scope="col">Tên</th>
			<th scope="col">Tác giả</th>
			<th scope="col">Studio</th>
			<th scope="col">View</th>
			<th scope="col">Lượt thích	</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${list }">
			<tr scope="row">
				<td><img alt="" src="/MovieWeb/uploads/${item.image }"
					height="50px"></td>
				<td>${item.title }</td>
				<td>${item.author }</td>
				<td>${item.studios }</td>
					<td> ${item.viewByMovie }</td>
				<td> ${item.favoriuteByMovie }</td>

				<td><a
					href="/MovieWeb/admin/movie/edit?movieId=${item.movieId }"
					class="btn btn-info"><i class='bx bxs-pencil'></i> </a> <a
					href="/MovieWeb/admin/episode/add?movieId=${item.movieId }"
					class="btn btn-danger"><i class='bx bx-plus'></i> </a> <a
					href="/MovieWeb/admin/episode/list?movieId=${item.movieId }"
					class="btn btn-success"><i class='bx bx-list-ul'></i> </a>
					 <a
					href="/MovieWeb/admin/getListFavourite?movieId=${item.movieId }"
					class="btn btn-danger"><i class='bx bxs-heart'></i></a>
					</td>
			</tr>
		</c:forEach>

	</tbody>
</table>

<div class="product__pagination" id="pagination">

	<c:forEach var="item" items="${pageNumber }">
		<c:choose>
			<c:when test="${item eq page}">
			<%-- 	<a
					href="/MovieWeb/admin/movie/list?page=${item }&size=${size}&search=${search}"
					class="current-page">${item }</a> --%>
						<a
				onclick="pagination(${size}, ${item } ,'${search }')"
					class="current-page">${item }</a>
			</c:when>
			<c:otherwise>
<%-- 				<a
					href="/MovieWeb/admin/movie/list?page=${item }&size=${size}&search=${search}">${item }</a> --%>
						<a
				onclick="pagination(${size}, ${item } ,'${search }')"
					class="text-white">${item }</a>
			</c:otherwise>
		</c:choose>

	</c:forEach>


</div>
</div>

<!-- /.container-fluid -->