<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>以書會友 | 管理員專區</title>

<!-- import favicon -->
<link rel="shortcut icon" 
   href="${pageContext.request.contextPath}/img/favicon.ico"
   type="image/x-icon" >

<!-- 01. import CSS (Element UI) -->
<link rel="stylesheet"
	href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

<!-- =================== 套版 import css start =================== -->
<!-- Custom fonts for this template -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="../vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<!-- =================== 套版 import css end =================== -->

<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" -->
<!-- 	crossorigin="anonymous"> -->


<style>
.keyword {
	margin: 30px 0px;
}

.hideDetail {
	display: none;
}

.showDetail {
	display: block;
	content: 'close';
}

.circle {
	width: 40px;
	height: 40px;
	border-radius: 50%;
}
</style>


</head>
<!-- =============================下面是套版============================= -->
<body id="page-top">
<!-- =============================上面是套版============================= -->

	<%
	String role = "";
	if (session.getAttribute("login") != null) {
		role = (String) session.getAttribute("login");
		System.out.println("===================================" + role);
		if (role.equals("admin")) {
			role = "管理";
		}
	}
	%>

	<!-- =============================下面是套版============================= -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="http://localhost:8080/store/booksMain">
				<div class="sidebar-brand-icon rotate-n-15">
					<!--                     <i class="fas fa-laugh-wink"></i> -->
				</div>
<!-- 				<div class="sidebar-brand-text mx-3">SWAPOOKS</div> -->
				<div class="sidebar-brand-text mx-3"><img src="../img/logoname-white.png" width="180px"></div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link" href="/mainpage"> <i
					class="fas fa-fw fa-tachometer-alt"></i> <span>管理員首頁</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">功能管理</div>

			<!-- Nav Item - 書友管理 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseReader"
				aria-expanded="true" aria-controls="collapseReader"> <i
					class="fas fa-fw fa-user-circle"></i> <span>書友管理</span>
			</a>
				<div id="collapseReader" class="collapse"
					aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item"
							href="http://localhost:8080/admin/allreaderpage">查詢全部書友</a> <a
							class="collapse-item"
							href="http://localhost:8080/admin/createreaderpage">新增書友</a>
					</div>
				</div></li>

			<!-- Nav Item - 書架管理 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseBooks"
				aria-expanded="true" aria-controls="collapseBooks"> <i
					class="fas fa-fw fa-book-open"></i> <span>書架管理</span>
			</a>
				<div id="collapseBooks" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item"
							href="http://localhost:8080/admin/admin.books">查詢全部書籍</a> <a
							class="collapse-item"
							href="http://localhost:8080/admin/admin.booksadd">書籍上架</a>
					</div>
				</div></li>

			<!-- Nav Item - 訂單管理 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseOrders"
				aria-expanded="true" aria-controls="collapseOrders"> <i
					class="fas fa-fw fa-money-check"></i> <span>訂單管理</span>
			</a>
				<div id="collapseOrders" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item"
							href="http://localhost:8080/order/gotosearchall">查詢全部訂單</a> <a
							class="collapse-item"
							href="http://localhost:8080/order/gotoaddorders">新增訂單</a>
					</div>
				</div></li>

			<!-- Nav Item - 社群管理 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseClubs"
				aria-expanded="true" aria-controls="collapseClubs"> <i
					class="fas fa-fw fa-comments"></i> <span>社群管理</span>
			</a>
				<div id="collapseClubs" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item"
							href="http://localhost:8080/club/clubmain.controller">查詢文章</a>
						<a class="collapse-item"
							href="http://localhost:8080/club/creport.controller">檢舉明細</a>
					</div>
				</div></li>

			<!-- Nav Item - 活動管理 -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseEvents"
				aria-expanded="true" aria-controls="collapseEvents"> <i
					class="fas fa-fw fa-calendar-day"></i> <span>活動管理</span>
			</a>
				<div id="collapseEvents" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item"
							href="http://localhost:8080/searchallevent">查詢全部活動</a> <a
							class="collapse-item" href="http://localhost:8080/gotoAddPage">建立活動</a>
					</div>
				</div></li>

			<!-- Divider -->
