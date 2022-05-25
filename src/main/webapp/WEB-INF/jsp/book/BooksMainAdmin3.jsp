<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF8">

<!-- import favicon -->
<link rel="shortcut icon" 
   href="${pageContext.request.contextPath}/img/favicon.ico"
   type="image/x-icon" >

<!-- 套版不要動 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
	
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="../css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

    <!-- =================== 01. 套版 import CSS start =================== -->
    <!-- Custom fonts for this template -->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <!-- =================== 01. 套版 import CSS end =================== -->
<!-- 
<script src="../js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="../assets/demo/chart-area-demo.js"></script>
<script src="../assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="../js/datatables-simple-demo.js"></script>
 -->
<!-- ======= -->

<title>書籍管理</title>

<!-- sweet alert -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- import bootstrap -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->


<style>
.el-table .warning-row {
	background: oldlace;
}

.el-table .success-row {
	background: #f0f9eb;
}

/* nvbar css */
.bg-yellow{
    	background-color: #844200;
}
.keyword{
	margin: 30px 0px;
}

</style>
<!-- import CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

</head>
<!-- =================== 03. body加上id start =================== -->
<body id="page-top">
<!-- =================== 03. body加上id end =================== -->

<%
Integer totalAmount = 0;
String role = "";
if( session.getAttribute("login") != null){
	role= (String) session.getAttribute("login");
	System.out.println("==================================="+role);
	if(role.equals("admin")){
		role="管理";
	}
}
if(!role.isEmpty()){
	role = role.substring(role.length()-2, role.length());
}else{
	role = "Hello!";
}
%>


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

	<!-- =================== 05. 主要內容 start =================== -->
				<div id="main">
