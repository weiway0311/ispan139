<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>書本詳細資訊</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/storestyle/css/style.css">
    <link rel="stylesheet" href="/storestyle/css/slick.css">
<!-- import CSS -->
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    

     <!--<link rel="stylesheet" href="/storestyle/css/elementui.css">-->
    <title>書香平台</title>
<!-- sweet alert -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- import bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


    <style>
        .el-table .warning-row {
            background: oldlace;
        }

        .el-table .success-row {
            background: #f0f9eb;
        }

        /* nvbar css */
        .bg-yellow {
            background-color: #110;
        }

        .keyword {
            margin: 30px 0px;
        }
    </style>



	<!-- Google Books -->
	<script type="text/javascript" src="https://www.google.com/books/jsapi.js"></script>
    <script type="text/javascript">
      google.books.load();

      function initialize() {
        var viewer = new google.books.DefaultViewer(document.getElementById('viewerCanvas'));
        viewer.load('ISBN:9573270145');
      }

      google.books.setOnLoadCallback(initialize);
    </script>
<!-- Google Books end-->
</head>
<body>


<div id="main">

	<!-- ReaderLogin Bar -->
	<nav class="navbar bg-yellow navbar-dark p-3 navbar-expand-lg">
    
        <el-dropdown>
        <span class="el-dropdown-link">
          <el-avatar>讀者</el-avatar>
          <el-icon class="el-icon--right">
            <arrow-down />
          </el-icon>
        </span>
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item>讀者資訊</el-dropdown-item>
            <el-dropdown-item>登出</el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>

    <div class="container">
      <div class="collapse navbar-collapse"></div>

      <!-- <a href="member.jsp" class='navbar-brand'>回上一頁</a> -->
      <!-- <a href="Logout" class='navbar-brand'>登出 ${sessionScope.login}</a> -->
    </div>
  </nav>
  <!-- ReaderLogin Bar End-->
  
    <!-- Navigation -->
    <nav class="site-navigation">
        <div class="site-navigation-inner site-container">
            <img src="/storestyle/images/site-logo.png" alt="site logo">
            <div class="main-navigation">
                <ul class="main-navigation__ul">
                    <el-avatar>讀者</el-avatar>
                    <li><a href="http://localhost:8080/store/booksMain">首頁</a></li>
                    <li><a href="http://localhost:8080/store/searchAll">我想找書</a></li>
                    <li><a href="#">我想供書</a></li>
                    <li><a href="#">我想發表</a></li>
                    <li><a href="#">我想交流</a></li>
                </ul>
            </div>
            <div id="myBtn" class="burger-container" onclick="myFunction(this)">
                <div class="bar1"></div>
                <div class="bar2"></div>
                <div class="bar3"></div>
            </div>
            <!--
            <script>
                function myFunction(x) {
                    x.classList.toggle("change");
                }
            </script>
			-->
        </div>
    </nav>
    <!-- Navigation end -->
    
    
    <!-- Top banner 背景黑圖 starts -->
    <section class="fh5co-top-banner">
        <div class="top-banner__inner site-container">
      	    			
      			<!-- Product section-->
        <section class="py-5" width="80%">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-3"><img class="card-img-top mb-5 mb-md-0" :src="details.bookimgsurl" alt="..." /></div>                   
                    <div class="col-md-6">
                        <div class="small mb-1" style="color:white;" >BP-{{details.booksId}}</div>
                        <h1 class="display-5 fw-bolder" style="color:white;" >{{details.booksName}}</h1>
                        <div class="fs-5 mb-5">
                            <!-- <span class="text-decoration-line-through">{{"$"+ Math.floor(details.price)}}</span> -->
                           <span style="color:white;" >{{"$"+details.price }}</span>     
                        </div>
                        <p style="color:white;" >ISBN : {{details.isbn}}</p>
                        <p style="color:white;" >出版社 : {{details.publisherName}}</p>
                        <p style="color:white;" >出版日 : {{details.publishDate}}</p>
                        <p style="color:white;" >目前庫存 : {{details.quantity}}</p>
                        <p class="lead" style="color:white;" >{{details.bookdescribe}}</p>
                        <p style="color:white;" >作者 : {{details.authorName}}</p>
                        <p class="lead" style="color:white;" >{{details.authorInfo}}</p>
                        
  <!-- Books API -->
 <div id="viewerCanvas" float="flex" style="width: 600px; height: 500px"></div>
                    	

                        <div class="d-flex">
                          <!--   <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />  -->
                            <button class="btn btn-outline-dark flex-shrink-0" type="button" @click="addToCart">
                                <i class="bi-cart-fill me-1"></i>
                                修改
                            </button>
                            <button class="btn btn-outline-dark flex-shrink-0" type="button" @click="reset">
                                <i class="bi-cart-fill me-1"></i>
                                返回
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>	
      	   	
      	</div>
    </section>
      <!-- Top banner 背景黑圖 ends -->  

</div>


<!-- Scripts -->
    <script src="/storestyle/js/jquery.min.js"></script>
    <script src="/storestyle/js/slick.min.js"></script>
    <script src="/storestyle/js/main.js"></script>
    <script src="/storestyle/js/vue.js"></script>
    <!-- import JavaScript 須放在最後面!-->
	<script src="https://unpkg.com/element-ui/lib/index.js"></script>
		<!-- axios -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <script>
    //選單 三 -> X
    function myFunction(x) {
        x.classList.toggle("change");
    }
    
    new Vue ({
		el:"#main",
		methods: {
			addToCart(){
				},
			reset(){
				window.location.href="http://localhost:8080/store/booksMain";
				},
				handleClose(done) {
			        this.$confirm('Are you sure to close this dialog?')
			          .then(_ => {
			            done();
			          })
			          .catch(_ => {});
			    },
			    changeShow(){
					this.dialogVisible = !this.dialogVisible;
				}
			   
			},
		data(){
			return{
				tableData:[],
				//詳細資料
		        details: {},
		        dialogVisible:false,
			}
		},
		mounted:function(){
	    	//console.log(`${isbn}`); //TEST OK
			let _this = this;
			axios({
				method:"GET",
				url:"http://localhost:8080/store/searchbooks/"+`${id}`,
			}).then( function(response){
			
	        console.log(response.data);

	        //let url = response.data.bookimgsurl;
        	//let newUrl = "http://localhost:8080/static/uploads/"+url;
        	let oldPublishDate = response.data.publishDate
        	let idx_T = oldPublishDate.indexOf("T");  //取出年月日 用T去拆分字串
        	let newPublishDate = oldPublishDate.slice(0, idx_T); //取出年月日
        	
        	//response.data.bookimgsurl = newUrl;  //換成完整路徑  改用Base64 故不用改完整路徑
        	response.data.publishDate = newPublishDate //換成只有年月日
	        _this.details = response.data;

	        console.log(newPublishDate);
			})
	    }
    })

    </script>
</body>
</html>