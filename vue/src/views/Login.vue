<template>
 
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
          v-on:click="clearErrorMsg()"
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
          v-on:click="clearErrorMsg()"
          required
      />
      <label for="floatingPassword">Password</label>
    </div>
    <div class="container border border-danger text-danger " v-if="errorMsg">
      <span class=""><i class="bi bi-exclamation-triangle-fill"></i></span>
      <span class="text">Username or Password Incorrect</span>

      </div>

    <div class="checkbox mb-3">
      <p class="text-center"><router-link :to="{ name: 'register' }">Need an account?</router-link></p>
    </div>
    <div class="d-flex justify-center" >
      <button class=" btn btn-success login-btn mx-auto" type="submit">Sign in</button>
    </div>
    
    <p class="mt-5 mb-3 text-muted"></p>
  </form>
  <footer class="footer">
        <p>© BrewHaHa LLC, 2022</p>
      </footer>
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
      errorMsg: false,
    };
  },
  methods: {
    clearErrorMsg(){
      this.errorMsg = false;
    },
    
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
            this.errorMsg = true;
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
.footer{
    text-align: center;
padding-top: 10px;
}
</style>