<!--     <div class='container'> -->
    
    					<h1 style="text: center; font-size: 30px; margin-top: 20px">書架管理</h1>
							<hr style="margin-top: 0px">
    
    				<!-- 圖表開始 -->
				<div style="margin-bottom:40px;">
						<!-- Donut Chart (性別) -->
						<div class="col-xl-4 col-lg-5" style="float:left">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-secondary">書籍分類概況</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body" align="center">
									<div class="chart-pie pt-4">
										<canvas id="genderChart"></canvas>
									</div>
									<hr>
									商業理財：${bookVarieties[0]} 本 &nbsp;/ &nbsp;語言學習：${bookVarieties[1]} 本<br>
									電腦程式：${bookVarieties[2]} 本 &nbsp;/ &nbsp;藝術設計：${bookVarieties[3]} 本<br>
									現代小說：${bookVarieties[4]} 本 &nbsp;/ &nbsp;中文古典：${bookVarieties[5]} 本<br>
									外文小說：${bookVarieties[6]} 本 &nbsp;/ &nbsp;親子教育：${bookVarieties[7]} 本<br>
									生活風格：${bookVarieties[8]} 本 &nbsp;/ &nbsp;美食旅遊：${bookVarieties[9]} 本<br>
									<br>
									種類加總：${bookVarieties[0]+bookVarieties[1]+bookVarieties[2]+bookVarieties[3]+bookVarieties[4]+bookVarieties[5]+bookVarieties[6]+bookVarieties[7]+bookVarieties[8]+bookVarieties[9]} 本
								</div>
							</div>
						</div>
						
						<!-- Bar Chart (年齡) -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-secondary">出版年度概況</h6>
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
<!-- 圖表結束 -->
    
        <!-- 快速查詢模糊比對 -->
    <el-form :inline="true" :model="formInline" class="demo-form-inline">
      <el-form-item label="輸入書名(關鍵字)">
        <el-input v-model="formInline.bookKeyWord" placeholder="輸入書名(關鍵字)"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" @click="onSubmit">查詢</el-button>
        <el-button type="primary" icon="el-icon-refresh" @click="reset"></el-button>
        <el-button type="primary" icon="el-icon-download" @click="downloadAll()">下載</el-button>
      </el-form-item>
    </el-form>
        <!-- 將數據陳列出來 -->
    <span id="showZone"></span>
    <div v-for="searchResult in searchResults">
        {{searchResult}}
    </div>
   <!--  <hr> -->
        <!-- add and delete(batch) button -->
 <!--   <el-row>  -->
     <!--  <el-button type="primary" plain icon="el-icon-upload2" @click="dialogVisible = true">書籍上架</el-button>  -->
   <!--     <el-button type="primary" plain icon="el-icon-upload2" @click="goToAdd">書籍上架</el-button>  -->
 <!--   </el-row> -->
    
    <!-- add's dialog -->
    <el-dialog title="書籍上架"  :visible.sync="dialogVisible" width="30%" >
     
    <!-- 新增書籍內容表單 --> 
    <!-- <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="120px" class="demo-ruleForm"> -->
    <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="120px">
      <el-form-item label="書名" prop="booksName">
        <el-input v-model="ruleForm.booksName"></el-input>
      </el-form-item>
        <el-form-item label="作者" prop="authorName">
        <el-input v-model="ruleForm.authorName"></el-input>
      </el-form-item>
        <el-form-item label="出版社" prop="publisherName">
        <el-input v-model="ruleForm.publisherName"></el-input>
      </el-form-item>
        <el-form-item label="價格" prop="price">
        <el-input v-model="ruleForm.price"></el-input>
      </el-form-item>
        <el-form-item label="數量" prop="quantity">
        <el-input v-model="ruleForm.quantity"></el-input>
      
      <el-form-item>
        <el-button type="primary" @click="submitForm">上架</el-button>
        <el-button @click="dialogVisible=false">返回</el-button>
      </el-form-item>
     </el-form>
      </span>
    </el-dialog>
    <hr>	
        <!-- SearchAll資料 -->
        <template>
      <el-table
        :data="tableData"
        style="width: 100%"
        :row-class-name="tableRowClassName"
        v-on:selection-change="handleSelectionChange">
        <el-table-column
          type="selection"
          width="55">
        </el-table-column>
        <el-table-column
          type="index"
          width="50">
        </el-table-column>
        <el-table-column
          prop="booksId"
          align="center"
          label="書籍編號">
        </el-table-column>
        <!-- 顯示圖片 -->
        <el-table-column
          prop="bookimgsurl"
          align="center"
          label="書籍封面">
        <template slot-scope="scope">
            <img style="height: 100px" :src="scope.row.bookimgsurl" /> 
        </template>
        </el-table-column>
        <el-table-column
          prop="booksName"
          align="center"
          label="書籍名稱">
        </el-table-column>
        <el-table-column
          prop="authorName"
          align="center"
          label="作者名稱">
        </el-table-column>
        <el-table-column
          prop="publisherName"
          align="center"
          label="出版社名稱">
        </el-table-column>
        <el-table-column
          prop="price"
          align="center"
          label="價錢">
        </el-table-column>
        <el-table-column
          prop="quantity"
          align="center"
          label="數量">
        </el-table-column>
        <el-table-column
          prop="opt"      
          align="center"
          label="操作">
        <template slot-scope="scope"> <!-- 為了加入index -->
          <el-row>
        <!--  <el-button type="primary" icon="el-icon-edit" circle  name="todo" id="upd" v-on:click="optUpdate(scope.$index, scope.row)"></el-button> -->  <!-- update -->
          
          <!-- 修改之dialog -->
          <el-dialog title="內容修改"  :visible.sync="dialogVisibleForUpdate" width="30%" > 
     
    <!-- 新增書籍內容表單 --> 
    <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="120px" class="demo-ruleForm">
      <el-form-item label="書名" prop="booksName">
        <el-input v-model="ruleForm.booksName" :placeholder="[[updateDataDefault.booksName]]"></el-input>
      </el-form-item>
        <el-form-item label="作者" prop="authorName">
        <el-input v-model="ruleForm.authorName" :placeholder="[[updateDataDefault.authorName]]"></el-input>
      </el-form-item>
        <el-form-item label="出版社" prop="publisherName">
        <el-input v-model="ruleForm.publisherName" :placeholder="[[updateDataDefault.publisherName]]"></el-input>
      </el-form-item>
        <el-form-item label="價格" prop="price">
        <el-input v-model="ruleForm.price" :placeholder="[[updateDataDefault.price]]"></el-input>
      </el-form-item>
        <el-form-item label="數量" prop="quantity">
        <el-input v-model="ruleForm.quantity" :placeholder="[[updateDataDefault.quantity]]"></el-input>
      
      <el-form-item>
        <el-button type="primary" @click="submitUpdateForm">修改</el-button>
        <el-button @click="dialogVisibleForUpdate=false">返回</el-button>
      </el-form-item>
     </el-form>
      </span>
    </el-dialog>
          
          <el-button type="info" icon="el-icon-more" circle name="todo" id="more" v-on:click="goToDetails(scope.$index, scope.row)"></el-button>	<!-- Detailse -->
          <el-button type="danger" icon="el-icon-delete" circle name="todo" id="del" v-on:click="optDelete(scope.$index, scope.row)"></el-button>	<!-- delete -->
        </template>
        </el-table-column>
    
    </template>
    
    			<!-- 分頁開始 -->
		<div class="block">
    <span class="demonstration">共{{Math.ceil(bookTotalPages)}}頁</span>
    <el-pagination
      background
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page.sync="currentPage"
      :page-size="3"
      layout="prev, pager, next, jumper"
      :total="bookTotalElements">
    </el-pagination>
   
  </div>
		<!-- 分頁結束  "bookTotalPages" "bookTotalElements"  -->
    
    
        