<!-- 			<hr class="sidebar-divider"> -->

			<!-- Heading -->
<!-- 			<div class="sidebar-heading">統計管理</div> -->

			<!-- Nav Item - Pages Collapse Menu -->
<!-- 			<li class="nav-item"><a class="nav-link collapsed" href="#" -->
<!-- 				data-toggle="collapse" data-target="#collapsePages" -->
<!-- 				aria-expanded="true" aria-controls="collapsePages"> <i -->
<!-- 					class="fas fa-fw fa-chart-line"></i> <span>統計圖表</span> -->
<!-- 			</a> -->
<!-- 				<div id="collapsePages" class="collapse" -->
<!-- 					aria-labelledby="headingPages" data-parent="#accordionSidebar"> -->
<!-- 					<div class="bg-white py-2 collapse-inner rounded"> -->
<!-- 						<a class="collapse-item" href="login.html">書友相關</a> <a -->
<!-- 							class="collapse-item" href="register.html">書籍相關</a> <a -->
<!-- 							class="collapse-item" href="forgot-password.html">訂單相關</a> <a -->
<!-- 							class="collapse-item" href="404.html">社群相關</a> <a -->
<!-- 							class="collapse-item" href="blank.html">活動相關</a> -->
<!-- 					</div> -->
<!-- 				</div></li> -->

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<form class="form-inline">
						<button id="sidebarToggleTop"
							class="btn btn-link d-md-none rounded-circle mr-3">
							<i class="fa fa-bars"></i>
						</button>
					</form>

					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">${userDetail.fullName}</span>
								<img class="img-profile rounded-circle"
								src="/admin/showreaderphoto/${userDetail.readerId}">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 管理員資訊
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="/logout"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									登出
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->


				<div class="container-fluid">
					<!-- =============================上面是套版============================= -->
					<!-- =============================下面是主要內容============================= -->
					
					<h1 style="text: center; font-size: 30px; margin-top: 20px">書友管理</h1>
					<hr style="margin-top: 0px">
					
					<div id="main">
						<div style="margin-bottom:40px;">
						<!-- Donut Chart (性別) -->
						<div class="col-xl-4 col-lg-5" style="float:left">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-secondary">讀者性別分布</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body" align="center">
									<div class="chart-pie pt-4">
										<canvas id="genderChart"></canvas>
									</div>
									<hr>
									男性讀者：${genderCount[0]} 人 &nbsp;/ &nbsp;女性讀者：${genderCount[1]} 人
									<br>
									讀者總人數：${genderCount[0]+genderCount[1]} 人
								</div>
							</div>
						</div>
						
						<!-- Bar Chart (年齡) -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-secondary">讀者年齡分布</h6>
                            </div>
                            <div class="card-body">
                                <div class="chart-bar">
                                    <canvas id="ageChart"></canvas>
                                </div>
                                <hr>
<%--                                 讀者總人數：${genderCount[0]+genderCount[1]} 人 --%>
                            </div>
                        </div>
                        </div>

						<!-- 查詢關鍵字 -->
						<div style="margin-top: 20px; margin-bottom: 25px; clear: both;">
							<div class="form-group row">
                                <div class="col-sm-4 mb-3 mb-sm-0">
                                    <input type="text" name="keyword" id="keyword" placeholder="請輸入關鍵字:" class="form-control" style="float:left;">
                                </div>
                                <div class="col-sm-8">
                                    <button type='button' onclick="findByKeyword()"
										class="btn btn-primary">
										<i class="fas fa-search fa-sm"></i> 查詢
									</button>
									<button type="button" onclick="searchAll()"
										class="btn btn-primary">
										<i class="fas fa-search fa-sm"></i> 查詢全部
									</button>
									<button type="button" onclick="addReader()"
										class="btn btn-success">
										<i class="fa fa-plus" aria-hidden="true"></i> 新增書友
									</button>
									<button type="button" onclick="downloadAll()"
										class="btn btn-info">
										<i class="fa fa-download" aria-hidden="true"></i> 下載全部
									</button>
                                </div>
                                <div>
                                
                                </div>
                            </div>
						
