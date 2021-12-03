<template>

    <div class="profile">

        <navbar></navbar>   

        <div class="container">
            <div class="row">
                <div class="col-md" style="text-align: center;">
                    <b><p class="topic" style="padding-top:2%;">MY PROFILE</p></b>
                </div>
            </div>
            <div class="row">
                <div class="col-md" style="text-align: center;">

                    <div class="my-profile">
                        <!-- action ไปหน้า update profile  -->
                        <!-- <form action="#" method="post"> -->
                            
                            <div class="row">
                                <div class="col-md">
                                    <!-- รูป Account -->
                                    <span class="material-icons-outlined" style="font-size:120px;color:#888888;">account_circle</span>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md">
                                    <div style="text-align: centet;">
                                        <label>User Id : {{userId}}</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row justify-content-md-center">
                                <div class="col-md-8">
                                    <div class="input-group" style="margin:10px auto;">
                                        <div class="input-group-prepend input-group-profile">
                                            <span class="input-group-text input-group-text-profile">Username</span>
                                        </div>
                                        <input v-model="editusername" type="text" class="form-control form-profile" id="txtUsername" name="txtUsername" :disabled="isDisabled">  
                                    </div>
                                </div>
                            </div>
                            <span v-if="invalid_editusername" class="validate">Please input new username</span>
                            
                            <div class="row justify-content-md-center">
                                <div class="col-md-8">
                                    <div class="input-group" style="margin:10px auto;">
                                        <div class="input-group-prepend input-group-profile"><span class="input-group-text input-group-text-profile">First Name</span></div>
                                        <input v-model="editfirstname" type="text" class="form-control form-profile" id="txtFirstName" name="txtFirstName" :disabled="isDisabled">    
                                    </div>
                                </div>
                            </div>
                            <span v-if="invalid_editfirstname" class="validate">Please input new firstname</span>

                            <div class="row justify-content-md-center">
                                <div class="col-md-8">
                                    <div class="input-group" style="margin:10px auto;">
                                        <div class="input-group-prepend input-group-profile"><span class="input-group-text input-group-text-profile">Last Name</span></div>
                                        <input v-model="editlastname" type="text" class="form-control form-profile" id="txtLastName" name="txtLastName" :disabled="isDisabled">
                                    </div>
                                </div>
                            </div>
                            <span v-if="invalid_editlastname" class="validate">Please input new lastname</span>

                            <div class="row" v-if="displayNone">
                                <div class="col-md" style="margin-top: 10px;">
                                    <a href="#" data-toggle="modal" data-target="#changePasswordModal">Change Password</a>
                                </div>
                            </div>

                            <div class="row" v-if="displayShow">
                                <div class="col-md">
                                    <button type="button" class="btn btn-profile-custom" @click="toggleEdit">Edit Profile</button>
                                </div>
                            </div>

                            <div class="row justify-content-sm-center" v-if="displayNone">
                                <div class="col-sm-4 col-sm-4-custom" style="display: inline-block;">
                                    <button type="button" class="btn btn-profile-custom" @click="toggleEdit('cancel')">Cancel</button>
                                </div>
                                <div class="col-sm-4 col-sm-4-custom" style="display: inline-block;">
                                    <button class="btn btn-profile-custom" @click="editProfile">Update</button>
                                </div>

                            </div>

                        <!-- </form> -->

                    </div>
                </div>
            </div>  
        </div>
    
    </div> 

    <div class="modal fade" id="changePasswordModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>

                    <!-- <form action="#updateprofile" method="get"> -->

                        <input type="hidden" name="txtSubmitType" :value="submitType">

                        <div class="row">
                            <div class="col-md" style="margin:30px auto; text-align: center;">
                                <!-- รูป Account -->
                                <span class="material-icons-outlined" style="font-size:120px;color:#888888;">account_circle</span>
                                <br>
                                <label>{{userName}}</label>
                            </div>
                        </div>

                        <div class="row justify-content-md-center">
                            <div class="col-md-8" style="margin-bottom:25px;">
                                <label style="margin-bottom: 0px;">Password</label>
                                <input v-model="oldPwd" type="password" class="form-control" id="txtOldPassword" name="txtOldPassword">
                                <span v-if="invalid_oldPwd" class="validate">Please input old password</span>
                            </div>
                        </div>

                        <div class="row justify-content-md-center">
                            <div class="col-md-8" style="margin-bottom:25px;">
                                <label style="margin-bottom: 0px;">New Password</label>
                                <input v-model="newPwd" type="password" class="form-control" id="txtNewPassword" name="txtNewPassword">
                                <span v-if="invalid_newPwd" class="validate">Please input new password</span>
                            </div>
                        </div>

                        <div class="row justify-content-md-center">
                            <div class="col-md-8" style="margin-bottom:25px;">
                                <label style="margin-bottom: 0px;">New Password Confirm</label>
                                <input v-model="confirmnewPwd" type="password" class="form-control" id="txtVerifyPassword" name="txtVerifyPassword">
                                <span v-if="invalid_confirmnewPwd" class="validate">Please input new password confirm</span>
                            </div>
                        </div>

                        <div class="row justify-content-sm-center">
                            <div class="col-sm-4" style="text-align: center;">
                                <button type="button" class="btn btn-profile-password" style="background-color: #FFA5A5;" @click="deleteAccount">Delete Account</button>
                            </div>
                            <div class="col-sm-4" style="text-align: center;">
                                <button type="button" class="btn btn-profile-password" @click="changePwd">Update</button>
                            </div>

                        </div>
                        
                    <!-- </form> -->
                </div>
            </div>
        </div>
    </div>
    
