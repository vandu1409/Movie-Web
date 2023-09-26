<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="table-responsive p-2">
			<a class="btn btn-success" href="/MovieWeb/admin/user/add"> Thêm
				tài khoản <i class="fa fa-plus" aria-hidden="true"></i>
			</a> <a class="btn btn-info" href="/MovieWeb/admin/user/userDeleted">
				<i class="fa fa-list" aria-hidden="true"></i> Tài khản đã xóa
			</a>
		</div>
		<div class="d-flex flex-row-reverse mb-3">
			<form class=" navbar-search" method="get" action="">
				<div class="input-group">
					<input type="text" class="form-control bg-light border-0 small"
						placeholder="Search for..." aria-label="Search"
						aria-describedby="basic-addon2" name="search" value="${search }" id="search-input"  >
					<div class="input-group-append">
						<button class="btn btn-primary " type="button"
							style="padding: 12px 20px" onclick="handleSearchClick(${size },${page })">
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
					<th scope="col">Tên đăng nhập</th>
					<th scope="col">Email</th>
					<th scope="col">Quyền</th>
					<th scope="col">Xác thực</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${list }">
					<tr scope="row">
						<td><c:choose>
								<c:when test="${empty item.avatar }">
									<img
										src="https://i.pinimg.com/736x/c6/e5/65/c6e56503cfdd87da299f72dc416023d4.jpg"
										alt="" height="50px">
								</c:when>
								<c:otherwise>
									<img alt="" src="/MovieWeb/uploads/${item.avatar }"
										height="50px">
								</c:otherwise>
							</c:choose></td>
						<td>${item.fullname }</td>
						<td>${item.username }</td>
						<td>${item.email }</td>
						<td><c:choose>
								<c:when test="${item.role }">
                      Admin
                      </c:when>
								<c:otherwise>
                      User
                      </c:otherwise>
							</c:choose></td>

						<td><c:choose>
								<c:when test="${item.activated }">
                     	 Đã active
                      </c:when>
								<c:otherwise>
                      	 Chưa active
                      </c:otherwise>
							</c:choose></td>


						<td><a
							href="/MovieWeb/admin/user/edit?username=${item.username }"
							class="btn btn-info"><i class='bx bxs-pencil'></i> </a> <a
							onclick="btnDelete(this)" data-id="${item.username }"
							class="btn btn-danger"><i class='bx bx-trash'></i> </a></td>
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
						onclick="pagination(${size},${item },'${search }')"
							class="current-page">${item }</a>
					</c:when>
					<c:otherwise>
						<%-- <a
							href="/MovieWeb/admin/user/list?page=${item }&size=${size}&search=${search}">${item }</a> --%>
								<a
						onclick="pagination(${size},${item },'${search }')"
							class="text-white">${item }</a>
					</c:otherwise>
				</c:choose>


			</c:forEach>


		</div>
	</div>

	<!-- /.container-fluid -->