<!-- 							<input type="text" name="keyword" id="keyword" placeholder="請輸入關鍵字:" class="form-control" style="float:left;"> -->
<!-- 							<button type='button' onclick="findByKeyword()" -->
<!-- 								class="btn btn-primary"> -->
<!-- 								<i class="fas fa-search fa-sm"></i> 查詢 -->
<!-- 							</button> -->
<!-- 							<button type="button" onclick="searchAll()" -->
<!-- 								class="btn btn-primary"> -->
<!-- 								<i class="fas fa-search fa-sm"></i> 查詢全部 -->
<!-- 							</button> -->
<!-- 							<button type="button" onclick="addReader()" -->
<!-- 								class="btn btn-success"> -->
<!-- 								<i class="fa fa-plus" aria-hidden="true"></i> 新增書友 -->
<!-- 							</button> -->
						</div>

						<!-- 			<form method="post" action="" class="keyword"> -->
						<!-- 				<tr> -->
						<!-- 					<td>請輸入關鍵字:</td> -->
						<!-- 					<td><input type="text" name="keyword" id="keyword"></td> -->
						<!-- 					<td><input type='button' value='查詢' onclick="findByKeyword()" class="btn btn-outline-secondary"></td> -->
						<!-- 					<td><button type='button' onclick="findByKeyword()" class="btn btn-outline-secondary"><i class="fas fa-search fa-sm"></i>查詢</button></td> -->
						<!-- 				</tr> -->
						<!-- 			</form> -->

						<!-- 			<input type='button' value='查詢' onclick="findByKeyword()"> -->
						<!-- 			<button type="button" onclick="createAccount()">提交</button> -->

						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold">書友資訊 | All Readers</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<!-- 				<table id="showreaders" border="1" class="table table-hover"></table> -->
									<table id="dataTable" class="table table-hover" width="100%"
										cellspacing="0"></table>
								</div>
							</div>
						</div>
						<div>
							<table id="showpage" class="table">
								<tr>
									<td>總共 ${totalPages} 頁 / 共 ${totalElements} 筆資料</td>
									<td colspan="4" align="right"><i
										class="fa fa-angle-double-left" aria-hidden="true"></i>&nbsp;
										<c:forEach var="i" begin="1" end="${totalPages}" step="1">
											<button id="myPage" value="${i}" onclick="change(${i})"
												class="btn btn-outline-primary">${i}</button>
										</c:forEach> &nbsp;<i class="fa fa-angle-double-right" aria-hidden="true"></i>
									</td>
								</tr>
							</table>
						</div>

						<!-- test -->
						<!-- <el-button type="info">Danger</el-button> -->
					</div>

					<!-- 互動彈出視窗(詳情) -->
					<div id="detail"></div>



				</div>
			</div>

			<!-- =============================== 互動彈出視窗測試 =============================== -->
			<!-- Trigger the modal with a button -->
			<!--   <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">詳情</button> -->

			<!-- Modal -->
			<!--   <div class="modal fade" id="myModal" role="dialog"> -->
			<!--     <div class="modal-dialog"> -->

			<!--       Modal content -->
			<!--       <div class="modal-content"> -->
			<!--         <div class="modal-header"> -->
			<!--           <button type="button" class="close" data-dismiss="modal">&times;</button> -->
			<!--           <h4 class="modal-title">Modal Header</h4> -->
			<!--         </div> -->
			<!--         <div class="modal-body"> -->
			<!--         	<table><p>測試</p></table> -->
			<!--         </div> -->
			<!--         <div class="modal-footer"> -->
			<!--           <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button> -->
			<!--         </div> -->
			<!--       </div>      -->
			<!--     </div> -->
			<!--   </div> -->

			<!-- ========================================================================== -->

			<!-- =============================上面是主要內容============================= -->
			<!-- =============================下面是套版============================= -->
			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; SWAPOOKS 2022</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
	</div>
	
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	<!-- =============================上面是套版============================= -->

	<!-- 03. import sweet alert -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="../js/vue.js"></script>

	<!-- import js -->
	<script src="https://unpkg.com/element-ui/lib/index.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous">
    </script>

	<!-- =================== 套版 import js start =================== -->
	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="../vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="../js/demo/datatables-demo.js"></script>
	<!-- =================== 套版 import js end =================== -->
	
	<!-- test chart start ========================================== -->
	<!-- Bootstrap core JavaScript-->
