<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

      <!-- import elementUI CSS -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- import font-awesome CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

     <!--<link rel="stylesheet" href="/storestyle/css/elementui.css">-->
    <title>書香平台</title>
<!-- sweet alert -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- import bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/sponsorstyle/css/sponsorform.css">
</head>
<body>

<div class="container mt-5">
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col-md-6">
            <form id="regForm">
                <h1 id="register">Donate</h1>
                <div class="all-steps" id="all-steps"> <span class="step"></span> <span class="step"></span> <span class="step"></span> <span class="step"></span> </div>
                <div class="tab">
                    <h3>Donation Type:</h3> <label class="container">One time <input type="radio" checked="checked" name="radio"> <span class="checkmark"></span> </label> <label class="container">Recurring <input type="radio" name="radio"> <span class="checkmark"></span> </label>
                    <p><input type="text" placeholder="Amount" oninput="this.className = ''" name="amount"></p>
                </div>
                <div class="tab">
                    <p><input placeholder="First Name" oninput="this.className = ''" name="first"></p>
                    <p><input placeholder="Last Name" oninput="this.className = ''" name="last"></p>
                    <p><input placeholder="Email" oninput="this.className = ''" name="email"></p>
                    <p><input placeholder="Phone" oninput="this.className = ''" name="phone"></p>
                    <p><input placeholder="Street Address" oninput="this.className = ''" name="address"></p>
                    <p><input placeholder="City" oninput="this.className = ''" name="city"></p>
                    <p><input placeholder="State" oninput="this.className = ''" name="state"></p>
                    <p><input placeholder="Country" oninput="this.className = ''" name="country"></p>
                </div>
                <div class="tab">
                    <p><input placeholder="Credit Card #" oninput="this.className = ''" name="email"></p>
                    <p>Exp Month <select id="month">
                            <option value="1">January</option>
                            <option value="2">February</option>
                            <option value="3">March</option>
                            <option value="4">April</option>
                            <option value="5">May</option>
                            <option value="6">June</option>
                            <option value="7">July</option>
                            <option value="8">August</option>
                            <option value="9">September</option>
                            <option value="10">October</option>
                            <option value="11">November</option>
                            <option value="12">December</option>
                        </select></p>
                    <p>Exp Year <select id="year">
                            <option value="2021">2021</option>
                            <option value="2022">2022</option>
                            <option value="2023">2023</option>
                            <option value="2024">2024</option>
                        </select></p>
                    <p><input placeholder="CVV" oninput="this.className = ''" name="phone"></p>
                </div>
                <div class="thanks-message text-center" id="text-message"> <img src="https://i.imgur.com/O18mJ1K.png" width="100" class="mb-4">
                    <h3>Thanks for your Donation!</h3> <span>Your donation has been entered! We will contact you shortly!</span>
                </div>
                <div style="overflow:auto;" id="nextprevious">
                    <div style="float:right;"> <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button> <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button> </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>

//your javascript goes here
var currentTab = 0;
document.addEventListener("DOMContentLoaded", function(event) {


showTab(currentTab);

});

function showTab(n) {
var x = document.getElementsByClassName("tab");
x[n].style.display = "block";
if (n == 0) {
document.getElementById("prevBtn").style.display = "none";
} else {
document.getElementById("prevBtn").style.display = "inline";
}
if (n == (x.length - 1)) {
document.getElementById("nextBtn").innerHTML = "Submit";
} else {
document.getElementById("nextBtn").innerHTML = "Next";
}
fixStepIndicator(n)
}

function nextPrev(n) {
var x = document.getElementsByClassName("tab");
if (n == 1 && !validateForm()) return false;
x[currentTab].style.display = "none";
currentTab = currentTab + n;
if (currentTab >= x.length) {
// document.getElementById("regForm").submit();
// return false;
//alert("sdf");
document.getElementById("nextprevious").style.display = "none";
document.getElementById("all-steps").style.display = "none";
document.getElementById("register").style.display = "none";
document.getElementById("text-message").style.display = "block";




}
showTab(currentTab);
}

function validateForm() {
var x, y, i, valid = true;
x = document.getElementsByClassName("tab");
y = x[currentTab].getElementsByTagName("input");
for (i = 0; i < y.length; i++) { if (y[i].value=="" ){ 
	y[i].className +=" invalid" ; valid=false; } } if (valid) { 
		document.getElementsByClassName("step")[currentTab].className +=" finish" ; 
		} return valid; 
		} function fixStepIndicator(n) { var i, x=document.getElementsByClassName("step"); for (i=0; i < x.length; i++) { x[i].className=x[i].className.replace(" active", "" ); } x[n].className +=" active" ; }

</script>

</body>
</html>