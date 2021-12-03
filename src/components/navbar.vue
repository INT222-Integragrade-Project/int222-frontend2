<template>

    <ul class="nav-menu">
        
        <!-- left -->
        <li class="nav-menu-item-logo">
            <router-link to="/"><img src="../assets/image/app/Logo.png" style="width: 100%;"></router-link>
        </li>
        <li class="nav-menu-item">
            <router-link to="/product" class="menu-link">PRODUCT</router-link>
        </li>
        
        <li class="nav-menu-item">
            <router-link to="/team" class="menu-link">TEAM</router-link>
        </li>

        <!-- right -->
        <!-- สำหรับ user ที่มีการ login แล้ว -->
        <div v-if="isAdmin">
            <li class="nav-menu-item-right-link margin-right-menu" v-if="displayNone">
                <div class="menu-button" @click="toggleSidebar">
                    <a class="menu-link" style="cursor: pointer;">
                        <span class="material-icons">menu</span>
                    </a>
                </div>
            </li>
        </div>

        <!-- ถ้าเป็น user ทั่วไป -->
        <li class="nav-menu-item-right-link margin-right-menu" v-if="displayShow">
            <router-link to="/myfavorite" class="menu-link">
                <span class="material-icons">favorite_border</span>
            </router-link>
        </li>
        <!-- ถ้าเป็น user ที่มีการ login แล้ว -->
        <li class="nav-menu-item-right-link" v-if="displayNone">
            <router-link to="/myfavorite" class="menu-link">
                <span class="material-icons">favorite_border</span>
            </router-link>
        </li>
        

        <!-- ถ้ามีการ Login แล้ว -->
            <li class="nav-menu-item-right-link" v-if="displayNone">
                <a href="#" class="menu-link dropdown-toggle" data-toggle="dropdown">
                    <span class="material-icons">account_circle</span>
                </a>
                <div class="dropdown-menu dropdown-menu-custom">
                    <label class="login-label-username">
                        {{username}}
                    </label>
                    <router-link to="/profile" class="dropdown-item nav-dropdown-item">Profile</router-link>
                    <button type="button" @click="doLogout" class="dropdown-item nav-dropdown-item">
                        Log out 
                        <span class="material-icons material-icons-logout">logout</span>
                    </button>
                </div>
            </li>
        <!-- ถ้ายังไม่มีการ Login -->
            <li class="nav-menu-item-right-link" style="max-width:105px;" v-if="displayShow"> 
                <router-link to="/login" class="menu-link">
                    <span class="login-label">Login</span>
                    <span class="material-icons">account_circle</span>
                </router-link>
            </li>
        <!--  -->

        <li class="nav-menu-item-right-link menu-responsive">
            <div class="btn-search-panel" @click="toggleSearch">
                <a class="menu-link" href="#search">
                    <span class="material-icons">search</span>
                </a>
            </div>
        </li>

        <li class="nav-menu-item-right">
            <form action="#search" method="get">
                <div class="input-group">
                    <input type="text" class="form-control form-search-custom" id="txtSearch" name="txtSearch" value="">
                    <span class="input-group-append">
                        <button class="btn btn-outline-secondary btn-outline-secondary-custom border-left-0">
                            <i class="bi bi-search"></i>
                        </button>
                    </span>
                </div>
            </form>
        </li>

    </ul>

    <!-- สำหรับ จอเล็กสุด / Zoom 250% -->
    <ul class="nav-menu-mobile">
        <!-- Left -->
        <li class="nav-menu-mobile-item-logo">
            <router-link to="/"><img src="../assets/image/app/Logo.png" style="width: 40%;"></router-link>
        </li>
        <li class="nav-menu-mobile-item">
            <router-link to="/product" class="menu-link">PRODUCT</router-link>
        </li>
        <li class="nav-menu-mobile-item">
            <router-link to="/team" class="menu-link">TEAM</router-link>
        </li>

        <!-- Right -->
        <!-- สำหรับ user ที่มีการ login แล้ว -->
        <div v-if="isAdmin">
            <li class="nav-menu-mobile-right-img margin-right-menu" v-if="displayNone">
                <div class="menu-button-500" @click="toggleSidebar">
                    <a class="menu-link" style="cursor: pointer;">
                        <span class="material-icons">menu</span>
                    </a>
                </div>
            </li>
        </div>
        
        <!-- ถ้าเป็น user ทั่วไป -->
        <li class="nav-menu-mobile-right-img margin-right-menu" v-if="displayShow">
            <router-link to="/myfavorite" class="menu-link">
                <span class="material-icons">favorite_border</span>
            </router-link>
        </li>
        <!-- ถ้าเป็น user ที่มีการ login แล้ว -->
        <li class="nav-menu-mobile-right-img" v-if="displayNone">
            <router-link to="/myfavorite" class="menu-link">
                <span class="material-icons">favorite_border</span>
            </router-link>
        </li>

        <!-- ถ้ามีการ Login แล้ว -->
            <li class="nav-menu-mobile-right-img" v-if="displayNone">
                <a href="#" class="menu-link dropdown-toggle" data-toggle="dropdown">
                    <span class="material-icons">account_circle</span>
                </a>
                <div class="dropdown-menu dropdown-menu-custom">
                    <label class="login-label-username">
                        {{username}}
                    </label>
                    <router-link to="/profile" class="dropdown-item nav-dropdown-item">Profile</router-link>
                    <button type="button" @click="doLogout" class="dropdown-item nav-dropdown-item">
                        Log out 
                        <span class="material-icons material-icons-logout">logout</span>
                    </button>
                </div>
            </li>
        <!-- ถ้ายังไม่มีการ Login -->
            <li class="nav-menu-mobile-right-img" v-if="displayShow" >
                <router-link to="/login" class="menu-link">
                    <span class="material-icons">account_circle</span>
                </router-link>
            </li>
        <!--  -->
        
        <li class="nav-menu-mobile-right-img">
            <div class="btn-search-panel-500" @click="toggleSearch">
                <a class="menu-link" href="#search">
                <span class="material-icons">search</span>
                </a>
            </div>
        </li>
    </ul>

    <!-- Side bar Menu -->
    <div v-if="isAdmin">
    <transition name="slide-fade" mode="in-out">
        <div class="sidebar-menu" v-show="isShowSidebar">
            <div class="row">
                <div class="col-md" style="text-align: right;" >
                    <a href="javascript:void(0)" class="close-sidebar" @click="toggleSidebar"><i class="bi bi-x" style="font-size: 40px;"></i></a>
                </div>
            </div>

            <router-link to="/myproduct">
                <div class="sidebar-icon">
                    <span class="material-icons-round">ballot</span>
                    My Product
                </div>
            </router-link>

            <router-link to="/addproduct">
                <div class="sidebar-icon">
                    <span class="material-icons-round">grid_view</span>
                    Add Product
                </div>
            </router-link>

            <router-link to="/member" v-if="isSuperAdmin">
                <div class="sidebar-icon">
                    <span class="material-icons">people_alt</span>
                    Members
                </div>
            </router-link>
        
        </div>
    </transition>
    </div>

    <!-- Search Panel -->
    <div class="search-panel" :class="{show: isShowSearch}">
        <div class="row">
            <div class="col-md" style="text-align: center;">

                <form action="#search" method="get">
                    <div class="input-group-search">

                        <div class="prefix-search-input">
                            <button class="btn btn-search-custom btn-light">
                                <span class="material-icons material-icons-search material-icons-500">search</span>
                            </button>
                        </div>

                        <input type="text" class="form-control form-search-panel-custom" id="txtSearchPanel" name="txtSearch" placeholder="search" value="" autocomplete="off">

                        <button type="button" class="btn btn-close-custom btn-light close-search" @click="toggleSearch"><i class="bi bi-x" style="font-size: 20px;"></i></button>
                    </div>
                        

                </form>

            </div>
        </div>
    </div>
        