</template>

<script>
    import Navbar from "../components/navbar.vue"
    export default {
        name : "profile",
        components : {Navbar},
        data() {
            return{
                token: '',
                userId: 0,
                userName:'',

                editusername: '',
                editfirstname: '',
                editlastname: '',
                editprofile: '',
                oldPwd:'',
                newPwd:'',
                confirmnewPwd:'',  
                
                invalid_editusername: false,
                invalid_editfirstname: false,
                invalid_editlastname: false,
                
                invalid_oldPwd: false,
                invalid_newPwd: false,
                invalid_confirmnewPwd: false,

                isDisabled: true,
                displayNone: false,
                displayShow: true,
                submitType: ""
            }
        },
        mounted() {
            if (localStorage.username) {
                this.username = localStorage.username;
                this.userId = localStorage.resId;
            }   
            this.create()
        },
        methods : {
            toggleEdit: function() {
                
                if(this.isDisabled){
                    this.isDisabled = false;
                } else {
                    this.isDisabled = true;
                }

                if(this.displayNone){
                    this.displayNone = false;
                } else {
                    this.displayNone = true;
                }

                if(this.displayShow){
                    this.displayShow = false;
                } else {
                    this.displayShow = true;
                }
            },
            async getUser() {
                try {
                const res = await fetch(`https://dorasitkmutt.ddns.net/api/${this.userId}/showuser` , {
                    method: "GET"  ,
                    headers: { "Authorization" : `Bearer ${this.token}`}
                    })
                const data = res.json();
                console.log(data)
                return data;
            }catch(e){
                console.log (e)
            }
            },
            profileValidating() {
            this.invalid_editusername = this.editusername === "" ? true : false;
            this.invalid_editfirstname = this.editfirstname === "" ? true : false;
            this.invalid_editlastname = this.editlastname === "" ? true : false;
            setTimeout(() => {
                this.invalid_editusername = false;
            }, 3000);
            setTimeout(() => {
                this.invalid_editfirstname = false;
            }, 3000);
            setTimeout(() => {
                this.invalid_editlastname = false;
            }, 3000);
            },
            pwdValidating() {
            this.invalid_oldPwd = this.oldPwd === "" ? true : false;
            this.invalid_newPwd = this.newPwd === "" ? true : false;
            this.invalid_confirmnewPwd = this.confirmnewPwd === "" ? true : false;
            setTimeout(() => {
                this.invalid_oldPwd = false;
            }, 3000);
            setTimeout(() => {
                this.invalid_newPwd = false;
            }, 3000);
            setTimeout(() => {
                this.invalid_confirmnewPwd = false;
            }, 3000);
            if(this.newPwd != this.confirmnewPwd) {
                alert('Confirm new password incorrect!!');
            }
            },
            editProfile() {
                this.profileValidating();
                if(this.invalid_editusername == true || this.invalid_editfirstname == true || this.invalid_editlastname == true) {
                    return
                } else {
                    this.editprofile = `username=${this.editusername}&name=${this.editfirstname}&lastname=${this.editlastname}`;
                    fetch( `https://dorasitkmutt.ddns.net/api/${this.userId}/editProfile?${this.editprofile}` , {
                    method: "PUT",
                    headers: { "Authorization" : `Bearer ${this.token}`}
                    })
                    alert('You have been edit profile');
                    console.log("Edit Profile!")
                }
            },
            changePwd(){
                this.pwdValidating();
                if(this.invalid_oldPwd == true || this.invalid_newPwd == true || this.invalid_confirmnewPwd == true) {
                    return
                } else {
                    fetch( `https://dorasitkmutt.ddns.net/api/${this.userId}/profile/ChangePWD?newPassword=${this.newPwd}&oldPassword=${this.oldPwd}` , {
                    method: "PUT",
                    headers: { "Authorization" : `Bearer ${this.token}`}
                    })

                    .then((response => {
                        const res = response.json();
                        return res;
                        }
                    ))
                    .then(response => {
                        console.log(response)
                        if(response == false) {
                            alert("Your current password is incorrect!");
                        } else {
                        alert('You have been change password');
                        console.log("Change Password!")
                        }
                    })
                }
            },
            deleteAccount() {
                // console.log(this.user.role)
                if(this.user.role == 'superadmin') {
                    alert('You can not delete this account!');
                } else {
                if (confirm("Do you want to delete your account?")) {
                    fetch( `https://dorasitkmutt.ddns.net/api/DeleteUser?idUser=${this.userId}` , {
                        method: "DELETE",
                        headers: { "Authorization" : `Bearer ${this.token}`}
                })
                    alert('You have deleted your account');
                    localStorage.clear();
                    location.reload();
                    console.log(" Delete Account!")
                    }
                }
            },
            async create() {
                this.token = localStorage.token
                this.user = await this.getUser();
                // console.log(this.user)
                this.userName = this.user.userName;
                this.editusername = this.user.userName;
                this.editfirstname = this.user.name;
                this.editlastname = this.user.lastName;
            }
            
        },
    }
