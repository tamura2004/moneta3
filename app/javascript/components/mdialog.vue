<template>
  <div>
    <transition name="zoomout">
      <img
        :src="src"
        alt="くじ引き結果"
        class="img-fluid zoomout"
        @click="$emit('click')"
        v-show="rank && dialog"
      >
    </transition>
  </div>
</template>

<script>
export default {
  props: ["rank", "dialog"],
  computed: {
    src() {
      if (this.rank === null) return "";
      if (this.rank <= 4) return "/kuji_ken1_ooatari.png";
      return "/kuji_ken3_hazure.png";
    }
  },
}
</script>

<style scoped>
.zoomout {
  position: absolute;
  top: 0;
  right: 0;
  left: 0;
  bottom: 0;
  margin: auto;
  width: 640px;
  height: 480px;
}

.zoomout-enter-active {
  transition: 0.3s;
}

.zoomout-enter {
  opacity: 0;
  transform: scale(5);
}

.zoomout-enter-to {
  opacity: 1;
  transform: scale(0.5);
}

.zoomout-leave-active {
  transition: 0.5s;
}

.zoomout-leave {
  opacity: 1;
}

.zoomout-leave-to {
  opacity: 0;
  transform: scale(0);
}
</style>
