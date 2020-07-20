<template>
  <div id="app">
    <p>{{ message }}</p>
    <div class="container">
      <b-jumbotron header="BootstrapVue">
      </b-jumbotron>
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
