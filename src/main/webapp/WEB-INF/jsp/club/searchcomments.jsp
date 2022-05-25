<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- =================== 01. 套版 import CSS start =================== -->
<!-- Custom fonts for this template -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<!-- =================== 01. 套版 import CSS end =================== -->

<title>以書會友 | 管理員專區</title>

<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"  -->
<!-- 	  rel="stylesheet"  -->
<!-- 	  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"  -->
<!-- 	  crossorigin="anonymous"> -->
<!-- <link rel="stylesheet" type="text/css" href="/css/searchcomments.css" /> -->

<style type="text/css">
		.tb1{
            /* width: 400px; */
            border: 2px solid gray;
            border-collapse: collapse;
        }
        .td1{
            /* border: 1px solid red; */
            background-color:#987456;
            text-align: center;
            /*height: 250px;*/
            width: 170px;
            vertical-align:top;
        }
        .td1comm{
            /* border: 1px solid red; */
            background-color:#f5deb3;
            text-align: center;
            /*height: 250px;*/
            width: 170px;
            vertical-align:top;
        }
        .td2{
            /* border: 1px solid red; */
            /* text-align:center; */
            float: left;
            /*height: 250px;*/
            width: 910px;
        }
        .div1{
            height: 45px;
            width: auto;
            /* background-color: aqua; */
            border-bottom: 1px solid;

        }
        .div1comm{
            height: 45px;
            width: auto;
            /* background-color: aqua; */
			/* border-bottom: 1px solid; */

        }
        .div2{
            word-break:break-all ;
            /* background-color: red; */
            
        }
        .div3{
        	border-top: 1px solid ;
            height: 45px;
            width: 900px;
            /* background-color: aqua; */
        }
        .tb2{
            /*width: 600px;*/
            height: 260px;
        }
        /* 測試 */
        .divright{
            float: right;
            line-height: 40px;
        }
        .divleft{
            float: left;
            /* line-height: 10px; */
            
        }
          p{
          	font-size:23px;
          	color:black;
          }
          /*span{
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

	
	
		<div class="card o-hidden border-0 shadow-lg my-5" style="margin: 0px 200px;">	
<!-- 		<div class="card o-hidden border-0 shadow-lg my-5">	 update by Sean 05.12 -->
		<div class="card-body p-0">
			<div class="row">
				<div class="col-lg-12">
					<div class="p-5">
					
	<input  type="button" value="返回討論區" id="back" onclick="back()" class="btn btn-primary">
	<input  type="button" value="新建回復" id="add" onclick="add(${userDetail.readerId})" class="btn btn-success">
	<hr>
	<!-- update by Sean 05.12 -->
	<table class="tb1">
            <tbody class="clubSize">
                <tr>
                    <td class="td1">
	                    <div >
	                    	<br>
	                    	<img src="/showreaderphoto/${reader.readerId}" width='150'/>
<%-- 	                    	<p  style="color:white;">暱稱:${reader.nickName}</p> --%>
	                    	<br>
	                    	<span style="color:white;">暱稱:${reader.nickName}</span>
	                    	<br>
	                    	<span style="color:white;">LV:${reader.readerLevel}</span>
	                    	
	                    </div>
                    </td>
                    <td class="td2">
                        <table class="tb2">
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="div1" id="articleHeader">
                                            <p>標題：${club.articleHeader}</p>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="div1comm" id="articleHeader">
                                            文章：
<%--                                             <c:if test="${reader.readerId != userDetail.readerId}"> --%>
<!--                                             <input type="button" name="report" style="float:right;" class="btn btn-danger" value="檢舉" onClick="show(0)" /> -->
                                           	 	
                                           	 	<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal0" style="float:right;">檢舉</button>
												                                          	 	
<%-- 											</c:if>	                                             --%>

												<!-- Modal -->
												  <div class="modal fade" id="myModal0" role="dialog">
												    <div class="modal-dialog">
									
												<!--       Modal content -->
												      <div class="modal-content">
												        <div class="modal-header" style="vertical-align:text-bottom;">
												          <h4 class="modal-title">檢舉內容</h4>
												          <button type="button" class="btn btn-default" data-dismiss="modal">X</button>
												        </div>
												        <div class="modal-body">
												        	<form action="/club/crepoAddController" method="post" class="divright">
												        		<input type="hidden" name="clubId" value="${club.clubId}" />
												        		<input type="hidden" name="commentId" value="0" />
												        		<input type="hidden" name="articleBody" value='${club.articleBody}' />
												        		<input type="hidden" name="reportWho" value='${reader.nickName}' />
												        		<textarea rows="4" cols="53" name="reportartcle" style="resize: none;"></textarea>
												        		<hr>
												        		<button type="submit" id="submit" class="btn btn-danger">檢舉</button>
												        	</form>
												        </div>
												      </div>     
												    </div>
												  </div>

<!--                                             <div id="block0" class="block"> -->
<!--                                             <input type="button" style="font-size:24px; right:0px; float:right;" value="X" onClick="javascript:window.location.reload()" /> -->
<!--                                             	<form action="/club/crepoAddController" method="post" class="divright"> -->
<%-- 	                                            	<input type="hidden" name="clubId" value="${club.clubId}" /> --%>
<!-- 	                                            	<input type="hidden" name="commentId" value="0" /> -->
<%-- 	                                            	<input type="hidden" name="articleBody" value='${club.articleBody}' /> --%>
<%-- 	                                            	<input type="hidden" name="reportWho" value='${reader.nickName}' /> --%>
<!-- 	                                            	<br> -->
<!-- 	                                            	<h3>檢舉內容</h3> -->
<!-- 	                                            	<hr> -->
<!-- 	                                            	<textarea rows="4" cols="63" name="reportartcle" style="resize: none;"></textarea> -->
<!-- 	                                            	<hr> -->
<!-- 	                                            	<button type="submit" id="submit" class="btn btn-danger" onClick="javascript:window.location.reload()">檢舉</button> -->
<!--                                             	</form > -->
<!--                                             </div> -->
                                            
                                            
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="div2" id="articleBody" style="padding:15px 20px;">
                                            ${club.articleBody}
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td  style="vertical-align:bottom;" valign="bottom">
                                        <div class="div3">
                                            <div class="divleft">
                                                <p id="clubDate">日期：${club.clubDate}</p>
                                            </div>
                                            <div class="divright">
<%--                                             <c:if test="${reader.readerId ==userDetail.readerId}"> --%>
                                            	<button type="button" class="btn btn-warning" data-dismiss="modal" onclick="location.href='/club/clubSearchById?id=${club.clubId}'"><i class="fa" style="color:white">&#xf044;</i>修改</button>
												<span> | </span>
												<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="deleteclub(${club.clubId})"><i class="fa" aria-hidden="true">&#xf2ed;</i>刪除</button>
<%-- 											</c:if> --%>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    
	
	<c:forEach items="${comms}" var="comms">
		<table class="tb1" >
            <tbody>
            	
                    <td class="td1comm">
	                    <div>
	                    	<br>
	                    	<img src="/showreaderphoto/${comms[1].readerId}" width='150'/>
	                    	<br>
	                    	<span style="color:black;">暱稱:${comms[1].nickName}</span>
	                    	<br>
	                    	<span style="color:black;">LV:${comms[1].readerLevel}</span>
	                    </div>
                    </td>
                    
                    <td class="td2">
                        <table class="tb2" style="vertical-align:bottom;" valign="bottom">
                            <tbody>
                            	
                			<tr>
                                <tr>
                                    <td>
                                        <div class="div1comm" id="articleHeader">
                                            文章：
<%--                                             <c:if test="${comms[1].readerId !=userDetail.readerId}"> --%>
                                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal${comms[0].commentId}" style="float:right;">檢舉</button>
<%-- 											</c:if>                                             --%>

												<!-- Modal -->
												  <div class="modal fade" id="myModal${comms[0].commentId}" role="dialog">
												    <div class="modal-dialog">
									
												<!--       Modal content -->
												      <div class="modal-content">
												        <div class="modal-header" style="vertical-align:text-bottom;">
												          <h4 class="modal-title">檢舉內容</h4>
												          <button type="button" class="btn btn-default" data-dismiss="modal">X</button>
												        </div>
												        <div class="modal-body">
												        	<form action="/club/crepoAddController" method="post" class="divright">
												        		<input type="hidden" name="clubId" value="${comms[0].clubId}" />
												        		<input type="hidden" name="commentId" value="${comms[0].commentId}" />
												        		<input type="hidden" name="articleBody" value='${comms[0].articleBody}' />
												        		<input type="hidden" name="reportWho" value='${comms[1].nickName}' />
												        		<textarea rows="4" cols="53" name="reportartcle" style="resize: none;"></textarea>
												        		<hr>
												        		<button type="submit" id="submit" class="btn btn-danger">檢舉</button>
												        	</form>
												        </div>
												      </div>     
												    </div>
												  </div>

                                            
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="div2" id="articleBody" style="padding:25px 20px">
                                            ${comms[0].articleBody}
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:bottom;" valign="bottom">
                                        <div class="div3">
                                            <div class="divleft">
                                                <span id="clubDate">日期：${comms[0].clubDate}</span>
                                            </div>
                                            <div class="divright">
<%--                                             <c:if test="${comms[1].readerId ==userDetail.readerId}"> --%>
                                            	<button type="button" class="btn btn-warning" data-dismiss="modal" onclick="location.href='/club/CommentInsertById?id=${comms[0].commentId}'"><i class="fa" style="color:white">&#xf044;</i>修改</button>
												<span> | </span>
<%-- 												<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="location.href='/club/CommDeleteById?id=${comms[0].commentId}'"><i class="fa" aria-hidden="true">&#xf2ed;</i>刪除</button> --%>
												<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="deletecomm(${comms[0].commentId})"><i class="fa" aria-hidden="true">&#xf2ed;</i>刪除</button>
<%--                                             </c:if> --%>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
	</c:forEach>
	
	
						</div>
				</div>
			</div>
		</div>
	</div>
	
	<hr>
	
	
	<br>
	<br>
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
		function add(readerId){
			if(readerId == null){
				location.href = "/readerlogin";
			}else{
				location.href = "/club/CommentAddById?clubId=${club.clubId}";
			}
			
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
										location.href="/club/clubmain.controller";
									});
								}
							},complete:function(){}
						});
					}
				})
		}

		function deletecomm(commid){
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
							url:'/club/CommDeleteById2/'+commid,
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
		
		
		function back(){		
			location.href = "/club/clubmain.controller";
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
	</script>
	
	
<!-- 
	<script>
		document.getElementById("add").onclick = function(){
			location.href = "/club/CommentAddById?clubId=${club.clubId}";
		}
		document.getElementById("back").onclick = function(){
			location.href = "/club/clubmain.controller";
		}
	</script>	
 -->
</body>
</html>