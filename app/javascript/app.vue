<template>
  <div id="app">
    <div class="container">
      <div class="jumbotron">
        <h1>一つ選んでスクラッチしてください</h1>
        <p>1口座100,000円です</p>
      </div>
      <div class="row mb-4" v-for="row in 2">
        <div class="col-3" v-for="col in 4">
          <flip></flip>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Flip from "./components/flip.vue";
export default {
  components: {
    Flip
  },
}
</script>

<style scoped>
</style>
