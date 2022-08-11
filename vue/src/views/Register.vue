<template>
  <!-- <div id="register" class="text-center">
    <form class="form-register" @submit.prevent="register">
      <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
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
      <input
        type="password"
        id="confirmPassword"
        class="form-control"
        placeholder="Confirm Password"
        v-model="user.confirmPassword"
        required
      />
      <router-link :to="{ name: 'login' }">Have an account?</router-link>
      <button class="btn btn-lg btn-primary btn-block" type="submit">
        Create Account
      </button>
    </form>
  </div> -->
  <div class="row">
        <div class="form-signin w-50 mx-auto mt-5 border border-dark rounded" id="regFormContainer">
          <form id="registerForm " @submit.prevent="register">
            <h1 class="h3 mb-3 fw-normal mx-auto text-center">New User Registration</h1>

            <div class="form-floating">
              <input 
                type="text" 
                class="form-control" 
                id="regUserName" 
                placeholder="Username" 
                v-model="user.username" 
                required
              />
              <label for="regUserName">New Username</label>
            </div>
            <div class="form-floating">
              <input 
                type="password" 
                class="form-control" 
                id="regPassword" 
                placeholder="Password" 
                v-model="user.password" 
                required
              />
              <label for="regPassword">Password</label>
            </div>
            <div class="form-floating">
              <input 
                type="password" 
                class="form-control" 
                id="confirmRegPassword" 
                placeholder="Password" 
                v-model="user.confirmPassword"
                required
              />
              <label for="confirmRegPassword">Confirm Password</label>
            </div>

            <div class="checkbox mb-3">
              <p class="text-center"><router-link :to="{ name: 'login' }">Have an account?</router-link></p>
            </div>
            <div class="d-flex justify-center" >
              <button class=" btn btn-success login-btn mx-auto" type="submit">Create Account</button>
            </div>
            <div class="alert alert-danger" role="alert" v-if="registrationErrors">
              {{ registrationErrorMsg }}
            </div>
            <p class="mt-5 mb-3 text-muted"></p>
          </form>
        </div>

     </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style scoped>
.login-btn{
  background-color: #2a453d !important;
}
</style>