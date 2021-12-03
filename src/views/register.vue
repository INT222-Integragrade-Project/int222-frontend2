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
                                <form @submit.prevent="register">
                                    <input type="text" class="form-control login-input" name="username" placeholder="User Name" v-model="inputusername">
                                    <span v-if="invalid_username" class="validate">Please input username</span>
                                    <input type="text" class="form-control login-input" name="firstname" placeholder="Name" v-model="inputname">
                                    <span v-if="invalid_name" class="validate">Please input name</span>
                                    <input type="text" class="form-control login-input" name="lastname" placeholder="Last Name" v-model="inputlastname">
                                    <span v-if="invalid_lastname" class="validate">Please input lastname</span>
                                    <input type="password" class="form-control login-input" name="password" placeholder="Password" v-model="inputpwd">
                                    <span v-if="invalid_password" class="validate">Please input password</span>
                                    <input type="password" class="form-control login-input" name="confirmpassword" placeholder="Confirm Password" v-model="inputconfirm">
                                    <span v-if="invalid_confirm" class="validate">Please input confirm password</span>
                                    <button type="submit" class="btn btn-login" @click="validating">Register</button><br>
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
                                <form @submit.prevent="register">
                                    <input type="text" class="form-control login-input" name="username" placeholder="User Name" v-model="inputusername">
                                    <span v-if="invalid_username" class="validate">Please input username</span>
                                    <input type="text" class="form-control login-input" name="firstname" placeholder="Name" v-model="inputname">
                                    <span v-if="invalid_name" class="validate">Please input name</span>
                                    <input type="text" class="form-control login-input" name="lastname" placeholder="Last Name" v-model="inputlastname">
                                    <span v-if="invalid_lastname" class="validate">Please input lastname</span>
                                    <input type="password" class="form-control login-input" name="password" placeholder="Password" v-model="inputpwd">
                                    <span v-if="invalid_password" class="validate">Please input password</span>
                                    <input type="password" class="form-control login-input" name="confirmpassword" placeholder="Confirm Password" v-model="inputconfirm">
                                    <span v-if="invalid_confirm" class="validate">Please input confirm password</span>
                                    <button type="submit" class="btn btn-login" @click="validating">Register</button><br>
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
    components : {Navbar},
    data() {
        return {
            inputname: "",
            inputlastname: "",
            inputusername: "",
            inputpwd: "",
            inputconfirm: "",
            invalid_name: false,
            invalid_lastname: false,
            invalid_username: false,
            invalid_password: false,
            invalid_confirm: false,
        }
    },
    methods : {
        validating() {
            this.invalid_name = this.inputname === "" ? true : false;
            this.invalid_lastname = this.inputlastname === "" ? true : false;
            this.invalid_username = this.inputusername === "" ? true : false;
            this.invalid_password = this.inputpwd === "" ? true : false;
            this.invalid_confirm = this.inputconfirm === "" ? true : false;
            setTimeout(() => {
                this.invalid_name = false;
            }, 5000);
            setTimeout(() => {
                this.invalid_lastname = false;
            }, 5000);
            setTimeout(() => {
                this.invalid_username = false;
            }, 5000);
            setTimeout(() => {
                this.invalid_password = false;
            }, 5000);
            setTimeout(() => {
                this.invalid_confirm = false;
            }, 5000);
            if(this.inputpwd !== this.inputconfirm) {
                alert('Confirm password incorrect!!');
            }
        },
        register() {
            if(this.invalid_username == true || this.invalid_name == true || this.invalid_lastname == true || this.invalid_password == true || this.invalid_confirm == true) {
                this.validating();
            } else {
            fetch( `https://dorasitkmutt.ddns.net/api/register/?username=${this.inputusername}&firstname=${this.inputname}&lastname=${this.inputlastname}&password=${this.inputpwd}` , {
                method : "POST" ,
            })
            .then((response => {
                const res = response.json();
                return res;
            }
            ))
            .then(response => {
                if(response === false) {
                    alert("Already have this user");
                }
                if(response === true) {
                    alert("Register success!!");
                    location.reload();
                }
            })
            }
        }
    },
	}
</script>

<style>
.validate {
    color : red;
    margin-top: 0px;
}
</style>
