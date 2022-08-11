<template>
  <div id="app">
    <!--Added Navigation Component: Jaime-->
    <div id="nav">
      <navigation-bar></navigation-bar>
    </div>
    <router-view />
  </div>
</template>

    <!--Added Navigation Import: Jaime-->
<script>
import NavigationBar from "./components/NavigationBar.vue"
    //Added Navigation Component: Jaime
export default {
  name: "app",
  components: {
    NavigationBar
  }
}
</script>

