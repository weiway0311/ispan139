<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    
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
    
    <title>新增書籍</title>

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

        .avatar-uploader .el-upload {
            border: 1px dashed #d9d9d9;
            border-radius: 6px;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .avatar-uploader .el-upload:hover {
            border-color: #409EFF;
        }

        .avatar-uploader-icon {
            font-size: 28px;
            color: #8c939d;
            width: 178px;
            height: 178px;
            line-height: 178px;
            text-align: center;
        }

        .avatar {
            width: 178px;
            height: 178px;
            display: block;
        }
    </style>
    <!-- sweet alert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!--<link rel="stylesheet" href="sweetalert2.min.css">-->

    <!-- import bootstrap -->
<!--     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" -->
<!--         integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
    <!-- import CSS -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <!-- development version, includes helpful console warnings -->
    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>

    <!-- import JavaScript -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>

<body class="sb-nav-fixed">
    <%
	Integer totalAmount = 0;
	String role = "";
	if (session.getAttribute("login") != null) {
		role = (String) session.getAttribute("login");
		System.out.println("===================================" + role);
		if (role.equals("admin")) {
			role = "管理";
		}
	}
	if (!role.isEmpty()) {
		role = role.substring(role.length() - 2, role.length());
	} else {
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

	    <div id="app">
	        <!-- navbar -->
<!-- 	        <nav class="navbar bg-yellow navbar-dark p-3 navbar-expand-lg"> -->
<%-- 	            <el-avatar><%=role%></el-avatar> --%>
<!-- 	            <div class='container'> -->
<!-- 	                <div class="collapse navbar-collapse"></div> -->
	
<!-- 	                <a href="http://localhost:8080/admin/admin.books" class='navbar-brand'>回上一頁</a> <a -->
<!-- 	                    href="/logout" class='navbar-brand'>登出 -->
<%-- 	                    ${userDetail.fullName}</a> --%>
<!-- 	            </div> -->
<!-- 	        </nav> -->
	
	
	        <!-- 兩邊留白 -->
	        <div class='container'>
	            <div>
	                <!-- 新增書籍內容表單 -->
	                <el-form label-width="120px" class="demo-ruleForm">
	                    <div v-if="step === 1">
	                        <!--     <h1>第一部分</h1>  -->
	
	                        <el-steps :active="1" align-center>
	                            <el-step title="Step 1" description="書籍基本"></el-step>
	                            <el-step title="Step 2" description="書籍詳細"></el-step>
	                            <el-step title="Step 3" description="作者資訊"></el-step>
	                            <el-step title="Step 4" description="完成!!"></el-step>
	                        </el-steps>
	
	                        <div>
	                            <legend for="booksName">書名:</legend>
	                            <input id="booksName" name="booksName" v-model="registration.booksName" />
	                        </div>
	                        <hr />
	                        <legend for="booksVarieties">書籍類別:</legend>
	                        <br />
	                        <div>
	                            <table>
	                                <tr>
	                                    <td> <input type="radio" id="b10" value="10" v-model="registration.booksVarieties"
	                                            name="booksVarieties" />
	                                        <label for="b10">商業理財</label>
	                                    </td>
	                                    <td><input type="radio" id="b20" value="20" v-model="registration.booksVarieties"
	                                            name="booksVarieties" /> <label for="b20">語言學習</label>
	                                    </td>
	                                    <td> <input type="radio" id="b30" value="30" v-model="registration.booksVarieties"
	                                            name="booksVarieties" />
	                                        <label for="b30">電腦程式</label></td>
	
	                                </tr>
	                                <tr>
	                                    <td> <input type="radio" id="b40" value="40" v-model="registration.booksVarieties"
	                                            name="booksVarieties" /> <label for="b40">藝術設計</label></td>
	
	                                    <td>
	                                        <input type="radio" id="b50" value="50" v-model="registration.booksVarieties"
	                                            name="booksVarieties" />
	                                        <label for="b50">現代小說</label>
	                                    </td>
	                                    <td><input type="radio" id="b60" value="60" v-model="registration.booksVarieties"
	                                            name="booksVarieties" /> <label for="b60">中文古典</label>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td> <input type="radio" id="b70" value="70" v-model="registration.booksVarieties"
	                                            name="booksVarieties" />
	                                        <label for="b70">外文小說</label>
	                                    </td>
	                                    <td>
	                                        <input type="radio" id="b80" value="80" v-model="registration.booksVarieties"
	                                            name="booksVarieties" /> <label for="b80">親子教育</label>
	                                    </td>
	                                    <td>
	                                        <input type="radio" id="b90" value="90" v-model="registration.booksVarieties"
	                                            name="booksVarieties" />
	                                        <label for="b90">生活風格</label>
	                                    </td>
	                                </tr>
	                            </table>
	
	                        </div>
	
	                        <hr />
	                        <!-- 圖片上傳 -->
	                        <div>
	                            <el-upload action="http://localhost:8080/admin/BookCoverAddController" list-type="picture-card"
	                                :on-preview="handlePictureCardPreview" :on-remove="handleRemove" :on-change="show">
	                                <i class="el-icon-plus"></i>
	                            </el-upload>
	                            <el-dialog :visible.sync="dialogVisible">
	                                <img width="100%" :src="dialogImageUrl" alt="">
	                            </el-dialog>
	                            <hr />
	                            <!-- TEST -->
	                            <!-- 
	                            <div border="solid red">
	                                <img v-if="imageUrl" :src="imageUrl">
	                            </div>
	                            
	                            <hr>
	                             -->
	                            <legend for="publisherName">出版社:</legend>
	                            <input id="publisherName" name="publisherName" v-model="registration.publisherName" />
								<hr>
	                            <div>
	                                <el-button type="primary" icon="el-icon-arrow-right" @click.prevent="next()">下一頁
	                                </el-button>
	                            </div>
	                        </div>
	                    </div>
	
	                    <div v-if="step === 2">
	                        <!--    <h1>第二部分</h1>  -->
	
	                        <el-steps :active="2" align-center>
	                            <el-step title="Step 1" description="書籍基本"></el-step>
	                            <el-step title="Step 2" description="書籍詳細"></el-step>
	                            <el-step title="Step 3" description="作者資訊"></el-step>
	                            <el-step title="Step 4" description="完成!!"></el-step>
	                        </el-steps>
	
	                        <el-descriptions title="書籍資訊">
	                            <el-descriptions-item label="書籍簡介" prop="bookDescribe" label="書籍簡介">
	                                <el-input type="textarea" id="bookDescribe" name="bookDescribe"
	                                    v-model="registration.bookDescribe" />
	                            </el-descriptions-item>
	                            <el-descriptions-item label="ISBN"> <input id="isbn" name="isbne"
	                                    v-model="registration.isbn" />
	                            </el-descriptions-item>
	                        </el-descriptions>
	                        <hr>
	                        <el-descriptions title="出版日期">
	                            <el-descriptions-item label="選擇日期">
	                                <el-calendar v-model="registration.publishDate"></el-calendar>
	                            </el-descriptions-item>
	                        </el-descriptions>
	                        <br />
	                        <hr>
	
	                        <el-button type="primary" icon="el-icon-arrow-left" @click.prevent="prev()">上一頁</el-button>
	                        <el-button type="primary" icon="el-icon-arrow-right" @click.prevent="next()">下一頁</el-button>
	                    </div>
	
	                    <div v-if="step === 3">
	                        <!--    <h1>第三部分</h1>  -->
	
	                        <el-steps :active="3" align-center>
	                            <el-step title="Step 1" description="書籍基本"></el-step>
	                            <el-step title="Step 2" description="書籍詳細"></el-step>
	                            <el-step title="Step 3" description="作者資訊"></el-step>
	                            <el-step title="Step 4" description="完成!!"></el-step>
	                        </el-steps>
	
	                        <el-descriptions title="作者資訊">
	                            <el-descriptions-item label="作者"> <input id="authorName" name="authorName"
	                                    v-model="registration.authorName" /> </el-descriptions-item>
	                            <el-descriptions-item label="作者簡介" prop="authorInfo" label="書籍簡介">
	                                <el-input type="textarea" id="authorInfo" name="authorInfo"
	                                    v-model="registration.authorInfo" />
	                            </el-descriptions-item>
	                        </el-descriptions>
	                        <hr>
	                        <el-descriptions title="其他資訊">
	                            <el-descriptions-item label="價格">
	                                <el-input-number v-model="registration.price" :min="1" :max="999"></el-input-number>
	                            </el-descriptions-item>
	                            <el-descriptions-item label="數量">
	                                <el-input-number v-model="registration.quantity" :min="1" :max="99">
	                                </el-input-number>
	                            </el-descriptions-item>
	                        </el-descriptions>
	                        <hr>
	                        <el-button type="primary" icon="el-icon-arrow-left" @click.prevent="prev()">上一頁</el-button>
	                        <el-button type="primary" icon="el-icon-arrow-right" @click.prevent="next()">下一頁</el-button>
	                    </div>
	
	                    <div v-if="step === 6">
	
	                        <el-steps :active="4" align-center>
	                            <el-step title="Step 1" description="書籍基本"></el-step>
	                            <el-step title="Step 2" description="書籍詳細"></el-step>
	                            <el-step title="Step 3" description="作者資訊"></el-step>
	                            <el-step title="Step 4" description="完成!!"></el-step>
	                        </el-steps>
	
	                        <!--   <h1>Step Three</h1>   -->
	
	                        <h1 align-center>
	                            新增完畢!!
	                        </h1>
	                        <div>
	                          <!--  <img src="/images/success.jpg" width="100%" /> -->
	                        </div>
	
	                        <hr>
	                        <el-button type="primary" icon="el-icon-arrow-left" @click.prevent="prev()">上一頁</el-button>
	                        <el-button type="primary" icon="el-icon-check" @click.prevent="submit()">完成</el-button>
	                    </div>
	                </el-form>
	            </div>
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

    <script>
        new Vue({
            el: "#app",
            data() {
                return {
                    step: 1,
                    registration: {
                        name: null,
                        email: null,
                        qPicked: null,
                        booksName: null,
                        booksVarieties: null,
                        publisherName: null,
                        bookimgsurl: null,
                        bookDescribe: null,
                        isbn: null,
                        publishDate: null,
                        authorName: null,
                        authorInfo: null,
                        price: null,
                        quantity: null,
                    },
                    num: 1,
                    imageUrl: "",
                    dialogImageUrl: '',
                    dialogVisible: false,
                };
            },
            methods: {
                prev() {
                    if (this.step > 2 && this.step <= 6) {
                        this.step = 2;
                    } else {
                        this.step--;
                    }
                },
                next() {
                    if (this.step === 2 && this.registration.qPicked === "1") {
                        this.step++;
                    } else if (this.step === 2 && this.registration.qPicked === "2") {
                        this.step += 2;
                    } else if (this.step === 2 && this.registration.qPicked === "3") {
                        this.step += 3;
                    } else if (this.step > 2 && this.registration.qPicked !== "NULL") {
                        this.step = 6;
                    } else {
                        this.step++;
                    }
                },
                submit() {
                	//確認有無null
           		 if(this.registration.authorName==null|| this.registration.booksName==null){
           			 Swal.fire({
           				  icon: 'error',
           				  title: '必要欄位未填寫',
           				  text: '書名及作者名為填寫(必填)',
           				})
                    }else{
                	Swal.fire({
                		  title: '確定要新增嗎?',
                		  icon: 'warning',
                		  showCancelButton: true,
                		  confirmButtonColor: '#3085d6',
                		  cancelButtonColor: '#d33',
                		  confirmButtonText: '確定',
                		  cancelButtonText: '取消',
                		}).then((result) => {
                		  if (result.isConfirmed) {
                    		 
                		    Swal.fire(
                		      '新增成功!',
                		      '書籍已成功上架!',
                		      'success',
                		    );
                            console.log(this.registration);
                            _this = this;
                            axios({
                                method: "POST",
                                url: "http://localhost:8080/admin/books",
                                data: _this.registration
                            }).then(function (response) {

                                console.log(response.data);
                                if (response.data) {
                                    console.log("OK")
                                    window.location.href =
                                        "http://localhost:8080/admin/admin.books";
                                }
                                
                            })
                		    
                		  
                		  }
                		})
                		
                    }	
                },
                //及時預覽作用
                handleRemove(file, fileList) {
                    console.log(file, fileList);
                    this.registration.bookimgsurl = '';
                    this.imageUrl = ''; //清空
                    //console.log(this.bookimgsurl)
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
                            _this.registration.bookimgsurl = imgUrlBase64;

                        }
                        reader.onerror = (e) => {
                            reject(e)
                        }
                        reader.onloadend = () => {
                            resolve(imgUrlBase64);
                            _this.imageUrl = imgUrlBase64;
                            //console.log(_this.registration.bookimgsurl)
                        }

                    })
                },
            },
        });
    </script>




</body>

</html>