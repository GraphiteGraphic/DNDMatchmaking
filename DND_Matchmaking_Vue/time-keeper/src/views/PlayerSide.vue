<template>
  <div>
    <header>
      <h1>Player Side</h1>
    </header>
    <main>
      <player-time />
    </main>
  </div>
</template>

<script>
import PlayerTime from "../components/PlayerTime.vue";

export default {
  name: "player-side",
  computed: {
    Test() {
      return this.$store.state.user;
    }
  },
  components: { PlayerTime },
};
</script>

<style>
main {
  display: flex;
}
</style>