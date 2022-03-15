<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>파트너 차단</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${contextPath}/resources/admin/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Start Bootstrap</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                대시보드
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                재무
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="reservationStatus.html">예약 현황 관리</a>
                                    <a class="nav-link" href="transactionHistory.html">거래 내역 리스트</a>
                                    <a class="nav-link" href="payment.html">대금 지급 관리</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts2" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                회원관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="userMember.html">회원 목록</a>
                                    <a class="nav-link" href="reportedUser.html">신고 및 이용이 제한된 회원 관리</a>
                                    <a class="nav-link" href="">회원 탈퇴</a>                                 
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts3" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                파트너 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts3" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="PartnerMember.html">파트너 목록</a>
                                    <a class="nav-link" href="blockPartner.html">파트너 계정 차단</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts4" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                사이트 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts4" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="faq.html">문의 게시판</a>
                                    <a class="nav-link" href="banner.html">추천 여행지(배너)</a>
                                    <a class="nav-link" href="terms.html">이용 약관 관리</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts5" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                호텔 목록
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts5" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="hotelList.html">호텔 목록</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">Login</a>
                                            <a class="nav-link" href="register.html">Register</a>
                                            <a class="nav-link" href="password.html">Forgot Password</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                회원 차단
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>last name</th>
                                            <th>first name</th>
                                            <th>email</th>
                                            <th>보유 호텔</th>
                                            <th>차단 사유</th>
                                            <th>이용제한 설정</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>장</td>
                                            <td><a href="partnerMemberDetail.html">진아</a></td>
                                            <th>a@asd.com</th>
                                            <td>신라호텔</td>
                                            <td><div class="dataTable-dropdown">
                                                <label>
                                                    <select class="dataTable-selector">
                                                        <option value="a">잦은 신고</option>
                                                        <option value="b">규칙 위반</option>
                                                        <option value="c">허위 사실 기제</option>
                                                        <option value="d">기타</option>
                                                    </select>                                                        
                                                </label>
                                            </div>
                                        </td>
                                            <td>
                                                <button id="infoDelete" class="btn btn-danger" onclick="">차단</button>
                                            </td>    
                                        </tr>
                                        <tr>
                                            <td>최</td>
                                            <td><a href="partnerMemberDetail.html">태원</a></td>
                                            <th>b@asd.com</th>
                                            <td>신라호텔</td>
                                            <td><div class="dataTable-dropdown">
                                                <label>
                                                    <select class="dataTable-selector">
                                                        <option value="a">잦은 신고</option>
                                                        <option value="b">규칙 위반</option>
                                                        <option value="c">허위 사실 기제</option>
                                                        <option value="d">기타</option>
                                                    </select>                                                        
                                                </label>
                                            </div>
                                            </td>
                                            <td>
                                                <button id="infoDelete" class="btn btn-danger" onclick="">차단</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>김</td>
                                            <td><a href="partnerMemberDetail.html">상민</a></td>
                                            <th>c@asd.com</th>
                                            <td>신라호텔</td>
                                            <td><div class="dataTable-dropdown">
                                                <label>
                                                    <select class="dataTable-selector">
                                                        <option value="a">잦은 신고</option>
                                                        <option value="b">규칙 위반</option>
                                                        <option value="c">허위 사실 기제</option>
                                                        <option value="d">기타</option>
                                                    </select>                                                        
                                                </label>
                                            </div>
                                        </td>
                                        <td>
                                            <button id="infoDelete" class="btn btn-danger" onclick="">차단</button>
                                        </td>    
                                        </tr>
                                        <tr>
                                            <td>이</td>
                                            <td><a href="partnerMemberDetail.html">소희</a></td>
                                            <th>d@asd.com</th>
                                            <td>신라호텔</td>
                                            <td><div class="dataTable-dropdown">
                                                <label>
                                                    <select class="dataTable-selector">
                                                        <option value="a">잦은 신고</option>
                                                        <option value="b">규칙 위반</option>
                                                        <option value="c">허위 사실 기제</option>
                                                        <option value="d">기타</option>
                                                    </select>                                                        
                                                </label>
                                            </div>
                                        </td>
                                            <td>
                                                <button id="infoDelete" class="btn btn-danger" onclick="">차단</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>정</td>
                                            <td><a href="partnerMemberDetail.html">광호</a></td>
                                            <th>e@asd.com</th>
                                            <td>신라호텔</td>
                                            <td><div class="dataTable-dropdown">
                                                <label>
                                                    <select class="dataTable-selector">
                                                        <option value="a">잦은 신고</option>
                                                        <option value="b">규칙 위반</option>
                                                        <option value="c">허위 사실 기제</option>
                                                        <option value="d">기타</option>
                                                    </select>                                                        
                                                </label>
                                            </div>
                                        </td>
                                        <td>
                                            <button id="infoDelete" class="btn btn-danger" onclick="">차단</button>
                                        </td>    
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <br><br><br><br><br><br><br><br>
                    <div class="container-fluid px-4">
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                차단된 회원
                            </div>
                            
                            <div class="card-body">
                                <table id="datatablesSimple1">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>last name</th>
                                            <th>first name</th>
                                            <th>email</th>
                                            <th>이용제한 설정</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td><a href="userMemberDetail.html">abc@abc.com</a></td>
                                            <td>장진아</td>
                                            <td><a href="hotelDetail.html">신라호텔</a></td>
                                            <td><button id="block" class="btn btn-info" onclick="blockUser();">제한해제</button></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td><a href="userMemberDetail.html">bbc@abc.com</a></td>
                                            <td>최태원</td>
                                            <td>신라호텔</td>
                                            <td><button id="block" class="btn btn-info" onclick="blockUser();">제한해제</button></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td><a href="userMemberDetail.html">ccc@abc.com</a></td>
                                            <td>김상민</td>
                                            <td>신라호텔</td>
                                            <td><button id="block" class="btn btn-info" onclick="blockUser();">제한해제</button></td>                                           
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/admin/javascript/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/admin/javascript/datatables-simple-demo.js"></script>
    </body>
</html>