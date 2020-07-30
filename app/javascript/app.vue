<template>
  <div id="app">
    <div class="container">
      <div class="jumbotron">
        <h1>一つ選んでスクラッチしてください</h1>
        <p>1口座100,000円です</p>
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
      @click="close"
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
      this.selected = true;
      setTimeout(() => {this.rank = rank}, 1000);
      setTimeout(this.close, 2000);
    },
    close() {
      this.dialog = false;
    }
  }
}
</script>

<style scoped>
#app {
  height: 1024px;
  position: relative;
}
</style>
