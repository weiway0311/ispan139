<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>以書會友 | 管理員專區</title>
<style type="text/css">
	/*p{
		color:black;
 		font-size:23px; 
	}
	a{
 		font-size:23px; 
	}*/
	
	/*update by Sean(05.12)*/
	.clubSize{
		color:black;
 		font-size:23px;
	}
</style>

<!-- =================== 01. 套版 import CSS start =================== -->
<!-- Custom fonts for this template -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<!-- =================== 01. 套版 import CSS end =================== -->

<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"  -->
<!-- 	  rel="stylesheet"  -->
<!-- 	  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"  -->
<!-- 	  crossorigin="anonymous"> -->


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
			
			<!-- 下面的註解內容請先保留，不要刪除 -->>
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

<!-- <h3>clubs</h3> -->
<%-- <p>${userDetail.readerId}</p> --%>
<%-- <p>${userDetail.fullName}</p> --%>
<!-- <br> -->

	<h1 style="text: center; font-size: 30px; margin-top: 20px">社群管理</h1>
	<hr style="margin-top: 0px">


	<div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-secondary">討論區資料</h6>
        </div>
        <div class="card-body">
            <div class="chart-bar">
                <canvas id="ageChart"></canvas>
            </div>
            <hr>
        </div>
    </div>
<br>
	
		<table>
			<tr>
				<td><input type="text" name="keyword" id="keyword" placeholder="請輸入關鍵字:" class="form-control" style="float:left;"></td>
				<td><button type='button' onclick="clubSearchByKeyword()" class="btn btn-primary"><i class="fas fa-search fa-sm"></i> 查詢</button></td>
				<td><button type="button" id="add" onclick="add(${userDetail.readerId})" class="btn btn-success"><i class="fa fa-plus" aria-hidden="true"></i>新增討論</button></td>
			</tr>	
		</table>		
	

<hr>

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



<table id="showPage" class="table table-hover">
   <tr>
      <td>總共${clubPages}頁 / 共  ${clubElements} 筆資料</td>
      <td colspan="3" align="right">
      	<i class="fa fa-angle-double-left" aria-hidden="true"></i>&nbsp;
          <c:forEach var="i" begin="1" end="${clubPages}" step="1">
               <button id="myPage" onclick="change(${i})" value="${i}" class="btn btn-outline-primary">${i}</button>
          </c:forEach>
        &nbsp;<i class="fa fa-angle-double-right" aria-hidden="true"></i>
      </td>      
   </tr>   