<!-- 	<script src="../vendor/jquery/jquery.min.js"></script> -->
<!--     <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
	
	<!-- Page level plugins -->
	<script src="../vendor/chart.js/Chart.js"></script>
<!-- 	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->

	<!-- Page level custom scripts -->
	<script src="../js/demo/chart-area-demo.js"></script>
	<script src="../js/demo/chart-pie-demo.js"></script>
	<script src="../js/demo/chart-bar-demo.js"></script>

	<!-- test chart end ========================================== -->

	<script type="text/javascript">
		new Vue({
	        el:"#main"
	    })
	
		// 查詢全部
		function searchAll(){
			location.href="http://localhost:8080/admin/allreaderpage";
		}

		// 新增書友
		function addReader(){
			location.href="http://localhost:8080/admin/createreaderpage";
		}
		
		// 刪除 ==========================================================
		function deleteReader(id){
			Swal.fire({
                title: '確定要刪除嗎?',
                icon: 'warning',
                showCancelButton: true, //是否需要 "取消" 的按鈕
                confirmButtonColor: '#3085d6', //"確認" 按鈕的顏色
                cancelButtonColor: '#d33', //"取消" 按鈕的顏色
                confirmButtonText: '確定',
                cancelButtonText: '取消',
            }).then((result) => {
                if (result.isConfirmed) {                   
                	$.ajax({
    					type:'delete',
    					url:'/admin/deletereader/' + id,
    					dataType:'json',
    					contentType:'application/json',
    					success:function(data){
    						if(data=='success'){
    							Swal.fire(
   			                        '刪除成功!', //大標
   			                        '已成功刪除書友!', //小標
   			                        'success', //圖案
    			                ).then(function(){
    								location.reload();
        			            });
    						}						
    					},
    					complete:function(){
        				}
    				});	                 
                }
            })
		}
	
		// 載入時查詢全部會員 ==========================================================
		var pageNo=1;		
		$(document).ready(function(){
			loadPage(pageNo);
		});

		function loadPage(pageNo){
			console.log("page=" + pageNo);
			$.ajax({
				type:'post',
				url:'/admin/findallreaderbypage/' + pageNo,
				dataType:'json',
				contentType:'application/json',
				success:function(data){
					$('#dataTable').empty("");

					genderChart(${genderCount[0]}, ${genderCount[1]});
					ageChart(${ageCount[0]}, ${ageCount[1]}, ${ageCount[2]}, ${ageCount[3]}, ${ageCount[4]});
					
					if(data == null){
						$('table').prepend("<tr><td colspan='5'>查無結果</td></tr>");
					}else{						
						var table = $('#dataTable');
						var detail = $('#detail');
						
						table.append(`<thead class="table-dark"><tr>
										  <th class='col-1'>圖片</th>
										  <th class='col-2'>書友編號</th>
										  <th class="col-2">姓名</th>
										  <th class="col-3">email</th>
										  <th class="col-2">角色權限</th>
										  <th class="col-2">操作</th></tr></thead>`);

						$.each(data, function(index, value){
							var authname, showDelete;
							if(value.authority == 1){
								authname = "(1) 管理員";
								showDelete="";
							}else if(value.authority == 2){
								authname = "(2) 一般書友";
								showDelete = `<button type="button" onclick="deleteReader(\${value.readerId})" id="del" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-btn btn-danger circle"><i class="fa" aria-hidden="true">&#xf2ed;</i></button>`;								
							}else{
								authname = "(3) 停權中";
								showDelete = `<button type="button" onclick="deleteReader(\${value.readerId})" id="del" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-btn btn-danger circle"><i class="fa" aria-hidden="true">&#xf2ed;</i></button>`;								
							}
							
							var mainInfo = `<tbody><tr>
										 <td><img src="/admin/showreaderphoto/\${value.readerId}" class="circle"></td>
									  	 <td>\${value.readerId}</td>
										 <td>\${value.fullName}</td>
										 <td>\${value.email}</td>
										 <!--<td>\${value.registerDate}</td>-->
										 <td>\${authname}</td>
									     <td>
										   <!-- <input type="button" onclick="show(\${value.readerId})" value="展開詳情" id="show\${value.readerId}" class="btn btn-primary" /> -->
										   <!-- <input type="button" data-toggle="modal" data-target="#myModal\${value.readerId}" value="展開詳情" class="btn btn-primary" /> -->
										   <!--<input type="button" onclick="deleteReader(\${value.readerId})" value="刪除" id="del" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-btn btn-danger" />-->
										   <!--<input type="button" onclick="location.href='http://localhost:8080/updatepasswordpage/\${value.readerId}'" value="變更密碼" id="changePassword" class="btn btn-warning" />-->
										   <button type="button" data-toggle="modal" data-target="#myModal\${value.readerId}" value="展開詳情" class="btn btn-secondary circle"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></button>&ensp;   
										   \${showDelete}
										   <!--
										   <c:if test="\${value.authority}==2">
										   			<button type="button" onclick="deleteReader(\${value.readerId})" id="del" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-btn btn-danger circle"><i class="fa" aria-hidden="true">&#xf2ed;</i></button>										   		
										   </c:if> 
										   -->
										   <!--<el-button type="info">Danger</el-button>-->
										 </td>
									   </tr>
									   <!--<tr>
										 <td colspan='5' id="detail\${value.readerId}" class="hideDetail">
											註冊日期:&emsp;\${value.registerDate}<br/>
											暱稱:&emsp;\${value.nickName}<br/> 
											性別:&emsp;\${value.gender}<br/>
											電話:&emsp;\${value.phone}<br/> 
											生日:&emsp;\${value.birth}<br/>
											書友等級:&emsp;\${value.readerLevel}<br/>
											持有書香幣:&emsp;\${value.readerCoin}<br/> 
											<input type="button" onclick="location.href='/gotoupdatepage/\${value.readerId}'" value="修改" class="btn btn-warning"/>
										 </td>
									   </tr>-->
									   </tbody>`;
							table.append(mainInfo);

							var detailInfo = `<div class="modal fade" id="myModal\${value.readerId}" role="dialog">
							    			  	<div class="modal-dialog">							    
							      					<div class="modal-content">
							        					<div class="modal-header" style="vertical-align:text-bottom;">
							          						<h4 class="modal-title">\${value.readerId}  \${value.fullName}</h4>
							          						<!--<button type="button" class="btn btn-warning" style="color:white" data-dismiss="modal" onclick="location.href='/gotoupdatepage/\${value.readerId}'"><i class="fa" style="color:white">&#xf044;</i> 變更大頭貼</button>-->
							          						<!--<button type="button" class="btn btn-outline-secondary" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i></button>-->
							        					</div>
							        					
							        				<div class="modal-body">
							        					<div align="center" style="margin-bottom:10px;">
							        						<img src="/admin/showreaderphoto/\${value.readerId}" height="100px">
							        					</div>
							        					<table class="table table-border table-striped">
							        						<tr>
							        							<td>註冊日期:</td>
							        							<td>\${value.registerDate}</td>
							        						</tr>
							        						<tr>
							        							<td>暱稱:</td>
							        							<td>\${value.nickName}</td>
							        						</tr>
							        						<tr>
							        							<td>性別:</td>
							        							<td>\${value.gender}</td>
							        						</tr>
							        						<tr>
							        							<td>電話:</td>
							        							<td>\${value.phone}</td>
							        						</tr>
							        						<tr>
							        							<td>生日:</td>
							        							<td>\${value.birth}</td>
							        						</tr>
							        						<tr>
							        							<td>書友等級:</td>
							        							<td>\${value.readerLevel}</td>
							        						</tr>
							        						<tr>
							        							<td>持有書香幣:</td>
							        							<td>\${value.readerCoin}</td>
							        						</tr>
														</table>
							        				</div>
							        				<div class="modal-footer">
							        				  <!-- <input type="button" onclick="location.href='/gotoupdatepage/\${value.readerId}'" value="修改" class="btn btn-warning"/> -->
							        				  <button type="button" class="btn btn-warning" style="color:white" data-dismiss="modal" onclick="location.href='/admin/gotoupdatepage/\${value.readerId}'"><i class="fa" style="color:white">&#xf044;</i> 修改資料</button>
							        				  <button type="button" class="btn btn-warning" style="color:white" data-dismiss="modal" onclick="location.href='http://localhost:8080/admin/updatepasswordpage/\${value.readerId}'" id="changePassword"><i class="fa" style="color:white">&#xf044;</i> 變更密碼</button>
													  <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i> 關閉</button>
											        </div>
											      </div>     
											    </div>
											  </div>`;
							detail.append(detailInfo);
						});
					}
				}
			});
		}

		function change(page){
			pageNo = page;
			loadPage(pageNo);
		}

		// 關鍵字查詢結果顯示 ==========================================================
		function findByKeyword(){
			console.log($('#keyword').val());
			$.ajax({
				type:'post',
				url:'/admin/findreaderbykeyword',
				dataType:'json',
				data:{keyword:$('#keyword').val()},
				
				success:function(data){
					$('#dataTable').empty("");					
					
					if(data == null){
						$('table').prepend("<tr><td colspan='5'>查無結果</td></tr>");
					}else{						
						var table = $('#dataTable');
						var detail = $('#detail');
						
						table.append(`<thead class="table-dark"><tr>
								  <th class='col-1'>圖片</th>
								  <th class='col-2'>書友編號</th>
								  <th class="col-2">姓名</th>
								  <th class="col-3">email</th>
								  <th class="col-2">角色權限</th>
								  <th class="col-2">操作</th></tr></thead>`);

						$.each(data, function(index, value){
							var authname, showDelete;
							if(value.authority == 1){
								authname = "(1) 管理員";
								showDelete="";
							}else if(value.authority == 2){
								authname = "(2) 一般書友";
								showDelete = `<button type="button" onclick="deleteReader(\${value.readerId})" id="del" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-btn btn-danger circle"><i class="fa" aria-hidden="true">&#xf2ed;</i></button>`;								
							}else{
								authname = "(3) 停權中";
								showDelete = `<button type="button" onclick="deleteReader(\${value.readerId})" id="del" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-btn btn-danger circle"><i class="fa" aria-hidden="true">&#xf2ed;</i></button>`;								
							}
							
							var mainInfo = `<tbody><tr>
								 <td><img src="/admin/showreaderphoto/\${value.readerId}" class="circle"></td>
							  	 <td>\${value.readerId}</td>
								 <td>\${value.fullName}</td>
								 <td>\${value.email}</td>
								 <td>\${authname}</td>
							     <td>
							     	<button type="button" data-toggle="modal" data-target="#myModal\${value.readerId}" value="展開詳情" class="btn btn-secondary circle"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></button>&ensp;   
								   \${showDelete}
								 </td>
							   </tr>
							   <!--<tr>
								 <td colspan='5' id="detail\${value.readerId}" class="hideDetail">
									註冊日期:&emsp;\${value.registerDate}<br/>
									暱稱:&emsp;\${value.nickName}<br/> 
									性別:&emsp;\${value.gender}<br/>
									電話:&emsp;\${value.phone}<br/> 
									生日:&emsp;\${value.birth}<br/>
									書友等級:&emsp;\${value.readerLevel}<br/>
									持有書香幣:&emsp;\${value.readerCoin}<br/> 
									<input type="button" onclick="location.href='/gotoupdatepage/\${value.readerId}'" value="修改" class="btn btn-warning"/>
								 </td>
							   </tr>-->
							   </tbody>`;
					table.append(mainInfo);

					var detailInfo = `<div class="modal fade" id="myModal\${value.readerId}" role="dialog">
					    			  	<div class="modal-dialog">							    
					      					<div class="modal-content">
					        					<div class="modal-header">
					          						<h4 class="modal-title">\${value.readerId}  \${value.fullName}</h4>
					        					</div>
					        				<div class="modal-body">
					        				<div align="center" style="margin-bottom:10px;"><img src="/admin/showreaderphoto/\${value.readerId}" height="100px"></div>
					        					<table class="table table-border table-striped">
					        						<tr>
					        							<td>註冊日期:</td>
					        							<td>\${value.registerDate}</td>
					        						</tr>
					        						<tr>
					        							<td>暱稱:</td>
					        							<td>\${value.nickName}</td>
					        						</tr>
					        						<tr>
					        							<td>性別:</td>
					        							<td>\${value.gender}</td>
					        						</tr>
					        						<tr>
					        							<td>電話:</td>
					        							<td>\${value.phone}</td>
					        						</tr>
					        						<tr>
					        							<td>生日:</td>
					        							<td>\${value.birth}</td>
					        						</tr>
					        						<tr>
					        							<td>書友等級:</td>
					        							<td>\${value.readerLevel}</td>
					        						</tr>
					        						<tr>
					        							<td>持有書香幣:</td>
					        							<td>\${value.readerCoin}</td>
					        						</tr>
												</table>
					        				</div>
					        				<div class="modal-footer">
					        				  <!-- <input type="button" onclick="location.href='/gotoupdatepage/\${value.readerId}'" value="修改" class="btn btn-warning"/> -->
					        				  <button type="button" class="btn btn-warning" data-dismiss="modal" onclick="location.href='/admin/gotoupdatepage/\${value.readerId}'"><i class="fa">&#xf044;</i> 修改資料</button>
					        				  <button type="button" class="btn btn-warning" data-dismiss="modal" onclick="location.href='http://localhost:8080/admin/updatepasswordpage/\${value.readerId}'" id="changePassword" class="btn btn-warning"><i class="fa">&#xf044;</i> 變更密碼</button>
											  <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i> 關閉</button>
									        </div>
									      </div>     
									    </div>
									  </div>`;
								detail.append(detailInfo);
						});
					}
				}
			});
		}

		// Pie Chart Example (性別圖表)
		function genderChart(male, female){
// 			var ctx = document.getElementById("myPieChart");
			var genderChart = new Chart($("#genderChart"), {
			  type: 'doughnut',
			  data: {
			    labels: ["男性讀者", "女性讀者"],
			    datasets: [{
			      data: [male, female],
			      backgroundColor: ['#EEC373', '#876445', '#36b9cc'],
			      hoverBackgroundColor: ['#e6af41', '#4D3124', '#2c9faf'],
			      hoverBorderColor: "rgba(234, 236, 244, 1)",
			    }],
			  },
			  options: {
			    maintainAspectRatio: false,
			    tooltips: {
			      backgroundColor: "rgb(255,255,255)",
			      bodyFontColor: "#858796",
			      borderColor: '#dddfeb',
			      borderWidth: 1,
			      xPadding: 15,
			      yPadding: 15,
			      displayColors: false,
			      caretPadding: 10,
			    },
			    legend: {
			      display: false
			    },
			    cutoutPercentage: 80,
			  },
			});
		}

		// Bar Chart Example (年齡圖表)
