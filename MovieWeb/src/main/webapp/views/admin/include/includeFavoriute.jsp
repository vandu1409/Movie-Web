<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="table-responsive p-2">
			 <a class="btn btn-info" href="/MovieWeb/admin/movie/list">
				<i class="fa fa-list" aria-hidden="true"></i> Danh sách phim
			</a>
		</div>
		<div class="d-flex flex-row-reverse mb-3">
			
		</div>
		<table class="table table-bordered ">
			<div class="product__page__filter">
				<p class="text-white" style="font-size: 17px">Size:</p>
				<form action="">
					<input hidden="" name="page" value="1"> <select name="size"
						onchange="handleSizeChange(this.value,'${movieId }')">
						<option value="1" ${size == '1' ? 'selected' : ''}>1</option>
						<option value="2" ${size == '2' ? 'selected' : ''}>2</option>
						<option value="15" ${size == '15' ? 'selected' : ''}>15</option>
						<option value="20" ${size == '20' ? 'selected' : ''}>20</option>
						<option value="25" ${size == '25' ? 'selected' : ''}>25</option>
					</select> 
				</form>
			</div>
			<thead>
				<tr>
					<th scope="col">Phim</th>
					<th scope="col">Tên phim</th>
					<th scope="col">Người thích</th>
					<th scope="col">Ngày</th>
			
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${list }">
					<tr scope="row">
						<td> <img alt="" src="/MovieWeb/uploads/${item.movie.image }" height="70px"> </td>
						<td>${item.movie.title }</td>
						<td>${item.user.username }</td>
						<td>${item.likeDate }</td>
					
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<div class="product__pagination">
			<c:forEach var="item" items="${pageNumber }">

				<c:choose>
					<c:when test="${item eq page}">
						<%-- <a
							href="/MovieWeb/admin/user/list?page=${item }&size=${size}&search=${search}"
							class="current-page">${item }</a> --%>
							<a
						onclick="pagination(${size},${item },,'${movieId }')"
							class="current-page">${item }</a>
					</c:when>
					<c:otherwise>
						<%-- <a
							href="/MovieWeb/admin/user/list?page=${item }&size=${size}&search=${search}">${item }</a> --%>
								<a
						onclick="pagination(${size},${item },'${movieId }')"
							class="text-white">${item }</a>
					</c:otherwise>
				</c:choose>


			</c:forEach>


		</div>
	</div>

	<!-- /.container-fluid -->