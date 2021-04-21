<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>
import TimeKeeper from "@/services/TimeKeeper.js"
export default {
  created() {
    TimeKeeper.getFactions().then( (resp) => {
      this.$store.commit("SET_FACTIONS", resp.data.sort());
    });
    TimeKeeper.getRaces().then( (resp) => {
      this.$store.commit("SET_RACES", resp.data.sort());
    });
    TimeKeeper.getSubraces().then( (resp) => {
      //TODO Sort Subraces alphbetically by race then by subrace
      this.$store.commit("SET_SUBRACES", resp.data);
    });
    TimeKeeper.getOrigins().then( (resp) => {
      this.$store.commit("SET_ORIGINS", resp.data.sort());
    });
    TimeKeeper.getSuborigins().then( (resp) => {
      this.$store.commit("SET_SUBORIGINS", resp.data.sort());
    });
    TimeKeeper.getDeities().then( (resp) => {
      this.$store.commit("SET_DEITIES", resp.data.sort());
    });
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
