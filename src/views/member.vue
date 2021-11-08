<template>

    <div class="member">

        <navbar></navbar>

        <div class="container">
            
            <div class="row">
                <div class="col-sm" style="text-align: center;">
                    <b><p class="topic" style="padding-top:2%;">MEMBERS</p></b>
                </div>
            </div>

            <div class="memberContent">

                <div class="row">
                    <div class="col-md-3">
                        <div class="input-group">
                            <input type="text" class="form-control" name="txtSearchMember" placeholder="search" value="" autocomplete="off">
                            <div class="input-group-append">
                                <i class="bi bi-search" style="position:relative;font-size: 1rem;color: #ccc;left: -25px;top:7px;"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md" style="margin-top: 2em;">

                        <!-- Owner Content -->
                        <a href="#" class="link-custom" data-toggle="collapse" data-target="#collapseOwners" aria-expanded="true">
                            <span class="material-icons-outlined" style="position:relative;top:7px;">
                                arrow_drop_down
                            </span>
                            Owners (99)
                        </a>
                    
                        <div id="collapseOwners" class="collapse show">
                            
                            <table class="table table-hover" style="text-align: center;background-color: #fff;">
                                <tr>
                                    <th style="width:10%;">#</th>
                                    <th style="width:40%;">Name</th>
                                    <th style="width:25%;">Role</th>
                                    <th style="width:25%;">Action</th>
                                </tr>

                                <tr>
                                    <td>1</td>
                                    <td>OLARN</td>
                                    <td style="text-align: center;">
                                        <select class="form-control form-admin-role" name="txtAdminRole" @change="confirmChange"> 
                                            <option value="superadmin" selected>Super Admin</option>
                                            <option value="admin">Admin</option>
                                            <option value="customer">Customer</option>
                                        </select>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-danger" @click="confirmDelete">
                                            <span class="material-icons-outlined" style="position:relative;top:7px;line-height: 0px;">
                                                delete_outline
                                            </span>
                                            Delete
                                        </button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>2</td>
                                    <td>Umaporn</td>
                                    <td style="text-align: center;">
                                        <select class="form-control form-admin-role" name="txtAdminRole" @change="confirmChange"> 
                                            <option value="superadmin">Super Admin</option>
                                            <option value="admin" selected>Admin</option>
                                            <option value="customer">Customer</option>
                                        </select>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-danger" @click="confirmDelete">
                                            <span class="material-icons-outlined" style="position:relative;top:7px;line-height: 0px;">
                                                delete_outline
                                            </span>
                                            Delete
                                        </button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>3</td>
                                    <td>Noppadon</td>
                                    <td style="text-align: center;">
                                        <select class="form-control form-admin-role" name="txtAdminRole" @change="confirmChange"> 
                                            <option value="superadmin">Super Admin</option>
                                            <option value="admin" selected>Admin</option>
                                            <option value="customer">Customer</option>
                                        </select>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-danger" @click="confirmDelete">
                                            <span class="material-icons-outlined" style="position:relative;top:7px;line-height: 0px;">
                                                delete_outline
                                            </span>
                                            Delete
                                        </button>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <br>

                        <!-- Member & Guests Content -->
                        <a href="#" class="link-custom" data-toggle="collapse" data-target="#collapseMember" aria-expanded="true">
                            <span class="material-icons-outlined" style="position:relative;top:7px;">
                                arrow_drop_down
                            </span>
                            Members and Guests (9)
                        </a>
                    
                        <div id="collapseMember" class="collapse">
                            
                            <table class="table table-hover" style="text-align: center;background-color: #fff;">
                                <tr>
                                    <th style="width:10%;">#</th>
                                    <th style="width:40%;">Name</th>
                                    <th style="width:25%;">Role</th>
                                    <th style="width:25%;">Action</th>
                                </tr>

                                <tr>
                                    <td>1</td>
                                    <td>Member01</td>
                                    <td style="text-align:center;">
                                        <select class="form-control form-admin-role" name="txtAdminRole" @change="confirmChange"> 
                                            <option value="superadmin">Super Admin</option>
                                            <option value="admin" selected>Admin</option>
                                            <option value="customer">Customer</option>
                                        </select>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-danger" @click="confirmDelete">
                                            <span class="material-icons-outlined" style="position:relative;top:7px;line-height: 0px;">
                                                delete_outline
                                            </span>
                                            Delete
                                        </button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>2</td>
                                    <td>Member02</td>
                                    <td style="text-align:center;">
                                        <select class="form-control form-admin-role" name="txtAdminRole" @change="confirmChange"> 
                                            <option value="superadmin">Super Admin</option>
                                            <option value="admin" selected>Admin</option>
                                            <option value="customer">Customer</option>
                                        </select>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-danger" @click="confirmDelete">
                                            <span class="material-icons-outlined" style="position:relative;top:7px;line-height: 0px;">
                                                delete_outline
                                            </span>
                                            Delete
                                        </button>
                                    </td>
                                </tr>

                                <tr>
                                    <td>3</td>
                                    <td>Member03</td>
                                    <td style="text-align:center;">
                                        <select class="form-control form-admin-role" name="txtAdminRole" @change="confirmChange"> 
                                            <option value="superadmin">Super Admin</option>
                                            <option value="admin" selected>Admin</option>
                                            <option value="customer">Customer</option>
                                        </select>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-danger" @click="confirmDelete">
                                            <span class="material-icons-outlined" style="position:relative;top:7px;line-height: 0px;">
                                                delete_outline
                                            </span>
                                            Delete
                                        </button>
                                    </td>
                                </tr>
                            </table>

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
        name : "member",
        components : {Navbar},
        props: {
            idforedit: {
                type: String,
                required: true,
            },
        },
        data() {
            return {
                user: [],
                // username: '',
                // password: '',
                // username_mb: '',
                // password_mb: '',
                // test_user: 'admin',
                // test_password: 'admin',
            }
        },
        mounted(){
        this.create();
        console.log(this.idforedit)
        },
        methods : {
            async create() {
                this.user = await this.getuser();
                console.log(this.user);
            },
            async getuser() {
            try {
                const res = await fetch('http://13.76.46.188:3000/showuser');
                const data = res.json();
                return data;
            }catch(e){
                console.log (e)
            }
            },
            confirmChange: function(){
                if(confirm("ต้องการเปลี่ยน Role หรือไม่")){
                    alert("เปลี่ยนแล้วจ้าา");
                }
            },
            confirmDelete: function(){
                if(confirm("ต้องการลบบัญชีนี้จริงๆหรือเนี่ยยย ?")){
                    alert("ลบเลยจ้าา");
                }
            },
        }
    }

</script>

<style>

    .memberContent {
        min-height: 600px;
        background-color: #f3f3f3;
        padding: 3em;
        text-align: left;
    }

    .form-admin-role {
        display: inline;
        width: initial;
        border: 1px solid transparent;
        background-color: transparent;
        appearance: none;
        text-align-last: center;
    }  
    
    .form-admin-role:focus {
        border: 1px solid transparent;
        background-color: transparent;
        box-shadow: 0px 0px 0px transparent;
    }   

    .table-hover > tr:hover {
        color: #212529;
        background-color: rgba(0,0,0,.075);
    }

</style>