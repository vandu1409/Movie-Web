
<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<base href="/">
     <div class="product__page__content">
                        <div class="product__page__title">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-6">
                                    <div class="section-title">
                                        <h4>Danh sách phim</h4>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6">
                                    <div class="product__page__filter">
                                        <p>Size</p>
                                       <form action="">
                                  <select name="size" onchange="handleSizeChange(this.value)">
									    <option value="3" ${size == '3' ? 'selected' : ''}>3</option>
									    <option value="6" ${size == '6' ? 'selected' : ''}>6</option>
									    <option value="9" ${size == '9' ? 'selected' : ''}>9</option>
									    <option value="12" ${size == '12' ? 'selected' : ''}>12</option>
								</select>

                                        <input hidden="" name="page" value="1">
                                       </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
      
                          <c:forEach var="item" items="${list }">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/uploads/${item.image }" style="background-image: url(/MovieWeb/uploads/${item.image });">
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
                     
                          
                      
                        </div>
                    </div>
                    <div class="product__pagination" id="pagination">
                    <c:if test="${totalPage>1 }">
                     <c:forEach var="item" items="${pageNumber }">
                      <c:choose>
							  <c:when test="${item eq page}">
						<%-- 	    <a class="current-page" href="/MovieWeb/movie/all?page=${item}&size=${size}">${item}</a> --%>
						<a class="current-page" onclick="pagination(${size},${item })">${item}</a>
							  </c:when>
							  <c:otherwise>
							 <%--    <a href="/MovieWeb/movie/all?page=${item}&size=${size}">${item}</a> --%>
							 	<a class="" onclick="pagination(${size},${item })">${item}</a>
							  </c:otherwise>
							</c:choose>

                    </c:forEach>
                    </c:if>
                        
                    </div>