</table>


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
	
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
	var indexPage = 1;
   
	$(document).ready(function(){
		loadPage(indexPage);
// 		clubSearchByKeyword()
	});


	function loadPage(indexPage){
	    $.ajax({
	       type:'post',
	       url:'/club/clubPage/' + indexPage,
	       dataType:'json',
	       contentType: 'application/json',
	       success: function(data){
	          $("#showproduct").empty("");
	          
	          ageChart(${clubclassCount[0]}, ${clubclassCount[1]}, ${clubclassCount[2]}, ${clubclassCount[3]});
	          
	          if(data==null){
	             $("table").prepend("<tr><td colspan='2'>No Result</td></tr>");
	          }else{
	             var table = $("#showproduct");
	             table.append("<thead class='table-dark'><tr><th>文章編號</th><th>主題</th><th>預覽圖片</th><th>標題名稱</th><th>文章篇數</th><th>創建時間</th><th>操作</th></tr></thead>");
				 
	             $.each(data, function(i,n){
		             // update by Sean 05.12
	                  var tr = "<tbody class='clubSize'><tr>" 
						+ "<td><p>" + n[0].clubId + "</p></td>" 
						+ "<td><p>" + n[0].clubclass + "</p></td>" 
						+ "<td>" + "<img src=" + n[0].clubImg + " height='50'>" + "</td>" 
						+ "<td><a href='/club/CommentSearchById?id="+ n[0].clubId +"'>" + n[0].articleHeader + "</a></td>" 
						+ "<td><p>" + n[1] + "則</p></td>" 
						+ "<td><p>" + n[0].clubDate + "</p></td>" 
						+ "<td>"  
							+ `<button type="button" class="btn btn-warning" style="color:white" data-dismiss="modal" onclick="location.href='/club/clubSearchById?id=\${n[0].clubId}'"><i class="fa" style="color:white">&#xf044;</i>修改</button>`
							+ "<span> | </span>"
// 							+ `<button type="button" class="btn btn-danger" style="color:white" data-dismiss="modal" onclick="location.href='/club/clubDeleteById?id=\${n[0].clubId}'"><i class="fa" aria-hidden="true">&#xf2ed;</i>刪除</button>`
							+ `<button type="button" class="btn btn-danger" style="color:white" data-dismiss="modal" onclick="deleteclub(\${n[0].clubId})"><i class="fa" aria-hidden="true">&#xf2ed;</i>刪除</button>`
						+ "</td>" 
						+ "</tr></tbody>"; 
						table.append(tr);
	             });
	          }
	       }
	    });
	}
	var a = $('#keyword').val()
	function clubSearchByKeyword(){
	    $.ajax({
		       type:'post',
		       url:'/club/clubSearchByKeyword',
		       dataType:'json',
		       data:{keyword:$('#keyword').val()},
		       success: function(data){
		          $("#showproduct").empty("");
		          $("#showPage").empty("");
		          if(data==null){
		             $("table").prepend("<tr><td colspan='2'>暫無資料</td></tr>");
		          }else{
		             var table = $("#showproduct");
		             table.append("<thead class='table-dark'><tr><th>文章編號</th><th>主題</th><th>預覽圖片</th><th>標題名稱</th><th>文章篇數</th><th>創建時間</th><th>操作</th></tr></thead>");
		
		             $.each(data, function(i,n){
		                  var tr = "<tbody><tr>" 
		                   + "<td><p>" + n[0].clubId + "</p></td>" 
		                   + "<td><p>" + n[0].clubclass + "</p></td>" 
							+ "<td>" + "<img src=" + n[0].clubImg + " height='50'>" + "</td>" 
		                   + "<td><a href='/club/CommentSearchById?id="+ n[0].clubId +"'>" + n[0].articleHeader + "</a></td>" 
	                       + "<td><p>" + n[1] + "則</p></td>" 
	                       + "<td><p>" + n[0].clubDate + "</p></td>" 
	                       + "<td>" 
	                       	  + `<button type="button" class="btn btn-warning" data-dismiss="modal" onclick="location.href='/club/clubSearchById?id=\${n[0].clubId}'"><i class="fa" style="color:white">&#xf044;</i>修改</button>`
	                          + "<span> | </span>"
	                          + `<button type="button" class="btn btn-danger" style="color:white" data-dismiss="modal" onclick="deleteclub(\${n[0].clubId})"><i class="fa" aria-hidden="true">&#xf2ed;</i>刪除</button>`
				 		   + "</td>" 
	                       + "</tr></tbody>"; 
		                  table.append(tr);
		             });
		          }
		       }
		    });
	}

	function deleteclub(clubid){
		console.log('123');
		Swal.fire({
			title: '確定要刪除嗎?',
            icon: 'warning',
            showCancelButton: true, //是否需要 "取消" 的按鈕
            confirmButtonColor: '#3085d6', //"確認" 按鈕的顏色
            cancelButtonColor: '#d33', //"取消" 按鈕的顏色
            confirmButtonText: '確定',
            cancelButtonText: '取消',
		}).then((result) => {
				if(result.isConfirmed){
					$.ajax({
						type:'delete',
						url:'/club/clubDeleteById2/'+clubid,
						datatype:'json',
						contentType:'application/json',
						success:function(data){
							if(data!=null){
								Swal.fire(
									'刪除成功!', //大標
   			                        '已成功刪除文章!', //小標
   			                        'success', //圖案
								).then(function(){
									location.reload();
								});
							}
						},complete:function(){}
					});
				}
			})
	}

	function add(readerId){
		if(readerId == null){
			location.href = "/readerlogin";
		}else{
			location.href = "/club/addClub.controller";
		}
	   
	}
	function change(page){
	   indexPage = page;
	   loadPage(indexPage);
	}

	function ageChart(a1, a2, a3, a4){
		var ageChart = new Chart($("#ageChart"), {
		  type: 'bar',
		  data: {
		    labels: ["所有討論", "討論區", "心得區", "分享區"],
		    datasets: [{
		      label: "Age",
		      backgroundColor: "#876445",
		      hoverBackgroundColor: "#4D3124",
		      borderColor: "#4e73df",
		      data: [a1, a2, a3, a4],
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
		          max: 50,
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
		          return number_format(tooltipItem.yLabel) + "筆";
		        }
		      }
		    },
		  }
		});
	}

   
</script>
	
	<!-- 
	<script>
		document.getElementById("add").onclick = function(){
			location.href = "/club/addClub.controller";
		}
	</script>
	 -->
</body>
</html>