</script>

<style>
    .validate {
    color : red;
    margin-top: 0px;
    }

    .my-profile {
        background-color: #ffffff;
        max-width: 675px;
        margin: 2% auto;
        padding: 40px;
        border: 15px solid #F2F2F2;
        border-radius: 10px;
    }

    .input-group-profile {
        max-width: 100px;
    }

    .input-group-text-profile {
        background-color: #C7BBE2;
        color: #2a2a2a;
        border-radius: 20px;
    }

    .form-profile {
        border-radius: 20px;
    }

    .btn-profile-custom {
        background-color: #C7BBE2;
        margin-top: 30px;
        border-radius: 10px;
        color: #2a2a2a;
        min-width: 120px;
        padding: .325rem .75rem;
    }

    .btn-profile-custom:hover {
        background-color: #b1a2d7;
    }

    .btn-profile-password {
        background-color: #C7BBE2;
        margin-top: 50px;
        margin-bottom: 50px;
        border-radius: 10px;
        color: #2a2a2a;
        min-width: 120px;
        padding: .325rem .75rem;
    }


    @media (min-width: 500px){
        
        .col-sm-4-custom {
            -ms-flex: 0 0 33.333333%;
            flex: 0 0 33.333333%;
            max-width: 33.333333%;
        }
    }
    

</style>