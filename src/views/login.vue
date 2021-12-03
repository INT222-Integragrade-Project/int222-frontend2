<template>
<div id="login">
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
                        <div class="login-form">
                            <form @submit.prevent="doLogin">
                                <input type="text" class="form-control login-input" v-model="username" name="txtUserName" placeholder="User Name">
                                <span v-if="invalid_username" class="validate">Please input your username</span>
                                <input type="password" class="form-control login-input" v-model="password" name="txtPassword" placeholder="Password">
                                <span v-if="invalid_password" class="validate">Please input your password</span>
                                <button type="submit" class="btn btn-login">Log In</button><br>
                            </form>
                            <hr style="margin-top:50px">
                            <div style="margin-top:30px; margin-bottom:20px">
                                <a>Don’t have an account?</a><router-link to="/register"> Register</router-link>
                            </div>
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
                        <div class="login-form ">
                            <!-- action ไปหน้าที่เข้าสู่ระบบ -->
                            <form @submit.prevent="doLogin">
                                <input type="text" class="form-control login-input" v-model="username" name="txtUserName" placeholder="User Name">
                                <span v-if="invalid_username" class="validate">Please input your username</span>
                                <input type="password" class="form-control login-input" v-model="password" name="txtPassword" placeholder="Password">
                                <span v-if="invalid_password" class="validate">Please input your password</span>
                                <button type="submit" class="btn btn-login">Log In</button><br>
                            </form>
                            <hr style="margin-top:50px">
                            <div style="margin-top:30px; margin-bottom:20px">
                                <a>Don’t have an account?</a><router-link to="/register"> Register</router-link>
                            </div>
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
        name : "login",
        components : {Navbar},
        data() {
            return {
                username: '',
                password: '',
                invalid_username: false,
                invalid_password: false,
            }
        },
        methods : {
            async doLogin() {
                this.validating();
                console.log(this.invalid_username)
                if(this.invalid_username == true || this.invalid_password == true) {
                    return
                } else {
                fetch( `https://dorasitkmutt.ddns.net/api/authenticate` , {
                    method: "POST",
                    headers: { "content-Type": "application/json" },
                    body: JSON.stringify({
                        username: this.username,
                        password: this.password
                        })
                    })
                    
                    .then((response => {
                        const res = response.json();
                        return res;
                        }
                    ))
                    .then(response => {
                    if(!response.token) {
                        alert("Your username or password is incorrect! Please try again")
                    } else {
                        localStorage.setItem("token", response.token);
                        localStorage.setItem("resRole", response.role);
                        localStorage.setItem("resId", response.userId);
                        this.$router.push('product')
                    }
                })
                }
            },
            validating() {
            this.invalid_username = this.username === "" ? true : false;
            this.invalid_password = this.password === "" ? true : false;
            setTimeout(() => {
                this.invalid_username = false;
            }, 3000);
            setTimeout(() => {
                this.invalid_password = false;
            }, 3000);
            },
        }
	}
</script>


<style>
    .validate {
    color : red;
    margin-top: 0px;
    }

    .bg-login {
        font-family: Kanit;
        background-image: url("../assets/image/app/BG.jpg");
        background-repeat: no-repeat; 
        background-attachment: fixed;
        background-position: center;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        overflow-x: hidden;
        min-height: 100vh;
    }

    .login-logo {
        margin: 15% 0% 15% 30%;
        max-width: 600px;
    }

    .login-logo-desc {
        margin: 12% auto;
        position: relative;
        top: 0px;
        left: 30px;
        font-size: 22px;
        text-align: left;
    }

    .login-form {
        margin: 15% auto;
        text-align: center;
        background-color: white;
        width: 50%;
        border-radius: 8px;
        padding: 15px;
        border: 1px solid #DDDFE2;
    }

    .login-input {
        margin-bottom:15px;
    }

    .btn-login {
        width: 100%;
        background-color: #C7BBE2;
    }

    #login-panel-mobile {
        display: none;
    }


    @media only screen and (max-width: 1600px) {
        
        .login-logo {
            /* margin: 25% auto; */
            margin: 25% 0% 25% 30%;
        }

        .login-logo-desc {
            font-size: 17px;
            left: 20px;
        }
        
        .login-form {
            margin: 18% auto;
            width: 60%;
        }

    }

    @media only screen and (max-width: 1200px) {
        
        #login-panel {
            display: none;
        }

        #login-panel-mobile {
            display: block;
        }

        .login-logo {
            /* margin: 10% auto; */
            margin: 10% auto 10% auto;
        }

        .login-logo img{
            width: 40%;
            min-width: 300px;
        }

        .login-logo-desc {
            font-size: 17px;
            left: 100px;
            margin: 2% auto;
        }

        .login-form {
            margin: -5% auto;
            width: 40%;
        }

    }

    @media only screen and (max-width: 950px) {
        
        .login-form {
            margin: -5% auto;
            width: 50%; 
        }
        
    }

    @media only screen and (max-width: 700px) {

        .login-form {
            margin: -5% auto;
            width: 60%; 
        }
    }

    @media only screen and (max-width: 500px) {
        
        .login-logo-desc {
            margin: 0% auto;
            font-size: 14px;
        }

        .login-form {
            margin: 0% auto;
            width: 75%; 
        }
    }
</style>
