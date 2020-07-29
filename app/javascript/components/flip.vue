<template>
  <div @click="click" class="h-100">
    <transition name="flip" mode="out-in">
      
      <div class="card h-100 text-center" key="front" v-if="front">
        <div class="card-body">
          <h2 class="card-title">{{rank}}等</h2>
          <p class="card-text">{{money}}円</p>
          <a :href="`/lotteries/${rank}`" class="btn btn-primary btn-sm btn-block">賞金を受取る</a>
        </div>
      </div>

      <div class="card h-100" key="back" v-else>
        <img src="/takarakuji.png" alt="kuji" class="card-img-top">
        <div class="card-body">
          <button class="btn btn-primary btn-sm btn-block" :class="{disabled: selected}">選ぶ</button>
        </div>
      </div>

    </transition>
  </div>
</template>

<script>
export default {
  props: ["selected"],
  data() {
    return {
      front: false,
      rank: null,
      money: null,
    }
  },
  methods: {
    click() {
      if (!this.selected && !this.front) {
        const MAX = 8;
        this.rank = MAX - Math.floor(Math.random() * Math.random() * MAX);
        this.money = Math.pow(10, MAX + 2 - this.rank);
        if (100000000 <= this.money) this.money = `${this.money / 100000000}億`
        if (10000 <= this.money) this.money = `${this.money / 10000}万`
        this.front = !this.front;
      }
      this.$emit("click", this.rank);
    }
  }
}
</script>

<style scoped>
.flip-enter-active, .flip-leave-active {
  transition: 0.3s;
}
.flip-enter {
  transform: perspective(400px) rotateY(-90deg);
}
.flip-enter-to {
  transform: perspective(400px) rotateY(0deg);
}
.flip-leave {
  transform: perspective(400px) rotateY(0deg);
}
.flip-leave-to {
  transform: perspective(400px) rotateY(90deg);
}
</style>
