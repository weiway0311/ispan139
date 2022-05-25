<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>以書會友 | 管理員專區</title>

<!-- =================== 01. 套版 import CSS start =================== -->
<!-- Custom fonts for this template -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<!-- =================== 01. 套版 import CSS end =================== -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	  rel="stylesheet" 
	  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
 	  crossorigin="anonymous">
 	  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
	.block 
          {
          	  display: none;
              height: 400px;
              width: 600px;
              background-color:#FFF;
              border:1px solid;
           
              position: absolute;     /*絕對位置*/
              top: 50%;               /*從上面開始算，下推 50% (一半) 的位置*/
              left: 50%;              /*從左邊開始算，右推 50% (一半) 的位置*/
              margin-top: -100px;     /*高度的一半*/
              margin-left: -200px;    /*寬度的一半*/
           	  overflow:auto;
           	  padding:15px 20px;
          }
	.blockshow 
          {
          	  display: block;
              height: 400px;
              width: 600px;
              background-color:#FFF;
              border:1px solid;
           
              position: absolute;     /*絕對位置*/
              top: 50%;               /*從上面開始算，下推 50% (一半) 的位置*/
              left: 50%;              /*從左邊開始算，右推 50% (一半) 的位置*/
              margin-top: -100px;     /*高度的一半*/
              margin-left: -200px;    /*寬度的一半*/
           	  overflow:auto;
           	  padding:15px 20px;
          }
    /*a{
    	font-size:23px; 
    }
    p{
    	color:black;
 		font-size:23px; 
    }*/
    
    /*update by Sean(05.12)*/
	.clubSize{
		color:black;
 		font-size:23px;
	}
</style>

<script type="text/javascript">
$(document).ready(function(){
	loadPage();
});

function loadPage(){
	$.ajax({
		type:'post',
		url:'/club/searchcreports.controller',
		dataType:'json',
		contentType: 'application/json',
		success: function(data){
			$("#showproduct").empty("");
			if(data==null){
				$("table").prepend("<tr><td colspan='2'>暫無資料</td></tr>");
			}else{
				var table = $("#showproduct");
	            table.append("<thead class='table-dark'><tr><th>檢舉編號</th><th>文章編號</th><th>回復編號</th><th>檢舉日期</th><th>被檢舉人</th><th>檢舉內容</th><th>操作</th></tr></thead>");

				$.each(data, function(i,n){
					var tr = `
						<tbody class="clubSize"><tr>
						<td>\${n.reportId}</td>
						<td>\${n.clubId}</td>
						<td>\${n.commentId}</td>
						<td>\${n.reportDate}</td>
						<td>\${n.reportWho}</td>
						<td>\${n.reportartcle}</td>
						<td>
							<button type="button" data-toggle="modal" data-target="#myModal\${n.reportId}" value="展開詳情" class="btn btn-secondary circle">展開詳情</button>
							  <div class="modal fade" id="myModal\${n.reportId}" role="dialog">
							    <div class="modal-dialog">
				
							      <div class="modal-content">
							        <div class="modal-header" style="vertical-align:text-bottom;">
							          <h4 class="modal-title">被檢舉文章</h4>
							          <button type="button" class="btn btn-default" data-dismiss="modal">X</button>
							        </div>
							        <div class="modal-body">
							        \${n.articleBody}
							        </div>
							      </div>     
							    </div>
							  </div>
							<button class='btn btn-success' onclick="deletereport(\${n.reportId})">移除檢舉</button>
							<button class='btn btn-danger' onclick="deleteclub(\${n.clubId},\${n.commentId},\${n.reportId})">移除文章</button>
						</td>	
						</tr></tbody>`;
					table.append(tr);		
				});
			}
		}
	});
}

function show(id){
	$("#block"+id).toggleClass("blockshow");

	let cla = $("#detail"+id).attr("class");
	console.log(cla);
	if(cla == "block blockshow"){
		$("#block"+id);
	}else{
		$("#block"+id);
	}
}

function deletereport(rid){
	location.href = "/club/creportDeleteById?id="+rid;
}

function deleteclub(clubid,commid,rid){
	location.href = "/club/creportclubDeleteById?clubid="+clubid+"&commid="+commid+"&rid="+rid;
}

</script>
</head>
<!-- =================== 03. body加上id start =================== -->
<body id="page-top">
<!-- =================== 03. body加上id end =================== -->

<!-- =================== 04. 套版 Top & Side bar start =================== -->
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
				<div class="sidebar-brand-text mx-3"><img src="/img/logoname-white.png" width="180px"></div>
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
			
			<!-- 下面的註解內容請先保留，不要刪除 -->
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
								src="/showreaderphoto/${userDetail.readerId}">
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

				<!-- 主要內容請包在這個div裡面 -->
				<div class="container-fluid">  
	<!-- =================== 04. 套版 Top & Side bar end =================== -->
	
<h3>creport</h3>

<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold">討論區 | All Clubs</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table id="showproduct" class="table table-hover" width="100%" cellspacing="0"></table>
		</div>
	</div>
</div>

<!-- </div> -->

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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
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



</body>
</html>