<!--         </div> -->
    </div>
	<!-- =================== 05. 主要內容 end =================== -->



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


	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<!-- development version, includes helpful console warnings -->
    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>

	<!-- import JavaScript -->
	<script src="https://unpkg.com/element-ui/lib/index.js"></script>
	


	<script>
	//初始化分頁
	var indexPage = 1;

	new Vue ({
		el:"#main",
		methods: {
		      tableRowClassName({row, rowIndex}) {
		        if (rowIndex%4 === 1) {
		          return 'warning-row';
		        } else if (rowIndex%4 === 3) {
		          return 'success-row';
		        }
		        return '';
		      },
		    //複選做批次刪除
		      handleSelectionChange(val) {
		          this.multipleSelection = val;
		        	  console.log( this.multipleSelection );
		          
		        },
		        //快速查詢用
		        onSubmit() {
		        	var _this = this;
		        	//初步判斷
		        	if(this.formInline.bookKeyWord==""){
		        		_this.searchResults ="";
		        		document.getElementById("showZone").innerHTML = "請輸入查詢關鍵字...";
		        	}else{
		        	//清空
		        	document.getElementById("showZone").innerHTML = "";
		            //console.log('submit!');  //for Test
		            //console.log(this.formInline.user);   //印出查詢字
		            var keyword =  this.formInline.bookKeyWord;
					
					axios({
						method:"GET",
						url:"http://localhost:8080/admin/books/"+ encodeURIComponent(keyword),
					}).then( function(response){
					//let tmp =	encodeURIComponent(response);   //後端回傳資料編碼待解決!!!!!!!!!!!!!!!!!!
					//let tmp1 = decodeURIComponent(tmp);
					if( response.data != ""){
							_this.tableData  = response.data;
							//修改 url 為完整路徑
					_this.tableData.forEach((item)=>{
		        		console.log(item.bookimgsurl);
		        		let url = item.bookimgsurl;
		        		let newUrl = "http://localhost:8080/static/uploads/"+url;
		        	//_this.imgUrl.push(newUrl);
		        	//console.log(_this.imgUrl);
		        	//item.bookimgsurl = newUrl ;
		            })
					}else{
						document.getElementById("showZone").innerHTML = "查無此書!!";
					}
					//_this.searchResults = response.data;
					let num = response.data.length;
					document.getElementById("showZone").innerHTML = "有 " + num + " 筆相符";
					console.log(_this.searchResults);
					//console.log(response.data); //test
					})
		        	}
		          },
		          //書本上架之提交表單方法
		          submitForm(){
		                  //資料傳向後端, 把this存入var變數
		                  var _this = this;
		                  //console.log(this.ruleForm);  //test
						  axios({
					      method:"POST",
					      url:"http://localhost:8080/BookAdd",
					      //將表單內容以JSON格式傳入後端
					      data: {
					    	  "booksName": _this.ruleForm.booksName ,
								"authorName":_this.ruleForm.authorName ,
								"publisherName":_this.ruleForm.publisherName ,
								"price":_this.ruleForm.price ,
								"quantity": _this.ruleForm.quantity ,
								}
				          }).then( function(response){
							_this.tableData = response.data;	
		                  //確認後提交表單
		                  alert('上架成功!');
						 })
						 //最後重回MainPage
		                 location.replace('http://localhost:8080/BookMain');
		                  //console.log(this.ruleForm); //test

		            },
		        //  !!!!!!!!!!未完成!!!!!!!!!!
		        optUpdate(index ,row){
		        	  	  //跳出對話視窗
		        	  	  this.dialogVisibleForUpdate=true;
		                  //顯示placeholder
		                  this.updateDataDefault.booksName = row.booksName ;  
		                  this.updateDataDefault.authorName = row.authorName ; 
		                  this.updateDataDefault.publisherName = row.publisherName; 
		                  this.updateDataDefault.price = row.price ; 
		                  this.updateDataDefault.quantity = row.quantity ; 
		                  this.tmpStoreBookId = row.booksId;   //抓取要改之book的ID , 存入tmpStoreBookId 以利submitUpdateForm()辨別要更新哪筆
		                  //console.log("updateDataDefault : " +updateDataDefault);  
		                  
		            },
		         //提交修改表單資料
		         submitUpdateForm(){
		                console.log("id is : "+ this.tmpStoreBookId);    //test
		                console.log("books new name : " + this.ruleForm.booksName);  //test
		                //透過ajax傳入後端
		                var _this = this;  //將window之this 轉成 vue之this
						  axios({
						      method:"POST",
						      url:"http://localhost:8080/BookUpdateById",
						      //將表單內容以JSON格式傳入後端
						      data: {
						    	  "booksId": _this.tmpStoreBookId ,
						    	  "booksName": _this.ruleForm.booksName,
						    	  "authorName": _this.ruleForm.authorName,
						    	  "publisherName": _this.ruleForm.publisherName,
						    	  "price": _this.ruleForm.price,
						    	  "quantity": _this.ruleForm.quantity,
									}
					          }).then( function(response){
								_this.tableData = response.data;	
			                  //確認後提交表單
			                  alert('修改成功!');
							 })
							//最後重回MainPage
			                location.replace('http://localhost:8080/BookMain');            	
		            },
		        //刪除資料
		        optDelete(index ,row){
		            	Swal.fire({
		            		  title: '確定要刪除?',
		            		  showDenyButton: true,
		            		  showCancelButton: false,
		            		  confirmButtonText: '刪除',
		            		  denyButtonText: '取消',
		            		}).then((result) => {
		            			Swal.fire('刪除成功!', '', 'success')
		            		  /* Read more about isConfirmed, isDenied below */
		            		  if (result.isConfirmed) {
				                  //console.log(this.ruleForm);  //test
				                  console.log(row.booksId); //test
				                  //console.log(row.booksName); //test
								  axios({
							      method:"DELETE",
							      url:"http://localhost:8080/admin/books/"+row.booksId,
						          }).then( function(response){
									_this.tableData = response.data;	
									console.log(_this.tableData); 
				                  //確認後提交表單
				                  alert('刪除成功!');
								 })
								 //最後重回MainPage
				                 location.replace('http://localhost:8080/admin/admin.books');
				                  //console.log(this.ruleForm); //test
			            		  
		            		    
		            		  } else if (result.isDenied) {
		            		    Swal.fire('資料未刪除', '', 'error')
		            		  }
		            		})

		            },
		         reset(){
		            	 //重回MainPage
		                 location.replace('http://localhost:8080/admin/admin.books');
		            },
		         goToDetails(index ,row){
				        let booksid = row.booksId;
		            	console.log(row.booksId); //Test
		            	let	url="http://localhost:8080/admin/admin.booksDetails";
		            	window.location.href= url+"?id="+ booksid
						
				    },
			    goToAdd(){
		            	window.location.href= "http://localhost:8080/admin/admin.booksadd";
				    },
				  //載入分頁
					loadPage(indexPage){
							let _this = this;
							axios({
								method:"POST",
								url:"http://localhost:8080/admin/findBooksByPage/"+indexPage
							}).then( function(response){
							_this.tableData = response.data;	
							console.log(_this.tableData);
							
					        _this.tableData.forEach((item)=>{
					        	console.log(item.bookimgsurl);
					        	//let url = item.bookimgsurl;
					        	//let newUrl = "http://localhost:8080/static/uploads/"+url;
					        	//_this.imgUrl.push(newUrl);
					        	//console.log(_this.imgUrl);
					        	//item.bookimgsurl = newUrl ;
					            })
					        console.log(_this.tableData);
							console.log(_this.bookTotalPages);
							console.log(_this.bookTotalElements);
							})
					},
					//改變分頁
					handleSizeChange(val) {				
	        				indexPage = val;
	        				console.log(`items per page` + val);
	      			},
	      			handleCurrentChange(val) {
	      					indexPage = val;
	       					console.log(`current page: ` + val);
	       					this.loadPage(indexPage)
	      			},
	      		//download
	      		downloadAll(){
	      			$.ajax({
	      				type:'post',
	      				url:'/admin/retrieveBooksFile',
	      				dataType:'json',
//	      					contentType:'application/json',
//	      					data:${totalElements},
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
	      		},
	      		
		    },
		    data() {
		      return {
		    	//serchall資料
		        tableData: [],
		        //複選做批次刪除
		        multipleSelection:[],
		        //快速關鍵字查詢用
		        formInline: {
		        	bookKeyWord: ''
		          },
		        //快速查詢結果用
		        searchResults:[],
		        //新增書籍視窗狀態
		        dialogVisible: false,
		        //修改資料儲存booksID
		        tmpStoreBookId :"",
		      //新增書籍視窗預設資料
		        updateDataDefault: {
		        	booksName: '',
		            authorName:'',
		            publisherName:'',
		            price:'',
		            quantity:'',
		          },
		      	//修改書籍資料視窗狀態
		        dialogVisibleForUpdate: false,
		        //表格內容
		        ruleForm: {
		        	booksName: '',
		            authorName:'',
		            publisherName:'',
		            price:'',
		            quantity:'',
		          },
		        //書名不得為空之判斷
				rules: {
				          booksName: [
				            { required: true, message: '請輸入書名', trigger: 'blur' }
				 	   ]
			 	   },
				 	//分頁
				bookTotalPages:'',
				bookTotalElements:'',
				currentPage:indexPage,
		         
		      }
		    },
		    mounted:function(){

		    	genderChart(${bookVarieties[0]}, ${bookVarieties[1]}, ${bookVarieties[2]}, ${bookVarieties[3]}, ${bookVarieties[4]},
						${bookVarieties[5]}, ${bookVarieties[6]}, ${bookVarieties[7]}, ${bookVarieties[8]}, ${bookVarieties[9]}
						);
				ageChart(${publishYearCount[0]}, ${publishYearCount[1]}, ${publishYearCount[2]}, ${publishYearCount[3]}, ${publishYearCount[4]},
						);
				console.log("種類測試");
				console.log( ${publishYearCount[0]} );	
				console.log( ${publishYearCount[1]} );	
				console.log( ${publishYearCount[2]} );	
				
				let _this = this;
				axios({
					method:"POST",
					url:"http://localhost:8080/admin/findBooksByPage/"+indexPage,
				}).then( function(response){
				_this.tableData = response.data;	
				console.log(_this.tableData);
				
		        _this.tableData.forEach((item)=>{
		        	console.log(item.bookimgsurl);
		        	//let url = item.bookimgsurl;
		        	//let newUrl = "http://localhost:8080/static/uploads/"+url;
		        	//_this.imgUrl.push(newUrl);
		        	//console.log(_this.imgUrl);
		        	//item.bookimgsurl = newUrl ;
		            })
		         _this.bookTotalPages = Number("${bookTotalPages}"),  // typeof 為String => 轉int
		         _this.bookTotalElements = Number("${bookTotalElements}"),   // typeof 為String => 轉int
		        
		        console.log(_this.bookTotalPages);
		        console.log(_this.bookTotalElements);
		        console.log(_this.tableData);
				})
		    }
  });


	// Pie Chart Example (性別圖表)
	function genderChart(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10){
//			var ctx = document.getElementById("myPieChart");
		var genderChart = new Chart($("#genderChart"), {
		  type: 'doughnut',
		  data: {
		    labels: ["商業理財", "語言學習", "電腦程式", "藝術設計", "現代小說","中文古典","外文小說","親子教育","生活風格","美食旅遊"],
		    datasets: [{
		      data: [a1, a2, a3, a4, a5, a6, a7, a8, a9, a10],
		      backgroundColor: [
			      '#EEC373', 
			      '#876445', 
			      '#36b9cc',
			      'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)',
	                'rgba(32, 61, 34, 0.2)'
			      ],
		      hoverBackgroundColor: [
			      '#e6af41', 
			      '#4D3124', 
			      '#2c9faf',
			      'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)',
	                'rgba(32, 61, 34, 1)'
			      ],
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
//		var ctx = document.getElementById("myBarChart");
	function ageChart(a1, a2, a3, a4, a5){
		var ageChart = new Chart($("#ageChart"), {
		  type: 'bar',
		  data: {
		    labels: ["今年", "2018 - 2021", "2014 - 2017", "2010 - 2013", "2012 以前"],
		    //labels: ["商業", "語言", "電腦", "藝術", "小說","古典","外文","親子","生活","美食旅遊"],
		    datasets: [{
		      label: "Year",
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
		        gridLines: {
		          display: false,
		          drawBorder: false
		        },
		        ticks: {
		          maxTicksLimit: 10
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
//			          return datasetLabel + number_format(tooltipItem.yLabel) + " 本";
		          return number_format(tooltipItem.yLabel) + " 本";
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
			url:'/admin/retrieveBooksFile',
			dataType:'json',
//				contentType:'application/json',
//				data:${totalElements},
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
	</script>


</body>
</html>