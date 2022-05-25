<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" import="com.booksplattform.model.order.Order" import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- =================== 02. 原本的 bootstrap cdn 請先註解掉 start =================== -->
<!--
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
-->
<!-- =================== 02. 原本的 bootstrap cdn 請先註解掉 end =================== -->
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
					<!-- <i class="fas fa-laugh-wink"></i> -->
				</div> <!-- <div class="sidebar-brand-text mx-3">SWAPOOKS</div> -->
				<div class="sidebar-brand-text mx-3">
					<img src="../img/logoname-white.png" width="180px">
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link" href="/mainpage">
			<i class="fas fa-fw fa-tachometer-alt"></i>
			<span>管理員首頁</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">功能管理</div>

			<!-- Nav Item - 書友管理 -->
			<li class="nav-item">
				<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseReader" aria-expanded="true" aria-controls="collapseReader">
					<i class="fas fa-fw fa-user-circle"></i>
						<span>書友管理</span>
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
				<div id="collapseOrders" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
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
						<a class="collapse-item" href="http://localhost:8080/club/clubmain.controller">查詢全部貼文</a>
						<a class="collapse-item" href="http://localhost:8080/club/addClub.controller">新增貼文</a>
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
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

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
									<img class="img-profile rounded-circle" src="/admin/showreaderphoto/${userDetail.readerId}">
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

					<!-- 二邊留白 -->
					<div class="container">

							<h1 style="text: center; font-size: 30px; margin-top: 20px">訂單管理</h1>
							<hr style="margin-top: 0px">

							<!-- 搜尋 -->
							<nav class="navbar navbar-light">
								<div class="container-fluid" style="padding-left: 0px">
									<button type="button" class="btn btn-outline-primary" id="add">新增</button>
									<form class="d-flex" action="/order/findorderbykeyword" method="post">
										<input class="form-control me-2" style="width: 70%" type="search" name="keyword" placeholder="請輸入訂單編號...">
										<button class="btn btn-outline-secondary" type="submit">查詢</button>
									</form>
								</div>
							</nav>

							<!-- 訂單狀態頁面選擇 -->
							<div id="orderPage">
								<ul class="nav nav-tabs">
									  <c:choose>									  
										<c:when test="${status == 'processing'}"> 
											<li class="nav-item"><a class="nav-link" href="/order/gotosearchall" aria-current="page">全部</a></li>
											<li class="nav-item"><a class="nav-link active" href="/order/findbyprocessing">處理中</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyconfirm">已確認</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyshipped">已出貨</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyfinish">已完成</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbycancel">已取消</a></li>
										</c:when>										
										<c:when test="${status == 'confirm'}">
											<li class="nav-item"><a class="nav-link" href="/order/gotosearchall">全部</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyprocessing">處理中</a></li>
											<li class="nav-item"><a class="nav-link active" href="/order/findbyconfirm">已確認</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyshipped">已出貨</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyfinish">已完成</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbycancel">已取消</a></li>
										</c:when>										
										<c:when test="${status == 'shipped'}">
											<li class="nav-item"><a class="nav-link" href="/order/gotosearchall">全部</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyprocessing">處理中</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyconfirm">已確認</a></li>
											<li class="nav-item"><a class="nav-link active" href="/order/findbyshipped">已出貨</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyfinish">已完成</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbycancel">已取消</a></li>
										</c:when>										
										<c:when test="${status == 'finish'}">
											<li class="nav-item"><a class="nav-link" href="/order/gotosearchall">全部</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyprocessing">處理中</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyconfirm">已確認</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyshipped">已出貨</a></li>
											<li class="nav-item"><a class="nav-link active" href="/order/findbyfinish">已完成</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbycancel">已取消</a></li>
										</c:when>									
										<c:when test="${status == 'cancel'}">
											<li class="nav-item"><a class="nav-link" href="/order/gotosearchall">全部</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyprocessing">處理中</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyconfirm">已確認</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyshipped">已出貨</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyfinish">已完成</a></li>
											<li class="nav-item"><a class="nav-link active" href="/order/findbycancel">已取消</a></li>
										</c:when>
										<c:otherwise>
											<li class="nav-item"><a class="nav-link active" aria-current="page" href="/order/gotosearchall">全部</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyprocessing">處理中</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyconfirm">已確認</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyshipped">已出貨</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbyfinish">已完成</a></li>
											<li class="nav-item"><a class="nav-link" href="/order/findbycancel">已取消</a></li>
										 </c:otherwise>
									</c:choose>
								</ul>
							</div>
							<!-- 訂單table -->
							<div class="mb-3">
								<table cellspacing="0" class="table table-striped" id="orderTable"></table>
							</div>
							<!-- 分頁 -->
							<div>
								<table id="showpage" class="table">
									<tr>
										<td>總共 ${totalPages} 頁 / 共 ${totalElements} 筆資料</td>
										<td colspan="5" align="right">
										<i class="fa fa-angle-double-left" aria-hidden="true"></i>&nbsp;
											<c:forEach var="i" begin="1" end="${totalPages}" step="1">
												<button id="myPage" value="${i}" onclick="change(${i})" class="btn btn-outline-primary">${i}</button>
											</c:forEach>&nbsp;
										<i class="fa fa-angle-double-right" aria-hidden="true"></i>
										</td>
									</tr>
								</table>
							</div>
							<br>
						<!-- 訂單圖表 -->
						<h1 style="text: center; font-size: 30px; margin-top: 20px">訂單報表圖</h1>
						<hr style="margin-top: 0px">

						<div style="margin-bottom: 40px;">
							<!-- Donut Chart (狀態) -->
							<div class="col-xl-4 col-lg-5" style="float: left">
								<div class="card shadow mb-4">
									<!-- Card Header - Dropdown -->
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-secondary">訂單狀態分布</h6>
									</div>
									<!-- Card Body -->
									<div class="card-body" align="center">
										<div class="chart-pie pt-4">
											<canvas id="genderChart"></canvas>
										</div>
										<hr>
										「處理中」的訂單：${sCount[0]} 筆 &nbsp;<br>
										「已確定」的訂單：${sCount[1]} 筆 &nbsp;<br>
										「已出貨」的訂單：${sCount[2]} 筆 &nbsp;<br>
										「已完成」的訂單：${sCount[3]} 筆 &nbsp;<br>
										「已取消」的訂單：${sCount[4]} 筆 &nbsp;<br>
										 目前訂單總數共：${sCount[0]+sCount[1]+sCount[2]+sCount[3]+sCount[4]} 筆
									</div>
								</div>
							</div>
							<!-- Bar Chart (每月訂單量) -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-secondary">每月訂單量報表</h6>
								</div>
								<div class="card-body">
									<div class="chart-bar">
										<canvas id="ageChart"></canvas>
									</div>
									<hr>
								</div>
							</div>
							<!-- 圖表END -->
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

	<!-- import sweet alert -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	<!-- import jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script type="text/javascript">
	
		//訂單新增
	    document.getElementById("add").onclick = function(){
			location.href = "/order/gotoaddorders";
		}

		 /* //狀態頁面
		function submitStatus(){
			$.ajax({
				type:'get',
			    url:'/order/findbystatus' + id,
			    contentType: 'application/json',
			    success:function(data){
					if(data == "processing"){
						
						$('#orderPage').empty();
						
						var processingPage = `<ul class="nav nav-tabs">
												<li class="nav-item"><a class="nav-link" >全部</a></li>
												<li class="nav-item"><a class="nav-link active">處理中</a></li>
												<li class="nav-item"><a class="nav-link">已確認</a></li>
												<li class="nav-item"><a class="nav-link">已出貨</a></li>
												<li class="nav-item"><a class="nav-link">已完成</a></li>
												<li class="nav-item"><a class="nav-link">已取消</a></li>
											 </ul>
											`
												
						$('#orderPage').append(processingPage);
						
					 location.reload(); 
					}
				}				
			});
			
		}  */

		//分頁---------------------------------
		var pageNo=1;
		
		$(document).ready(function(){
			loadPage(pageNo);
		});

		function loadPage(pageNo){
			$.ajax({
				type:'post',
				url:'/order/findallorderbypage/' + pageNo,
				dataType:'json',
				contentType:'application/json',
				success:function(data){
					$('#orderTable').empty("");
					
					if(data == null){
						$('table').prepend("<tr><td colspan='5'>查無結果</td></tr>");
					}else{						
						var table = $('#orderTable');
						
						table.append(`<thead>
										<tr>
											<th>訂單編號</th>
											<th>訂單時間</th>
											<th>會員編號</th>
											<th>總金額</th>
											<th>訂單狀態</th>
											<th>操作</th>
										</tr>
									</thead>`);

						$.each(data, function(i, n){							
							var tr = `<tbody><tr>
										<td>${n.oId}</td>
										<td>${n.oDate}</td>
										<td>${n.custId}</td>
										<td>${n.total}</td>
										<td id="status${n.oId}">${n.status}</td>
										<td><c:if test="${n.status!='已取消'}">
											<span id="updateButton${n.oId}">
												<button class="btn btn-outline-warning" onclick="submitUpdate(${n.oId},'${n.status}')">修改</button>
											</span>
											</c:if>
											<a class="btn btn-outline-success" href="gotodetails.controller?id=${n.oId}">詳情</a>
										</td>
									 </tr></tbody>`;
							table.append(tr);		
						});
					}
				}
			});
		}

		function change(page){
			pageNo = page;
			loadPage(pageNo);
		}
		//分頁END---------------------------------
	
		//訂單狀態修改---------------------------------
		function submitUpdate(id,status){
			$('#status'+id).empty();
			$('#updateButton'+id).empty();

			var updateStatus = `<select class="form-control" name="authority" id="authority\${id}">
								<option>\${status}</option>
								<option>處理中</option>
								<option>已確認</option>
								<option>已出貨</option>
								<option>已完成</option>
								<option>已取消</option>
								</select>`;
				
			$('#status'+id).append(updateStatus);
			
			
			var saveButton =`<button class="btn btn-outline-warning" onclick="saveOStatus(\${id},'\${status}')">儲存</button>`;
				$('#updateButton'+id).append(saveButton);
		}
	
			/* 
			//解決option重複
			var theStatus = "${order.status}";

			if(theStatus != " "){
				$(`#authority option[value=\${theStatus}]`).remove;//刪除select中的value為選項的option
				$("#authority").append(`<option selected='selected' value=\${theStatus}>\${theStatus}</option>`);//為select追加一個option下拉項
			}	 
			*/						

		function saveOStatus(id,status){
			//取得選項的值					
			var checkStatus = $('#authority'+id).find("option:selected").val();
			/* console.log("選擇的狀態："+checkStatus); */

				$.ajax({
					type:'put',
					url:'/order/updateorder.controller/'+id,
					dataType:'json',
					contentType:'application/json',
					data:JSON.stringify({"status":checkStatus}),			
				});
				
				Swal.fire({
					  title: '是否確定變更狀態？',
					  showDenyButton: true,//是否需要  "取消"的按鈕
					  confirmButtonText: '確定',
					  denyButtonText: '取消',
					}).then((result) => {
					  if (result.isConfirmed) {
						  Swal.fire(
			                   '更新成功!', //大標
			                   '訂單狀態已更新', //小標
			                   'success', //圖案
					            ).then(function(){
					            	window.location.href='http://localhost:8080/order/gotosearchall';
						        });
					  } else if (result.isDenied) {
					    Swal.fire(
							    '已取消變更',
							    '',
							    'error',
							    ).then(function(){
			            	window.location.href='http://localhost:8080/order/gotosearchall';
				        });
					  }
					});	
		}
		//訂單狀態修改END---------------------------------
			
		//圖表---------------------------------
		$(document).ready(function(){
    		genderChart(${sCount[0]}, ${sCount[1]}, ${sCount[2]}, ${sCount[3]}, ${sCount[4]});
		});
		// Pie Chart Example (狀態圖表)
		function genderChart(s0, s1, s2, s3, s4){
			var genderChart = new Chart($("#genderChart"), {
			  type: 'doughnut',
			  data: {
			    labels: ["處理中", "已確定", "已出貨", "已完成", "已取消"],
			    datasets: [{
			      data: [s0, s1, s2, s3, s4],
			      backgroundColor: ['#EEC373', '#876445', '#36b9cc', 'black', 'red'],
			      hoverBackgroundColor: ['#e6af41', '#4D3124', '#2c9faf', 'black', 'red'],
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
		 
		// Bar Chart Example (每月訂單量圖表)
		/* function ageChart(a1, a2, a3, a4, a5){ */
			var ageChart = new Chart($("#ageChart"), {
			  type: 'bar',
			  data: {
			    labels: ["1月 JAN", "2月 FEB", "3月 MAR", "4月 APR", "5月 MAY"],
			    datasets: [{
			      label: "Age",
			      backgroundColor: "#876445",
			      hoverBackgroundColor: "#4D3124",
			      borderColor: "#4e73df",
			      data: [6, 6, 8, 7, 9],
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
			          max: 10,
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
		/* } */
		//圖表END---------------------------------

    </script>
</body>

</html>