// 		var ctx = document.getElementById("myBarChart");
		function ageChart(a1, a2, a3, a4, a5){
			var ageChart = new Chart($("#ageChart"), {
			  type: 'bar',
			  data: {
			    labels: ["20歲(含)以下", "21~30歲", "31~40歲", "41~50歲", "51歲(含)以上"],
			    datasets: [{
			      label: "Age",
			      backgroundColor: "#876445",
			      hoverBackgroundColor: "#4D3124",
			      borderColor: "#4e73df",
			      data: [a1, a2, a3, a4, a5],
			    }],
			  },
			  options: {
			    maintainAspectRatio: false,
			    layout: {
			      padding: {
			        left: 10,
			        right: 25,
			        top: 25,
			        bottom: 0
			      }
			    },
			    scales: {
			      xAxes: [{
			        time: {
			          unit: 'year'
			        },
			        gridLines: {
			          display: false,
			          drawBorder: false
			        },
			        ticks: {
			          maxTicksLimit: 6
			        },
			        maxBarThickness: 25,
			      }],
			      yAxes: [{
			        ticks: {
			          min: 0,
			          max: 16,
			          minTicksLimit: 5,
			          maxTicksLimit: 10,
			          padding: 10,
			          // Include a dollar sign in the ticks
			          callback: function(value, index, values) {
			            return number_format(value);
			          }
			        },
			        gridLines: {
			          color: "rgb(234, 236, 244)",
			          zeroLineColor: "rgb(234, 236, 244)",
			          drawBorder: false,
			          borderDash: [2],
			          zeroLineBorderDash: [2]
			        }
			      }],
			    },
			    legend: {
			      display: false
			    },
			    tooltips: {
			      titleMarginBottom: 10,
			      titleFontColor: '#6e707e',
			      titleFontSize: 16,
			      backgroundColor: "rgb(255,255,255)",
			      bodyFontColor: "#858796",
			      borderColor: '#dddfeb',
			      borderWidth: 1,
			      xPadding: 15,
			      yPadding: 15,
			      displayColors: false,
			      caretPadding: 10,
			      callbacks: {
			        label: function(tooltipItem, chart) {
			          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
// 			          return datasetLabel + number_format(tooltipItem.yLabel) + "人";
			          return number_format(tooltipItem.yLabel) + "人";
			        }
			      }
			    },
			  }
			});
		}

		// 下載查詢結果
		function downloadAll(){
			$.ajax({
				type:'post',
				url:'/admin/retrievereaderfile',
				dataType:'json',
// 				contentType:'application/json',
// 				data:${totalElements},
				success:function(response){
					if(response == "success"){
						Swal.fire(
	                        '下載成功!',
	                        '請至C:/Swapooks資料夾確認',
	                        'success',
		                )
					}else{
						Swal.fire(
	                        '下載失敗!',
	                        '請重新確認',
	                        'error',
		                )
					}
				}
			});
		}
		
		

		//顯示詳情 ==========================================================
// 		function show(id){
// 			$("#detail"+id).toggleClass("showDetail");

// 			let cla = $("#detail"+id).attr("class");
// 			console.log(cla);
// 			if(cla == "hideDetail showDetail"){
// 				$("#show"+id).val("關閉詳情");
// 			}else{
// 				$("#show"+id).val("展開詳情");
// 			}
// 		}
	
	</script>

</body>
</html>