</template>

<script>
    
    export default {
        name : "navbar",
        data() {
            return {
                displayNone: false,
                displayShow: true,
                isShowSidebar: false,
                isShowSearch: false,
                username: '',
                role: '',
                users: [],
                user: '',
                resId: '',
                isAdmin: false,
                isSuperAdmin: false,
            }
        },
        mounted() {
            // ถ้ามีการ Login เข้ามา
            if (localStorage.token) {
                this.username = localStorage.username;
                this.role = localStorage.resRole;
                console.log(this.username)
                console.log(this.role)
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
            }
            if(this.role == "superadmin") {
                this.isSuperAdmin = true;
            }
            if(this.role == "admin" || this.role == "superadmin") {
                this.isAdmin = true;
            }
        },
        methods : {
            doLogout: function() {
                if(confirm("Do you really want to logout?")){
                    localStorage.clear();
                    this.$router.push('product') 
                    window.location.reload()
                }
            },
            toggleSidebar: function(){
                // Sidebar
                this.isShowSidebar = !this.isShowSidebar
            },
            toggleSearch: function(){
                // Search bar on Mobile
                if(this.isShowSearch){
                    this.isShowSearch = false;
                } else {
                    this.isShowSearch = true;
                }
            },
        }
    }

</script>

<style>

    /* width */
	::-webkit-scrollbar {
		width: 10px;
	}

	/* Track */
	::-webkit-scrollbar-track {
		background: #f1f1f1;
        border-radius: 100px;
	}

	/* Handle */
	::-webkit-scrollbar-thumb {
		background: #888;
        border-radius: 100px;
	}

	/* Handle on hover */
	::-webkit-scrollbar-thumb:hover {
		background: #555;
	}

    .nav-menu {
        list-style-type: none;
        max-height: 60px;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #ffffff;
        box-shadow: 0px 0px 5px #6c757d;
    }

    .nav-menu-item {
        float: left;
        text-align: center;
        margin: 15px 20px 20px 20px;
    }

    .nav-menu-item-logo {
        float: left;
        max-width: 110px;
        margin: 10px 40px;
    }

    .nav-menu-item-right {
        float: right;
        min-width: 20%;
        text-align: center;
        margin: 10px 20px 20px 20px;
    }

    .nav-menu-item-right-link {
        float: right;
        max-width: 5%;
        text-align: center;
        max-width: 30px;
        margin: 10px 15px 10px 15px;
        overflow: hidden;
    }

    .margin-right-menu {
        margin-right: 40px;
    }

    .form-search-custom {
        width: 80% !important;
        background-color: #f5f5f5;
        border-radius: 25px;
        border: 1px solid transparent;
        padding: .375rem .5rem .375rem 1.25rem;
    }

    .form-search-custom:focus {
        background-color: #f5f5f5;
        border: 1px solid transparent;
        outline: 0;
        box-shadow: 0 0 0 0 transparent;
    }

    .btn-outline-secondary-custom {
        color: #6c757d;
        background-color: #f5f5f5;
        border: 1px solid transparent;
        border-radius: 25px;
        
    }

    .menu-link {
        display: block;
        font-weight: bold;
        font-size: 20px;
        color: #555555;
        background-color: transparent;
        text-align: center;
        text-decoration: none;
        line-height: 1.5 
    }

    .menu-link:hover {
        display: block;
        color: #818181;
        text-decoration: none;
    }

    .login-label {
        position: relative;
        top: -8px;
        width: 70%;
        padding-right: 10px;
        line-height: 10px;
    }

    .login-label-username {
        padding-left: 1.5rem;
        padding-top: 1.5rem;
        font-size: 1.15vw;
        text-transform:uppercase;
        font-weight: bold;
    }

    .nav-menu-item-right-link .dropdown-toggle::after {
        visibility: hidden;
    }

    .dropdown-menu-custom {
        position: absolute;
        left: -75px !important;
        top: 6px !important;
        width: 300px;
        height: 195px;
        font-size: 20px;
    }

    .nav-dropdown-item {
        font-weight: normal;
    }

    .menu-responsive, .nav-menu-mobile {
        display: none;
    }

    .material-icons {
        font-size: 30px !important;
        line-height: 1.25 !important;
    }

    .material-icons-logout {
        position: relative;
        font-size: 25px !important;
        line-height: 1.25 !important;
        top: 7px;
    }


    /* <!-- สำหรับ Zoom 200% --> */
    @media only screen and (max-width: 1000px) {
        
        .nav-menu-item-right, .login-label {
            display: none;
        }

        .menu-responsive {
            display: block;
        }

        .nav-menu-item-right-link {
            max-width: 30px !important;
        }

        .nav-menu-item-right-link img {
            width: 100% !important;
        }

        .dropdown-menu-custom {
            position: absolute;
            left: -60px !important;
            top: 6px !important;
            width: 300px !important;
            height: 175px !important;
            font-size: 20px;
        }

        .login-label-username {
            padding-left: 1.5rem;
            padding-top: 1.5rem;
            font-size: 2.2vw;
            text-transform:uppercase;
            font-weight: bold;
        }

        .material-icons {
            font-size: 26px !important;
            line-height: 1.25 !important;
        }

    }



    /* <!-- สำหรับ จอเล็กสุด / Zoom 250% --> */
    @media only screen and (max-width: 800px) {
        
        .nav-menu, .login-label {
            display: none;
        }

        .nav-menu-mobile {
            display: block;
        }

        .dropdown-menu-custom {
            position: absolute;
            left: -65px !important;
            top: 6px !important;
            width: 300px !important;
            height: 175px !important;
            font-size: 20px;
        }

        .login-label-username {
            padding-left: 1.5rem;
            padding-top: 1.5rem;
            font-size: 2.25vw;
            text-transform:uppercase;
            font-weight: bold;
        }

        .material-icons {
            font-size: 26px !important;
            line-height: 1.25 !important;
        }

    }

    @media only screen and (max-width: 600px) {
        
        .login-label-username {
            padding-left: 1.5rem;
            padding-top: 1.5rem;
            font-size: 3.1vw;
            text-transform:uppercase;
            font-weight: bold;
        }

    }

    .nav-menu-mobile {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #ffffff;
    }

    .nav-menu-mobile-item-logo {
        text-align: center;
        margin: 15px 40px;
    }

    .nav-menu-mobile-item {
        float: left;
        text-align: center;
        margin: 30px 20px 20px 20px;
    }

    .nav-menu-mobile-right {
        float: right;
        min-width: 20%;
        text-align: center;
        margin: 30px 20px 20px 20px;
    }

    .nav-menu-mobile-right-img {
        float: right;
        max-width: 30px;
        margin: 30px 15px 10px 15px;
    }

    .nav-menu-mobile-right-img .dropdown-toggle::after {
        visibility: hidden;
    }

    .material-icons .material-icons-500 {
        font-size: 26px !important;
        line-height: 1.25 !important;
    }



    /* <!-- สำหรับ Side Bar --> */

    .slide-fade-enter-active, .slide-fade-leave-active {
        transition: all .3s ease-in;
        transform: translateX(400px);
    }
    .slide-fade-enter, .slide-fade-leave-to {
        transform: translateX(400px);
        opacity: 1;
    }

    .sidebar-menu {
        width: 400px;
        height: 100% !important;
        top: 0;
        /* right: -400px; */
        right: 0px;
        overflow: hidden;
        background-color: #ffffff;
        /* box-shadow: 0px 5px 10px grey; */
        position: absolute;
        z-index: 2000;
        transition: all .3s ease-in;
    }

    /* .sidebar-menu.show {
        opacity: 1;
        right: 0px;
        box-shadow: 0px 5px 10px grey;
        transition: all .3s ease-in;
    } */

    .sidebar-menu a {
        text-align: left;
        text-decoration: none;
        font-size: 20px;
        color: #818181;
        display: block;
        padding-left: 40px;
        margin-bottom: 25px;
    }

    .sidebar-menu a i {
        margin-right: 15px;
    }


    .sidebar-menu a:hover {
        color: #555555;
    }

    .close-sidebar {
        margin-right: 20px;
        float: right;
    }



    .sidebar-icon span {
        position: relative;
        top: 4px;
        margin-right: 10px;
    }


    /* <!-- สำหรับ Search Panel --> */
    .search-panel {
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0px;
        overflow: hidden;
        background-color: #ffffff;
        z-index: -1;
        opacity: 0;
        transition: all .4s ease;
    }

    .search-panel.show {
        opacity: 1;
        z-index: 3000;
    }

    .search-panel.show .form-search-panel-custom {
        width: 90% !important;
    }

    .input-group-search {
        position: relative;
        width: 100%;
        float: left;
        text-align: left;
        padding: 10px 20px;
    }

    .prefix-search-input {
        position: absolute;
        display: flex;
        z-index: 3005;
        top: 9px;
        left: 13px;
        padding: 8px;
        align-items: center;
        border-radius: 100px;
        background: transparent;
    }

    .material-icons-search {
        font-size: 20px !important;
    }

    .btn-search-custom {
        background-color: transparent;
        border-radius: 50%;
        border: 0px solid transparent;
    }

    .btn-close-custom {
        margin: 2px 0px 10px 15px;
        background-color: #f5f5f5;
        border-radius: 50%;
        border: 0px solid transparent;
    }

    .form-search-panel-custom {
        width: 0% !important;
        background-color: #f5f5f5;
        border-radius: 25px;
        padding-left: 60px;
        font-size: 1.2rem;
        display: inline;
        transition: width 0.5s;
        border: 1px solid transparent;
    }

    .form-search-panel-custom::placeholder {
        color: #CCCCCC;
    }

    .form-search-panel-custom:focus {
        border: 1px solid transparent;
        background-color: #f5f5f5;
        outline: 0;
        box-shadow: 0 0 0 0 transparent;
    }

    @media only screen and (max-width: 710px) {
        .search-panel.show .form-search-panel-custom {
            width: 85% !important;
        }
    }

</style>

 
