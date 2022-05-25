<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF8">

<!-- 套版不要動 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
	
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="../css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="../assets/demo/chart-area-demo.js"></script>
<script src="../assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="../js/datatables-simple-demo.js"></script>
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
<body class="sb-nav-fixed">

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


<!-- 上方區塊 -->
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-primary">
    	<!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="/mainpage">以書會友 SWAPOOKS</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="input-group">
                <input class="form-control" type="hidden" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                <!-- <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button> -->
            </div>
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <!-- <li><a class="dropdown-item" href="#!">設定</a></li> -->
                    <!-- <li><hr class="dropdown-divider" /></li> -->
                    <li><a class="dropdown-item" href="/logout">登出 ${userDetail.fullName}</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    
    <!-- 左邊區塊 -->
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading"></div>
                        <a class="nav-link" href="/mainpage">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            管理員首頁
                        </a>
                        
                        <div class="sb-sidenav-menu-heading"></div>

                        <!-- 會員(書友) -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-circle-user"></i></div>
                            書友管理
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="http://localhost:8080/allreaderpage">查詢書友</a>
                                <a class="nav-link" href="http://localhost:8080/createreaderpage">新增書友</a>
                            </nav>
                        </div>

                        <!-- 書架(商品) -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                            書架管理
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="http://localhost:8080/admin/admin.books">查詢書籍</a>
                                <a class="nav-link" href="http://localhost:8080/admin/admin.booksadd">書籍上架</a>
                            </nav>
                        </div>
                        
                        <!-- 訂單 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseOrder" aria-expanded="false" aria-controls="collapseOrder">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-money-check"></i></div>
                            訂單管理
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseOrder" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="http://localhost:8080/order/gotosearchall">查詢訂單</a>
                                <a class="nav-link" href="http://localhost:8080/order/gotoaddorders">新增訂單</a>
                            </nav>
                        </div>

                        <!-- 討論版 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseClub" aria-expanded="false" aria-controls="collapseClub">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-comments"></i></div>
                            討論版管理
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseClub" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="http://localhost:8080/club/clubmain.controller">查詢文章</a>
                                <a class="nav-link" href="http://localhost:8080/club/addClub.controller">新增文章</a>
                            </nav>
                        </div>

                        <!-- 活動 -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEvent" aria-expanded="false" aria-controls="collapseEvent">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-calendar-days"></i></div>
                            活動管理
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseEvent" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="http://localhost:8080/searchallevent">查詢活動</a>
                                <a class="nav-link" href="http://localhost:8080/gotoAddPage">新增活動</a>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    SWAPOOKS
                </div>
            </nav>
        </div>


<!-- 中央區塊 -->
<div id="layoutSidenav_content">
 
<div id="main">
		<!-- navbar -->
<!-- 	<nav class="navbar bg-yellow navbar-dark p-3 navbar-expand-lg"> -->
<%-- 		<el-avatar><%=role%></el-avatar> 	 --%>
<!-- 		<div class='container'>		 -->
<!-- 			<div class="collapse navbar-collapse"> -->
				
<!-- 			</div> -->
				
<!-- 				<a href="/mainpage" class='navbar-brand'>回上一頁</a> -->
<%-- 				<a href="/logout" class='navbar-brand'>登出 ${userDetail.fullName}</a> --%>
<!-- 		</div> -->
<!-- 	</nav> -->

<!-- 兩邊留白 -->
<div class='container'>

	<!-- 快速查詢模糊比對 -->
<el-form :inline="true" :model="formInline" class="demo-form-inline">
  <el-form-item label="輸入書名(關鍵字)">
    <el-input v-model="formInline.bookKeyWord" placeholder="輸入書名(關鍵字)"></el-input>
  </el-form-item>
  <el-form-item>
    <el-button type="primary" icon="el-icon-search" @click="onSubmit">查詢</el-button>
    <el-button type="primary" icon="el-icon-refresh" @click="reset"></el-button>
  </el-form-item>
</el-form>
	<!-- 將數據陳列出來 -->
<span id="showZone"></span>
<div v-for="searchResult in searchResults">
	{{searchResult}}
</div>
<hr>
	<!-- add and delete(batch) button -->
<el-row>
 <!--  <el-button type="primary" plain icon="el-icon-upload2" @click="dialogVisible = true">書籍上架</el-button>  -->
	<el-button type="primary" plain icon="el-icon-upload2" @click="goToAdd">書籍上架</el-button> 
</el-row>

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
	
	</div>
</div>

		<!-- footer -->
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; SWAPOOKS 2022</div>
                    <!-- <div>
                        <a href="#">Privacy Policy</a>
                        &middot;
                        <a href="#">Terms &amp; Conditions</a>
                    </div> -->
                </div>
            </div>
        </footer>

</div>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<!-- development version, includes helpful console warnings -->
    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>

	<!-- import JavaScript -->
	<script src="https://unpkg.com/element-ui/lib/index.js"></script>
	


	<script>
	
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
				 	   ]}
		         
		      }
		    },
		    mounted:function(){
				let _this = this;
				axios({
					method:"GET",
					url:"http://localhost:8080/admin/books"
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
				})
		    }
  })
	</script>


</body>
</html>