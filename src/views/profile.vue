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
                                        <label>User Id : USERID</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row justify-content-md-center">
                                <div class="col-md-8">
                                    <div class="input-group" style="margin:10px auto;">
                                        <div class="input-group-prepend input-group-profile">
                                            <span class="input-group-text input-group-text-profile">Username</span>
                                        </div>
                                        <input type="text" class="form-control form-profile" id="txtUsername" name="txtUsername" :value="sessUsername" :disabled="isDisabled">
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row justify-content-md-center">
                                <div class="col-md-8">
                                    <div class="input-group" style="margin:10px auto;">
                                        <div class="input-group-prepend input-group-profile"><span class="input-group-text input-group-text-profile">First Name</span></div>
                                        <input type="text" class="form-control form-profile" id="txtFirstName" name="txtFirstName" :value="sessFirstname" :disabled="isDisabled">
                                    </div>
                                </div>
                            </div>

                            <div class="row justify-content-md-center">
                                <div class="col-md-8">
                                    <div class="input-group" style="margin:10px auto;">
                                        <div class="input-group-prepend input-group-profile"><span class="input-group-text input-group-text-profile">Last Name</span></div>
                                        <input type="text" class="form-control form-profile" id="txtLastName" name="txtLastName" :value="sessLastname" :disabled="isDisabled">
                                    </div>
                                </div>
                            </div>

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
                                    <button class="btn btn-profile-custom" @click="this.submitType = 'update'">Update</button>
                                </div>
                                <div class="col-sm-4 col-sm-4-custom" style="display: inline-block;">
                                    <button type="button" class="btn btn-profile-custom" @click="toggleEdit('cancel')">Cancel</button>
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
                                <label>UserName</label>
                            </div>
                        </div>

                        <div class="row justify-content-md-center">
                            <div class="col-md-8" style="margin-bottom:25px;">
                                <label style="margin-bottom: 0px;">Password</label>
                                <input type="password" class="form-control" id="txtOldPassword" name="txtOldPassword" value="OLDPASSWORD">
                            </div>
                        </div>

                        <div class="row justify-content-md-center">
                            <div class="col-md-8" style="margin-bottom:25px;">
                                <label style="margin-bottom: 0px;">New Password</label>
                                <input type="password" class="form-control" id="txtNewPassword" name="txtNewPassword" value="">
                            </div>
                        </div>

                        <div class="row justify-content-md-center">
                            <div class="col-md-8" style="margin-bottom:25px;">
                                <label style="margin-bottom: 0px;">New Password Confirm</label>
                                <input type="password" class="form-control" id="txtVerifyPassword" name="txtVerifyPassword" value="">
                            </div>
                        </div>

                        <div class="row justify-content-sm-center">
                            <div class="col-sm-4" style="text-align: center;">
                                <button type="button" class="btn btn-profile-password" @click="this.submitType = 'update'">Update</button>
                            </div>
                            <div class="col-sm-4" style="text-align: center;">
                                <button type="button" class="btn btn-profile-password" style="background-color: #FFA5A5;" @click="this.submitType = 'delete'">Delete Account</button>
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
                sessUsername: '',
                isDisabled: true,
                displayNone: false,
                displayShow: true,
                submitType: ""
            }
        },
        mounted() {
            if (localStorage.sessUsername) {
                this.sessUsername = localStorage.sessUsername;
            }
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
            
        },
    }
</script>

<style>

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