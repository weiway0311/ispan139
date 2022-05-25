<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>

<head>
    <title>書本詳細資訊</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


    <style>
        html,
        body {
            margin: 0;
            padding: 0
        }

        body {
            font: 76% arial, sans-serif;
            text-align: center
        }

        p {
            margin: 0 10px 10px
        }

        a {
            padding: 5px;
            text-decoration: none;
            color: #000000;
        }

        div#header {
            background-color: #F3F2ED;
        }

        div#header h1 {
            height: 80px;
            line-height: 80px;
            margin: 0;
            padding-left: 10px;
        }

        div#container {
            text-align: left
        }

        div#content p {
            line-height: 1.4
        }

        div#navigation {}

        div#navigation ul {
            margin: 15px 0;
            padding: 0;
            list-style-type: none;
        }

        div#navigation li {
            margin-bottom: 5px;
        }

        div#extra {}

        div#footer {}

        div#footer p {
            margin: 0;
            padding: 5px 10px
        }

        div#container {
            width: 700px;
            margin: 0 auto
        }

        div#wrapper {
            float: left;
            width: 100%
        }

        div#content {
            margin-left: 300px
        }

        div#navigation {
            float: left;
            width: 150px;
            margin-left: -700px
        }

        div#extra {
            float: left;
            width: 150px;
            margin-left: -550px
        }

        div#footer {
            clear: left;
            width: 100%
        }
    </style>



    <!-- Google Books -->
    <script type="text/javascript" src="https://www.google.com/books/jsapi.js"></script>
    <script type="text/javascript">
        google.books.load();

        function initialize() {
            var viewer = new google.books.DefaultViewer(document.getElementById('viewerCanvas'));
            console.log('ISBN:' + booksAPI);
            viewer.load(booksAPI);
        }

        google.books.setOnLoadCallback(initialize);
    </script>
    <!-- Google Books end-->
</head>

<body>

    <div id="main">

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

                <!-- 讀者資訊 starts-->
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
                <!-- 讀者資訊 ends-->
            </div>
        </nav>
        <!-- Navigation end -->


        <!-- Top banner 背景黑圖 starts -->
        <section class="fh5co-top-banner">
            <div class="top-banner__inner site-container">
                <div id="container">
                    <h1 style="color:white;">{{details.booksName}}</h1>
                    <div id="wrapper">
                        <div id="content">
                            <!-- Books API -->
                            <div id="viewerCanvas" float="flex" style="width: 600px; height: 500px"></div>
                        </div>
                    </div>
                    <div id="navigation">
                        <p><strong>書籍封面</strong></p>
                        <!-- 
    <ul>
      <li><a href="http://www.free-css.com/">Free CSS Templates</a></li>
      <li><a href="http://www.free-css.com/free-css-layouts.php">Free CSS Layouts</a></li>
    </ul>
     -->
                        <img class="card-img-top mb-5 mb-md-0" :src="details.bookimgsurl" alt="..." />
                    </div>
                    <div id="extra">
                        <p><strong>詳細資訊</strong></p>
                        <p style="color:white;">BP-{{details.booksId}}</p>

                        <p style="color:white;">ISBN : {{details.isbn}}</p>
                        <p style="color:white;">出版社 : {{details.publisherName}}</p>
                        <p style="color:white;">出版日 : {{details.publishDate}}</p>
                        <p style="color:white;">
                            <el-button style="color:white;" class="el-icon-info" type="info"
                                @click="dialogVisibleBD = true">書籍</el-button>
                        </p>

                        <!-- 書籍簡介開始 -->
                        <el-dialog title="書籍簡介" :visible.sync="dialogVisibleBD" width="30%">
                            <p>{{details.bookDescribe}}</p>
                            <span slot="footer" class="dialog-footer">
                                <el-button @click="dialogVisibleBD = false">關閉</el-button>
                            </span>
                        </el-dialog>
                        <!-- 書籍簡介結束 -->


                        <p class="lead" style="color:white;">作者 : {{details.authorName}}</p>

                        <p style="color:white;">
                            <el-button style="color:white;" class="el-icon-info" type="info"
                                @click="dialogVisibleAD = true">作者</el-button>
                        </p>

                        <!-- 作者簡介開始 -->
                        <el-dialog title="作者簡介" :visible.sync="dialogVisibleAD" width="30%">
                            <p>{{details.authorInfo}}</p>
                            <span slot="footer" class="dialog-footer">
                                <el-button @click="dialogVisibleAD = false">關閉</el-button>
                            </span>
                        </el-dialog>
                        <!-- 作者簡介結束 -->


                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through"
                                style="color:white;">{{"$"+ Math.floor(details.price)}}</span>
                            <span class="lead" style="color:white;">{{"$"+details.price*0.8 }}</span>
                        </div>
                        <p style="color:white;">目前庫存 : {{details.quantity}}</p>
                    </div>
                    <div id="footer">
                        <p>
                            <el-button type="primary" @click="prevPage">
                                <i class="bi-cart-fill me-1"></i>
                                返回
                            </el-button>
                        </p>
                    </div>
                </div>

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
        var booksAPI = '';
        new Vue({
            el: "#main",
            methods: {
                addToCart() {},
                prevPage() {
                    window.location.href = "http://localhost:8080/store/booksMain";
                },
                handleCloseBD(done) {
                    this.$confirm('Are you sure to close this dialog?')
                        .then(_ => {
                            done();
                        })
                        .catch(_ => {});
                },
                //在Details將物品加入訂單 
		        addToOrder(item){
		            	let _this = this;
		            	//如果order為空就直接加入
		            	if(order.length < 1){
			            		item.itemTotal = item.price;
								order.push(item);
								
			            }else{				         
						//如果不為空=> 就判斷品項是否重複, 否則僅+-總額及+-數量
							order.forEach((book)=>{
							//品項重複, 僅+-總額及+-數量
							if(book.booksId == item.booksId){
								item.quantity += book.quantity;
								item.itemTotal += book.price;
							}});
							//都沒重複的話=>加入order(shoppingCar)
							item.itemTotal = item.price;
							order.push(item);
				        }
		            	//將物件轉為JSON 並加入session
		            	//let jsonStr = JSON.stringify(order);
						console.log(order);//test

		            },


            },
            data() {
                return {
                    tableData: [],
                    //詳細資料
                    details: {},
                    dialogVisibleBD: false,
                    dialogVisibleAD: false,
                }
            },
            mounted: function () {
                //console.log(`${isbn}`); //TEST OK
                let _this = this;
                axios({
                    method: "GET",
                    url: "http://localhost:8080/store/searchbooks/" + `${id}`,
                }).then(function (response) {

                    console.log(response.data);

                    //let url = response.data.bookimgsurl;
                    //let newUrl = "http://localhost:8080/static/uploads/"+url;
                    let oldPublishDate = response.data.publishDate
                    let idx_T = oldPublishDate.indexOf("T"); //取出年月日 用T去拆分字串
                    let newPublishDate = oldPublishDate.slice(0, idx_T); //取出年月日

                    //response.data.bookimgsurl = newUrl;  //換成完整路徑  改用Base64 故不用改完整路徑
                    response.data.publishDate = newPublishDate //換成只有年月日
                    _this.details = response.data;

                    console.log(newPublishDate);
                    booksAPI = response.data.isbn;
                })
            }
        })
    </script>
</body>

</html>