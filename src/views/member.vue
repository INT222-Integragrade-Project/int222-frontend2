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
                            Owners ({{superadmins.length + admins.length}})
                        </a>
                    
                        <div id="collapseOwners" class="collapse show">
                            
                            <table class="table table-hover" style="text-align: center;background-color: #fff;">
                                <tr>
                                    <th style="width:10%;">#</th>
                                    <th style="width:40%;">Name</th>
                                    <th style="width:25%;">Role</th>
                                    <th style="width:25%;">Action</th>
                                </tr>

                                <tr v-for="(superadmin,index) in superadmins" :key="index">
                                    <td>{{index+1}}</td>
                                    <td>{{superadmin.name}}</td>
                                    <td style="text-align: center;">
                                        <select class="form-control form-admin-role" name="txtAdminRole">
                                             <option>Super Admin</option>
                                            <!-- <option value="superadmin">Super Admin</option>
                                            <option value="admin">Admin</option>
                                            <option value="customer">Customer</option> -->
                                        </select>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-danger" @click="deleteAccount(superadmin)">
                                            <span class="material-icons-outlined" style="position:relative;top:7px;line-height: 0px;">
                                                delete_outline
                                            </span>
                                            Delete
                                        </button>
                                    </td>
                                </tr>

                                <tr v-for="(admin,index) in admins" :key="index">
                                    <td>{{index+1+superadmins.length}}</td>
                                    <td>{{admin.name}}</td>
                                    <td style="text-align: center;">
                                        <select v-model="admin.role" class="form-control form-admin-role" name="txtAdminRole" @change="changeRole(admin)"> 
                                            <option :value="role.name" v-for="role in promoterole" :key="role.id">{{role.name}}</option>
                                        </select>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-danger"  @click="deleteAccount(admin)">
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
                            Members and Guests ({{customers.length}})
                        </a>
                    
                        <div id="collapseMember" class="collapse">
                            
                            <table class="table table-hover" style="text-align: center;background-color: #fff;">
                                <tr>
                                    <th style="width:10%;">#</th>
                                    <th style="width:40%;">Name</th>
                                    <th style="width:25%;">Role</th>
                                    <th style="width:25%;">Action</th>
                                </tr>

                                <tr v-for="(customer,index) in customers" :key="index">
                                    <td>{{index+1}}</td>
                                    <td>{{customer.name}}</td>
                                    <td style="text-align:center;">
                                        <select v-model="customer.role" class="form-control form-admin-role" name="txtAdminRole" @change="changeRole(customer)">
                                            <option :value="role.name" v-for="role in promoterole" :key="role.id">{{role.name}}</option>
                                        </select>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-danger" @click="deleteAccount(customer)">
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
        data() {
            return {
                token: '',
                users: [],
                superadmins: [],
                admins: [],
                customers: [],
                promoterole: [{
                    id: 0,
                    name: 'customer'
                    },
                    {
                    id:1,
                    name: 'admin'
                    },
                ],
            }
        },
        mounted(){
        this.create();
        },
        methods : {
            async create() {
                this.token = localStorage.token
                this.users = await this.getusers();
                for(let i = 0 ; i < this.users.length ; i++) {
                    if(this.users[i].role == "superadmin") {
                        this.superadmins.push(this.users[i])
                    }
                    if(this.users[i].role == "admin") {
                        this.admins.push(this.users[i])
                    }
                    if(this.users[i].role == "customer") {
                        this.customers.push(this.users[i])
                    }
                }
            },
            async getusers() {
            try {
                const res = await fetch('https://dorasitkmutt.ddns.net/api/showalluser' , {
                    method: "GET",
                    headers: { "Authorization" : `Bearer ${this.token}`}
                });
                const data = res.json();
                return data;
            }catch(e){
                console.log (e)
            }
            },
            changeRole(user) {
                let changeRole2 = 0;
                for(let i of this.promoterole) {
                    if(i.name == user.role) {
                        changeRole2 = i.id;
                    }
                }
                fetch( `https://dorasitkmutt.ddns.net/api/PromoteRole?idUser=${user.userId}&Role=${changeRole2}` , {
                method: "PUT",
                headers: { "Authorization" : `Bearer ${this.token}`}
                })
                alert('You have changed role');
                location.reload()
            },
            deleteAccount(user) {
                if(user.role == 'superadmin') {
                    alert('You can not delete this account!');
                } else {
                if (confirm("Do you want to delete your account?")) {
                    fetch( `https://dorasitkmutt.ddns.net/api/DeleteUser?idUser=${user.userId}` , {
                        method: "DELETE",
                        headers: { "Authorization" : `Bearer ${this.token}`}
                })
                    alert('You have deleted account');
                    location.reload()
                    }
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