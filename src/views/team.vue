<template>

  <div class="team">
  <navbar></navbar>
    <div >
      <div class="container">
        
        <div class="row">
            <div class="col-sm" style="text-align: center;">
                <b><p class="topic" style="padding-top:2%;">TEAM</p></b>
            </div>
        </div>

        <div class="row" style="padding-top:2%;">
            <div class="col-md" style="text-align: center;">
                <img src="../assets/image/profile/IMG_6054.jpg" style="width:60%; border-radius:8px;">
                <div style="text-align:left; padding-left:20%; padding-top:2%;">
                    <p>STUDENT ID | 62130500040</p>
                    <p>FIRST NAME : NOPPHASORN </p>
                    <p>LAST NAME : TECHARUNGRUENGWIT</p>
                </div>
            </div>
            <div class="col-md" style="text-align: center;">
                <img src="../assets/image/profile/IMG_6053.jpg" style="width:60%; border-radius:8px;">
                <div style="text-align:left; padding-left:20%; padding-top:2%;">
                    <p>STUDENT ID | 62130500106</p>
                    <p>FIRST NAME : ARTID </p>
                    <p>LAST NAME : VIJITPANMAI</p>
                </div>
            </div>
            <div class="col-md" style="text-align: center;">
                <img src="../assets/image/profile/IMG_6056.jpg" style="width:60%; border-radius:8px;">
                <div style="text-align:left; padding-left:20%; padding-top:2%;">
                    <p>STUDENT ID | 62130500113</p>
                    <p>FIRST NAME : THANAWIN </p>
                    <p>LAST NAME : VATTRAETH</p>
                </div>
            </div>
        </div>
    </div>
    </div> 
  </div> 

</template>

<script>
	import Navbar from "../components/navbar.vue"

	export default {
	name : "team",
	components : {Navbar}
	}
</script>

<style>
    body {
        font-family: Kanit;
        background-image: url("../assets/image/app/BgOpa.png");
        background-repeat: no-repeat; 
        background-attachment: fixed;
        background-position: center;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        overflow-x: hidden;
        min-height: 600px;
    }

    .container-fluid{
        padding-left: 0px;
        padding-right: 0px;
    }

    .topic{
        font-size: 40px;
        padding-top: 2%;
        font-weight: bold;
    }

    .brand-name {
        text-align: left; 
        margin-top: 30px; 
        font-size: 30px;
    }

    .buttoncircle {
        width: 35px; /* ความกว้าง */
        height: 35px; /* ความสูง *//* สี */
        border-radius: 70px;
        border:4px solid #EFEFEF;
        margin: 0.2%;
    }

    .buttoncircle:hover {
        border: 4px solid #76B5FF;
    }

    .carousel {
        box-shadow: 1px 1px 10px #cccccc;
    }

    .link-custom {
        color: inherit;

    }

    .link-custom:hover {
        color: inherit;
        text-decoration: none;
        
    }
</style>