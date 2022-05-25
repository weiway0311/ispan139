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
<!--     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" -->
<!--         integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->


    <style>
        .el-table .warning-row {
            background: oldlace;
        }

        .el-table .success-row {
            background: #f0f9eb;
        }

        /* nvbar css */
        .bg-yellow {
            background-color: #844200;
        }

        .keyword {
            margin: 30px 0px;
        }
    </style>
    <!-- import CSS -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

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
<!--         <nav class="navbar bg-yellow navbar-dark p-3 navbar-expand-lg"> -->
<%--             <el-avatar><%=role%></el-avatar> --%>
<!--             <div class='container'> -->
<!--                 <div class="collapse navbar-collapse"> -->

<!--                 </div> -->

<!--                 <a href="http://localhost:8080/admin/admin.books" class='navbar-brand'>回上一頁</a> -->
<%--                 <a href="Logout" class='navbar-brand'>登出 ${sessionScope.login}</a> --%>
<!--             </div> -->
<!--         </nav> -->

        <!-- 兩邊留白 -->
        <div class='container'>
            <h2>{{details.booksName+"->資料修改"}} </h2>
            <el-form :model="details" ref="details" label-width="120px" class="demo-ruleForm">
                <el-form-item label="書名" prop="booksName">
                    <el-input v-model="details.booksName" :placeholder="[[details.booksName]]"></el-input>
                </el-form-item>

                <el-form-item label="種類" prop="booksVarieties">
                    <!--  <el-radio-group > -->
                    <el-radio label="10" v-model="details.booksVarieties">商業理財</el-radio>
                    <el-radio label="20" v-model="details.booksVarieties">語言學習</el-radio>
                    <el-radio label="30" v-model="details.booksVarieties">電腦程式</el-radio>
                    <el-radio label="40" v-model="details.booksVarieties">藝術設計</el-radio>
                    <el-radio label="50" v-model="details.booksVarieties">現代小說</el-radio>
                    <el-radio label="60" v-model="details.booksVarieties">中文古典</el-radio>
                    <el-radio label="70" v-model="details.booksVarieties">外文小說</el-radio>
                    <el-radio label="80" v-model="details.booksVarieties">親子教育</el-radio>
                    <el-radio label="90" v-model="details.booksVarieties">生活風格</el-radio>
                    <el-radio label="100" v-model="details.booksVarieties">美食旅遊</el-radio>
                    <!--</el-radio-group>-->
                </el-form-item>

                <el-form-item label="圖片" prop="bookimgsurl">
                    <el-upload action="" list-type="picture-card" :on-preview="handlePictureCardPreview"
                        :on-remove="handleRemove" :on-change="show">
                        <i class="el-icon-plus"><img :src="details.bookimgsurl" width="100px"></i>
                    </el-upload>
                </el-form-item>
                </el-form-item>
                <el-form-item label="出版社" prop="publisherName">
                    <el-input v-model="details.publisherName" :placeholder="[[details.publisherName]]"></el-input>
                </el-form-item>

                <el-form-item label="書籍簡介" prop="bookDescribe">
                    <el-input type="textarea" v-model="details.bookDescribe" :placeholder="[[details.bookDescribe]]">
                    </el-input>
                </el-form-item>
                <el-form-item label="ISBN" prop="isbn">
                    <el-input v-model="details.isbn" :placeholder="[[details.isbn]]"></el-input>
                </el-form-item>
                <el-form-item label="出版日" prop="publishDate">
                    <el-input v-model="details.publishDate" :placeholder="[[details.publishDate]]"></el-input>
                    <el-calendar v-model="details.publishDate"></el-calendar>
                </el-form-item>
                <el-form-item label="作者" prop="authorName">
                    <el-input v-model="details.authorName" :placeholder="[[details.authorName]]"></el-input>
                </el-form-item>
                <el-form-item label="作者簡介" prop="authorInfo">
                    <el-input type="textarea" v-model="details.authorInfo" :placeholder="[[details.authorInfo]]">
                    </el-input>
                </el-form-item>
                <el-form-item label="提供者" prop="providerId">
                    <el-input v-model="details.providerId" :placeholder="[[details.providerId]]"></el-input>
                </el-form-item>
                <el-form-item label="價格" prop="price">
                    <el-input v-model="details.price" :placeholder="[[details.price]]"></el-input>
                </el-form-item>
                <el-form-item label="數量" prop="quantity">
                    <el-input v-model="details.quantity" :placeholder="[[details.quantity]]"></el-input>

                    <el-form-item>
                        <el-button type="primary" @click="submitUpdateForm">確定</el-button>
                        <el-button @click="reset">返回</el-button>
                    </el-form-item>
            </el-form>

            <hr>

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
        new Vue({
            el: "#main",
            methods: {
                submitUpdateForm() {

                    Swal.fire({
                        title: '您確定要修改嗎?',
                        showDenyButton: true,
                        showCancelButton: false,
                        confirmButtonText: '確定',
                        denyButtonText: '取消',
                    }).then((result) => {
                        /* Read more about isConfirmed, isDenied below */
                        if (result.isConfirmed) {
                            Swal.fire('修改成功!', '', 'success')
                            //alert("TEST!!!");
                            let _this = this;
                            axios({
                                method: "PUT",
                                url: "http://localhost:8080/admin/books/" +
                                    `${id}`,
                                data: _this.details
                            }).then(function (response) {

                                console.log(response.data);
                                window.location.href =
                                    "http://localhost:8080/admin/admin.books";
                            })
                        } else if (result.isDenied) {
                            Swal.fire('資料未修改', '', 'error')
                        }
                    })


                },
                reset() {
                    window.location.href = "http://localhost:8080/admin/admin.books";
                },
                handleRemove(file, fileList) {
                    console.log(file, fileList);
                    this.details.bookimgsurl = '';
                    this.imageUrl = ''; //清空
                    console.log(this.bookimgsurl)
                },
                handlePictureCardPreview(file) {
                    this.dialogImageUrl = file.url;
                    this.dialogVisible = true;
                    console.log(file)

                },
                show(file, fileList) {
                    let _this = this;
                    let fileRaw = file.raw;
                    //console.log(file.raw);//
                    //console.log(fileList);    
                    return new Promise(function (resolve, reject) {
                        const reader = new FileReader();
                        let imgUrlBase64 = '';
                        reader.readAsDataURL(fileRaw);
                        reader.onload = function () {
                            imgUrlBase64 = reader.result;
                            //console.log(imgUrlBase64);
                            _this.details.bookimgsurl = imgUrlBase64;

                        }
                        reader.onerror = (e) => {
                            reject(e)
                        }
                        reader.onloadend = () => {
                            resolve(imgUrlBase64);
                            _this.imageUrl = imgUrlBase64;
                            console.log(_this.details.bookimgsurl)
                        }

                    })
                },
            },
            data() {
                return {
                    //詳細資料
                    details: {},
                    imageUrl: "",
                    dialogImageUrl: '',
                    dialogVisible: false,
                }
            },
            mounted: function () {

                let _this = this;
                axios({
                    method: "GET",
                    url: "http://localhost:8080/admin/searchbooks/" + `${id}`,
                }).then(function (response) {

                    console.log(response.data);

                    //不改url
                    //let url = response.data.bookimgsurl;
                    //let newUrl = "http://localhost:8080/booksplattform/static/uploads/"+url;
                    let oldPublishDate = response.data.publishDate
                    let idx_T = oldPublishDate.indexOf("T"); //取出年月日 用T去拆分字串
                    let newPublishDate = oldPublishDate.slice(0, idx_T); //取出年月日

                    //response.data.bookimgsurl = newUrl;  //換成完整路徑
                    response.data.publishDate = newPublishDate //換成只有年月日
                    _this.details = response.data;

                    console.log(newPublishDate);
                })
            }
        })
    </script>


</body>

</html>