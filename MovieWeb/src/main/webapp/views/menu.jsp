<%@ page language="java" pageEncoding="utf-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    <!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="/MovieWeb/home">
                            <img src="img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="/MovieWeb/home">Trang chủ</a></li>
                             
                                <li ><a href="./blog.html">Our Blog</a></li>
                          
                                 <li><a href="">Phim <span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="/MovieWeb/movie/all">Tất cả phim</a></li>
                                    <c:if test="${not empty sessionScope.user}">
                                        <li><a href="/MovieWeb/listFavourite">Phim yêu thích</a></li>
                                    </c:if>
                                    
                                    </ul>
                                </li>
                                   <li><a href="">Tài khoản <span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                      <c:choose>
                                      <c:when test="${empty sessionScope.user }">
                                       <li><a href="/MovieWeb/login">Đăng nhập</a></li>
                                            <li><a href="/MovieWeb/register">Đăng ký</a></li>
                                      </c:when>
                                      <c:otherwise>
                                       <li><a href="/MovieWeb/logout">Đăng xuất</a></li>
                                      </c:otherwise>
                                      </c:choose>
                                       
                                   
                                    
                                    </ul>
                                </li>
                                <li>
                                <c:if test="${sessionScope.user.role }">
                                <a href="">Admin <span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="/MovieWeb/admin/movie/list">Danh sách phim</a></li>
                                        <li><a href="/MovieWeb/admin/movie">Thêm phim</a></li>
                                           <li><a href="/MovieWeb/admin/user/list">Danh sách tài khoản</a></li>
                                              <li><a href="/MovieWeb/admin/user/add">Thêm tài khoản</a></li>
                                    
                                    </ul>
                                </c:if>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
                        <a  class="search-switch"><span class="icon_search"></span></a>
                        
                        <c:choose>
                        <c:when test="${empty sessionScope.user }">
                        <a href="/MovieWeb/login"><span class="icon_profile"></span></a>
                       </c:when>
                       <c:otherwise>    
                        <a href="/MovieWeb/profile"><span class="icon_profile"></span></a>
                       </c:otherwise>
                        </c:choose>
                       
                     
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header End -->