<template>
  <!-- <div id="login" class="container mx-auto">

    <div class="card border-dark mb-3 mt-5 mx-auto w-50" >
      <div class="card-header"><h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1></div>
        <div class="card-body text-dark">

        <form class="form-signin" @submit.prevent="login">
          
          <div
            class="alert alert-danger"
            role="alert"
            v-if="invalidCredentials"
          >Invalid username and password!</div>
          <div
            class="alert alert-success"
            role="alert"
            v-if="this.$route.query.registration"
          >Thank you for registering, please sign in.</div>
          <label for="username" class="sr-only">Username</label>
          <input
            type="text"
            id="username"
            class="form-control"
            placeholder="Username"
            v-model="user.username"
            required
            autofocus
          />
          <label for="password" class="sr-only">Password</label>
          <input
            type="password"
            id="password"
            class="form-control"
            placeholder="Password"
            v-model="user.password"
            required
          />

          <div class="row mb-3">
            <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
            <div class="col-sm-10">
              <input type="password" class="form-control" id="inputPassword3">
            </div>
          </div>
          
          <button type="submit">Sign in</button>
          <router-link :to="{ name: 'register' }">Need an account?</router-link>
        </form>

        
      </div>  
    </div>  
  </div> -->
      <div class="row">

<!-- 
    ||****************************************************||
    ||*********   LOGIN   ********************************||
    ||****************************************************||
-->
<div class="form-signin w-50 mx-auto mt-5 border border-dark rounded " id="formContainer">
  <form id="loginForm" @submit.prevent="login">
    <h1 class="h3 mb-3 fw-normal mx-auto text-center">Please sign in</h1>

    <div class="form-floating">
      <input 
          type="text" 
          class="form-control" 
          id="floatingInput" 
          placeholder="Username" 
          v-model="user.username"
          required
        />
      <label for="floatingInput">Username</label>
    </div>
    <div class="form-floating mt-2">
      <input 
          type="password" 
          class="form-control" 
          id="floatingPassword" 
          placeholder="Password" 
          v-model="user.password"
          required
      />
      <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox mb-3">
      <p class="text-center"><router-link :to="{ name: 'register' }">Need an account?</router-link></p>
    </div>
    <div class="d-flex justify-center" >
      <button class=" btn btn-success login-btn mx-auto" type="submit">Sign in</button>
    </div>
    <div class="mt-2 ps-2 border border-danger rounded text-danger mx-auto text-center w-75" id="messages" v-show="invalidCredentials">
      <i class="bi bi-exclamation-triangle-fill me-2"></i>
      {{errorMsg}}</div>
    <p class="mt-5 mb-3 text-muted"></p>
  </form>
</div>

</div><!--end of LOGIN row-->
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false,
      errorMsg: "",
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;
            
          if (response.status === 401) {
            this.invalidCredentials = true;
            this.errorMsg = 'Username or Password Incorrect';
          }
        });
    }
  }
};
</script>
<style scoped>
.login-btn{
  background-color: #2a453d !important;
}
.field:invalid {
    border-color:#f00;
}
</style>