<template>
    <div class="register">

        <navbar></navbar>
        <div class="bg-login">

            <div class="container-fluid">

                <div id="login-panel"> 
                    <div class="row">
                        <div class="col-xl" style="text-align: center;">
                            <div class="login-logo">
                            <img src="../assets/image/app/Logo.png" style="width:100%; margin:-15%">
                                <p class="login-logo-desc">The Dora website has bags from a variety of brands. <br> For the convenience of shopping.</p>
                            </div>
                        </div>

                        <div class="col-xl" style="text-align: center;">
                            <div class="login-form" style="margin-top: 100px">
                                <div style="color:#8966D7;margin:20px auto;font-weight:bold;font-size:20px;">REGISTER A NEW ACCOUNT</div>
                                <form action="#dologin" method="post">
                                    <input type="text" class="form-control login-input" name="txtUserName" placeholder="User Name">
                                    <input type="text" class="form-control login-input" name="txtName" placeholder="Name">
                                    <input type="text" class="form-control login-input" name="txtLName" placeholder="Last Name">
                                    <input type="password" class="form-control login-input" name="txtPassword" placeholder="Password">
                                    <input type="password" class="form-control login-input" name="txtConfirmPassword" placeholder="Confirm Password">
                                    <button type="submit" class="btn btn-login">Register</button><br>
                                    <hr style="margin-top:50px">
                                    <div style="margin-top:30px; margin-bottom:20px">
                                        <a>Already have an account?</a><router-link to="/login"> Login</router-link>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="login-panel-mobile">

                    <div class="row">
                        <div class="col-md" style="text-align: center;">
                            <div class="login-logo">
                                <img src="../assets/image/app/Logo.png">
                                <p class="login-logo-desc">The Dora website has bags from a variety of brands. <br> For the convenience of shopping.</p>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md">
                            <div class="login-form">
                                <div style="color:#8966D7;margin:10px auto;font-weight:bold;font-size:18px;">REGISTER A NEW ACCOUNT</div>
                                <form action="#dologin" method="post">
                                    <input type="text" class="form-control login-input" name="txtUserName" placeholder="User Name">
                                    <input type="text" class="form-control login-input" name="txtName" placeholder="Name">
                                    <input type="text" class="form-control login-input" name="txtLName" placeholder="Last Name">
                                    <input type="password" class="form-control login-input" name="txtPassword" placeholder="Password">
                                    <input type="password" class="form-control login-input" name="txtConfirmPassword" placeholder="Confirm Password">
                                    <button class="btn btn-login">Register</button><br>
                                    <hr style="margin-top:50px">
                                    <div style="margin-top:30px; margin-bottom:20px">
                                        <a>Already have an account?</a><router-link to="/login"> Login</router-link>
                                    </div>
                                </form>
                            </div>
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
	name : "register",
	components : {Navbar}
	}
</script>