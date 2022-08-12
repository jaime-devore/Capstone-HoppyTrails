<!--Created Navigation Component: Jaime -->
<template>
  <div>
    <div id="nav-container"  class="container-fluid">
      <nav class="navbar navbar-expand-lg d-flex  justify-content-around ">
        <div class="container-fluid flex-fill">

          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mb-2 mb-lg-0">
                  <li class="nav-item">
                    <router-link to="/" class="nav-link active" aria-current="page" href="#">Home</router-link>
                  </li>
                  <li class="nav-item">
                    <!-- <a class="nav-link" href="#">See All Breweries</a> -->
                    <router-link to="allbreweries" class="nav-link" >See All Breweries</router-link>
                  </li>
                  <li class="nav-item">
                    <router-link to="trails" class="nav-link">See All Trails</router-link>
                  </li>
              <li class="nav-item">
                    <a class="nav-link" href="#">Find A Brewery Near You</a>
                  </li>

                </ul>

        </div><!-- end of nav menu-->
              <div class="flex-fill ">
                <img src="../img/HoppyTrailsLogo.png" alt="logo" class="img-responsive" height="50px">
              </div>
              <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <router-link class="btn btn-success rounded-pill me-md-2" to="register" >Sign Up</router-link>
                <router-link class="btn btn-outline-dark rounded-pill" to="login">Log In</router-link>
              </div>
      </div><!-- end of nav menu container-->
    </nav>
    </div>
  </div>
</template>

<script>
export default {
    name: "navigation-bar"

}
</script>

<style>

</style>