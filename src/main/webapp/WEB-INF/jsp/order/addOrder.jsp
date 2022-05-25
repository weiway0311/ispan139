<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- =================== 01. 套版 import CSS start =================== -->
<!-- Custom fonts for this template -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<!-- =================== 01. 套版 import CSS end =================== -->

<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" -->
<!-- 	crossorigin="anonymous"> -->


</head>
<!-- =================== 03. body加上id start =================== -->
<body id="page-top">
	<!-- =================== 03. body加上id end =================== -->

	<!-- =================== 04. 套版 Top & Side bar start =================== -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="http://localhost:8080/store/booksMain">
				<div class="sidebar-brand-icon rotate-n-15">
					<!--                     <i class="fas fa-laugh-wink"></i> -->
				</div> <!-- 				<div class="sidebar-brand-text mx-3">SWAPOOKS</div> -->
				<div class="sidebar-brand-text mx-3">
					<img src="/img/logoname-white.png" width="180px">
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item">
				<a class="nav-link" href="/mainpage">
					<i class="fas fa-fw fa-tachometer-alt"></i>
						<span>管理員首頁</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">功能管理</div>

			<!-- Nav Item - 書友管理 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseReader" aria-expanded="true" aria-controls="collapseReader">
					<i class="fas fa-fw fa-user-circle"></i> <span>書友管理</span>
			</a>
				<div id="collapseReader" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="http://localhost:8080/admin/allreaderpage">查詢全部書友</a>
						<a class="collapse-item" href="http://localhost:8080/admin/createreaderpage">新增書友</a>
					</div>
				</div></li>

			<!-- Nav Item - 書架管理 -->
			<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBooks" aria-expanded="true" aria-controls="collapseBooks"> 
				<i class="fas fa-fw fa-book-open"></i> 
					<span>書架管理</span>
			</a>
				<div id="collapseBooks" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="http://localhost:8080/admin/admin.books">查詢全部書籍</a> 
						<a class="collapse-item" href="http://localhost:8080/admin/admin.booksadd">書籍上架</a>
					</div>
				</div></li>

			<!-- Nav Item - 訂單管理 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOrders" aria-expanded="true" aria-controls="collapseOrders"> 
					<i class="fas fa-fw fa-money-check"></i> 
					<span>訂單管理</span>
				</a>
				<div id="collapseOrders" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="http://localhost:8080/order/gotosearchall">查詢全部訂單</a> 
						<a class="collapse-item" href="http://localhost:8080/order/gotoaddorders">新增訂單</a>
					</div>
				</div></li>

			<!-- Nav Item - 社群管理 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseClubs" aria-expanded="true" aria-controls="collapseClubs"> 
					<i class="fas fa-fw fa-comments"></i> 
						<span>社群管理</span>
				</a>
				<div id="collapseClubs" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="http://localhost:8080/club/clubmain.controller">查詢文章</a> 
						<a class="collapse-item" href="http://localhost:8080/club/creport.controller">檢舉明細</a>
					</div>
				</div></li>

			<!-- Nav Item - 活動管理 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseEvents" aria-expanded="true" aria-controls="collapseEvents"> 
					<i class="fas fa-fw fa-calendar-day"></i> 
						<span>活動管理</span>
				</a>
				<div id="collapseEvents" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="http://localhost:8080/searchallevent">查詢全部活動</a> 
						<a class="collapse-item" href="http://localhost:8080/gotoAddPage">建立活動</a>
					</div>
				</div></li>

			<!-- 下面的註解內容請先保留，不要刪除 -->
			>
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
						<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
							<i class="fa fa-bars"></i>
						</button>
					</form>

					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none">
						<a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							 <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
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
						<li class="nav-item dropdown no-arrow">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
								<span class="mr-2 d-none d-lg-inline text-gray-600 small">${userDetail.fullName}</span>
									<img class="img-profile rounded-circle" src="/showreaderphoto/${userDetail.readerId}">
							</a> <!-- Dropdown - User Information -->
							<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> 
									<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 管理員資訊
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="/logout">
								<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									登出
								</a>
							</div></li>
					</ul>
				</nav>
				<!-- End of Topbar -->

				<!-- 主要內容請包在這個div裡面 -->
				<div class="container-fluid">
					<!-- =================== 04. 套版 Top & Side bar end =================== -->

					<!-- try-start -->
					<div class="card o-hidden border-0 shadow-lg my-5" style="margin: 0px 250px;">
						<div class="card-body p-0">
							<!-- Nested Row within Card Body -->
							<div class="row">
								<div class="col-lg-12">
									<div class="p-5">
										<form class="user" method='post' action='/order/orderinsert' id="updateInfo">
											<h2>新增訂單</h2>
											<hr>
											<div class="form-group">
												<label>會員編號</label>
												<input type="text" class="form-control" name="custId" id="custId">
											</div>
											<div class="form-group row">
												<div class="col-sm-6 mb-3 mb-sm-0">
													<label>書籍編號</label>
													<input type="text" class="form-control" name="booksId" id="booksId"></td>
												</div>
												<div class="col-sm-6">
													<label>書名</label>
													<input type="text" class="form-control" name="booksName" id="booksName">
												</div>
											</div>
											<div class="form-group row">
												<div class="col-sm-6 mb-3 mb-sm-0">
													<label>單價</label>
													<input type="text" class="form-control" name="price" placeholder="單價" value="0" id="price">
												</div>
												<div class="col-sm-6">
													<label>數量</label>
													<input type="text" class="form-control" name="quantity" placeholder="數量" value="0" id="count">
												</div>
											</div>
											<div class="form-group">
												<label>小計</label>
												<input type="text" class="form-control" name="itemTotal" placeholder="小計" value="0" id="pertotal" readonly>
											</div>
											<div class="form-group">
												<label>總金額</label>
												<input type="text" class="form-control" name="total" placeholder="總金額" value="0" id="total" readonly>
											</div>
											<div align="center">
												<input class="btn btn-outline-primary" type="button" onclick="addOrder()" value="確認" >
												<input class="btn btn-outline-secondary" type="button" value="返回" id="return">
											</div>
										</form>
										<hr>
										<div align="right">
											<button type="button" onclick="oneClick()" class="btn">一鍵輸入</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- =================== 06. 套版 footer start =================== -->
				</div>
			</div>
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
	<a class="scroll-to-top rounded" href="#page-top"> 
		<i class="fas fa-angle-up"></i>
	</a>
	<!-- =================== 06. 套版 footer end =================== -->

	<!-- =================== 07. 套版 import js start =================== -->
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

	<!-- Page level custom scripts (Chart相關) -->
	<script src="../js/demo/datatables-demo.js"></script>
	<script src="../js/demo/chart-area-demo.js"></script>
	<script src="../js/demo/chart-pie-demo.js"></script>
	<script src="../js/demo/chart-bar-demo.js"></script>

	<!-- Page level plugins (Chart相關) -->
	<script src="../vendor/chart.js/Chart.min.js"></script>
	<!-- =================== 07. 套版 import js end =================== -->
	<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"
			integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
			crossorigin="anonymous"></script>
			
	<!-- import jquery -->
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   	<!-- import sweet alert -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
   	
   	<script>
			document.getElementById("return").onclick = function() {
				location.href = "/order/gotosearchall";
			}

			let price;
			let count;
			let total;

			$("#price,#count").blur(function() {
				price = $("#price").val();
				count = $("#count").val();
				total = price * count;
				$("#pertotal,#total").val(total);
			});

			//一鍵輸入
			function oneClick(){
				$('#custId').val('002');
				$('#booksId').val('223');
				$('#booksName').val('大亨小傳（出版90週年經典重譯紀念版');
				$('#price').val('130');
				$('#count').val('1');
			}

			//新增
			function addOrder(){
				var custId = $('#custId').val();
				var booksId = $('#booksId').val();
				var booksName = $('#booksName').val();
				var price = $('#price').val();
				var count = $('#count').val();
				var pertotal = $('#pertotal').val();
				var total = $('#total').val();
			
					Swal.fire({
						  title: '確定新增嗎？',
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: '是的',
						  cancelButtonText: '取消',
					}).then((result) => {					  
						$.ajax({
							type:'post',
							url:'/order/orderinsert',
							//contentType:'application/json',
							data:{"custId":custId,
												"booksId":booksId,
												"booksName":booksName,
												"price":price,
												"quantity":count,
												"itemTotal":pertotal,
												"total":total,
								},
							success:function(data){
								console.log("test!!");
								console.log(data);
								if(data == "success"){
								    Swal.fire(
								      '新增成功!',
								      '',
								      'success'
								    ).then(function(){
						            	window.location.href='http://localhost:8080/order/gotosearchall';   
								  })
								}
								}
							});														  
			});
			}

		</script>   	

</body>
</html>