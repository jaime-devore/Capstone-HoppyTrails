<!--Created Navigation Component: Jaime -->
<template>
  <div class="row">
    <div id="nav-container"  class="col-md-7 d-flex justify-content-between">
      <nav class="navbar navbar-expand-lg  navbar-light" >
        <div class="container-fluid flex-fill">

          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mb-2 mb-lg-0">
                  <li class="nav-item">
                    <router-link to="/" class="nav-link"  href="#">Home</router-link>
                  </li>
                  <li class="nav-item text-nowrap">
                    <!-- <a class="nav-link" href="#">See All Breweries</a> -->
                    <router-link to="/allbreweries" class="nav-link" >See All Breweries</router-link>
                  </li>
                  <li class="nav-item text-nowrap">
                    <router-link to="/trails" class="nav-link">See All Trails</router-link>
                  </li>
              <li class="nav-item text-nowrap">
                    <a class="nav-link" href="#">Find A Brewery Near You</a>
                  </li>

                </ul>

          </div><!-- end of nav menu-->
              
        </div><!-- end of nav menu container-->
      </nav>
            <div class=" ">
        <router-link to="/" class="">
        <img src="../img/HoppyTrailsLogo.png" alt="logo" class="img-responsive" height="50px">
        </router-link>
      </div>
    </div>

      <div class=" col-md-5 d-grid gap-2 d-md-flex justify-content-md-end align-center pe-5 pt-2">
            
        <div class="dropdown" v-if="loggedIn">  
          <div class="dropdown-toggle" data-bs-toggle="dropdown">
          <img v-bind:src="'https://avatars.dicebear.com/api/bottts/'+$store.state.user.username+'.svg'"
            width="54px" height="54px" alt="avatar" 
            class="border border-dark border-3 rounded-circle p-1 align-bottom"     
          />
          </div>
          <ul class="dropdown-menu">
            <li><h5 class="dropdown-header bg-secondary text-white">{{$store.state.user.username}}</h5></li>
            <li><router-link class="nav-link dd-item dropdown-item" to="/account"  >Account Details</router-link></li>
            <li><router-link class="nav-link dd-item dropdown-item" to="/logout"  >Log Out</router-link></li>
          </ul>
        </div>


        <span class="signInUp" v-else>
        <router-link class="btn text-white bg-HunterGreen rounded-pill me-md-2" to="register" >Sign Up</router-link>
        <router-link class="btn btn-outline-dark rounded-pill" to="login">Log In</router-link>
        </span>
      </div>



  </div><!-- end of root div "row" -->
</template>

<script>
export default {
    name: "navigation-bar",
    data(){
        return{
            awesome: true,
            
        }
    },
    computed: {
        loggedIn(){
          
          if(this.$store.state.token == ""){
            return false;
          }
          return true;
        },
        userName(){
          return this.$store.state.user.username;
        }
    },

}
</script>

<style scoped>
.bg-HunterGreen{
 background-color: #2a453d;
}
.router-link-exact-active{
  font-weight: bold;
  color: #2a453d;
}
 nav li:hover,
 nav li.router-link-active,
 nav li.router-link-exact-active {
   background-color: #F0F0F0;
   cursor: pointer;
   border-radius: 10px;
 }

 .dd-item{
  padding: 4px 16px;
 }
</style>