<template>
  <div class="home">
    
    <div id="nav-container"  class="container-fluid">
      <nav class="navbar navbar-expand-lg d-flex  justify-content-around ">
        <div class="container-fluid flex-fill">

          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                  </li>
                  <li class="nav-item">
                    <!-- <a class="nav-link" href="#">See All Breweries</a> -->
                    <router-link to="allbreweries" class="nav-link" >See All Breweries</router-link>
                  </li>

              <li class="nav-item">
                    <a class="nav-link" href="#">Find A Brewery Near You</a>
                  </li>

                </ul>

        </div><!-- end of nav menu-->
              <div class="flex-fill ">
                <img src="../img/TrailHops-Minimal-logo.png" alt="logo" class="img-responsive" height="50px">
              </div>
              <div class="d-grid gap-2 d-md-flex justify-content-md-end" 
                v-if="auth">
                <router-link class="btn btn-success rounded-pill me-md-2" to="register" >Sign Up</router-link>
                <router-link 
                class="btn btn-outline-dark rounded-pill" 
                to="login"
                >Log In</router-link>
              </div>
      </div><!-- end of nav menu container-->
    </nav>
    </div>
<div class="container-fluid bgpic">
   <div id="cards-div" class="container-fluid">
     <div class="row pt-5">
       <div class="col-sm-6">
         <div class="card border border-secondary">
           <div class="card-header  bg-success text-white ">
             <h5 class="card-title">Family Friendly</h5>
           </div>
           <div class="card-body">
             <ul class="list-group list-group-flush">
               <li class="list-group-item">
                 Brewery 1
                 <span class="mx-auto">Street Address</span>
                 <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-half"></i>
                 <i class="bi bi-star"></i>
                   </span>
               </li>
               <li class="list-group-item">Brewery 2
                 <span class="mx-auto">Street Address</span>
                 <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-half"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
               <li class="list-group-item">Brewery 3
                 <span class="mx-auto">Street Address</span>
                 <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-half"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
               <li class="list-group-item">Brewery 4
                 <span class="mx-auto">Street Address</span>
                 <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-half"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             </ul>
<!--             <a href="#" class="btn btn-success">Go somewhere</a>-->
           </div>
         </div>
       </div>
       <div class="col-sm-6">
         <div class="card border border-secondary">
           <div class="card-header  bg-success text-white ">
              <h5 class="card-title">Pet Friendly</h5>
             </div>
           <div class="card-body">
             <ul class="list-group list-group-flush">
             <li class="list-group-item">
               Brewery 1
               <span class="mx-auto">Street Address</span>
               <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-half"></i>
                 <i class="bi bi-star"></i>
                   </span>
             </li>
             <li class="list-group-item">Brewery 2
               <span class="mx-auto">Street Address</span>
               <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-half"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             <li class="list-group-item">Brewery 3
               <span class="mx-auto">Street Address</span>
               <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-half"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             <li class="list-group-item">Brewery 4
               <span class="mx-auto">Street Address</span>
               <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-half"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             </ul>
           </div>
         </div>
       </div>
     </div>

     <div class="row pt-5">
       <div class="col-sm-6">
         <div class="card border border-secondary">
           <div class="card-header  bg-success text-white ">
             <h5 class="card-title">Patios</h5>
           </div>
           <div class="card-body">
             <ul class="list-group list-group-flush">
             <li class="list-group-item">
               Brewery 1
               <span class="mx-auto">Street Address</span>
               <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-half"></i>
                 <i class="bi bi-star"></i>
                   </span>
             </li>
             <li class="list-group-item">Brewery 2
               <span class="mx-auto">Street Address</span>
               <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star"></i>
                 <i class="bi bi-star"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             <li class="list-group-item">Brewery 3
               <span class="mx-auto">Street Address</span>
               <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             <li class="list-group-item">Brewery 4
               <span class="mx-auto">Street Address</span>
               <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             </ul>
           </div>
         </div>
       </div>
       <div class="col-sm-6">
         <div class="card border border-secondary">
           <div class="card-header  bg-success text-white ">
             <h5 class="card-title">Budget</h5>
           </div>
           <div class="card-body">
             <ul class="list-group list-group-flush">
             <li class="list-group-item">
               Brewery 1
               <span class="mx-auto">Street Address</span>
               <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star"></i>
                 <i class="bi bi-star"></i>
                   </span>
             </li>
             <li class="list-group-item">Brewery 2
               <span class="mx-auto">Street Address</span>
               <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star"></i>
                 <i class="bi bi-star"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             <li class="list-group-item">Brewery 3
               <span class="mx-auto">Street Address</span>
               <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             <li class="list-group-item">Brewery 4
               <span class="mx-auto">Street Address</span>
               <span class="text-warning text-end">
                 <i class="bi bi-star-fill"></i>
                 <i class="bi bi-star"></i>
                 <i class="bi bi-star"></i>
                 <i class="bi bi-star"></i>
                 <i class="bi bi-star"></i>
                   </span></li>
             </ul>
           </div>
         </div>
       </div>
     </div>
   </div>
   </div><!-- end of cards container -->




  </div>
</template>

<script>
export default {
  name: "home",
  data(){
    return {
      auth: false,

}
  },
  methods: {
  say(message) {
    alert(message)
  }
}
};
</script>

<style scoped>
#title-div{
  left: 25%;
  top: 30%;
}
.bgpic{
  background-image: url('../img/AleSmith-Tasting-Room.jpg');
  height: 100vh;
  background-position: center; /* Center the image */
  background-repeat: no-repeat; /* Do not repeat the image */
  background-size: cover; /* Resize the background image to cover the entire container */
}
</style>