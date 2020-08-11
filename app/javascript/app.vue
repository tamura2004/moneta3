<template>
  <div id="app">
    <div class="container">
      <div class="jumbotron">
        <h1>スクラッチしてください</h1>
        <p>2回まで選ぶことができます</p>
      </div>
      <div class="row mb-4" v-for="row in 2" :key="row">
        <div class="col-3" v-for="col in 4" :key="col">
          <flip
            :selected="selected"
            :row="row"
            :col="col"
            @click="click"
          ></flip>
        </div>
      </div>
    </div>
    <mdialog
      :rank="rank"
      :dialog="dialog"
    ></mdialog>
  </div>
</template>

<script>
import Flip from "./components/flip.vue";
import Mdialog from "./components/mdialog.vue";
export default {
  components: {
    Flip,
    Mdialog,
  },
  data() {
    return {
      selected: false,
      rank: null,
      dialog: true,
    }
  },
  methods: {
    click(rank) {
      this.selected = false;
      setTimeout(() => {this.rank = rank}, 1000);
      setTimeout(() => {this.rank = null}, 2000);
    },
  }
}
</script>

<style scoped>
#app {
  height: 1024px;
  position: relative;
}
</style>
