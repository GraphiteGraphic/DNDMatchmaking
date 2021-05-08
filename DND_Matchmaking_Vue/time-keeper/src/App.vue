<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>
import TimeKeeper from "@/services/TimeKeeper.js";
import Discord from "@/services/Discord.js";

export default {
  data() {
    return {
      discord_code: "",
    };
  },
  created() {
    this.discord_code = this.$route.query.code;

    if (this.discord_code) {
      Discord.discord_token(this.discord_code).then((resp) => {
        this.$store.commit("SET_DISCORD", resp.data);
        Discord.discord_user(resp.data).then((r) => {
          this.$store.commit("SET_USER", r.data);
          this.$router.push("/player");
        });
      });
    }

    if (this.$store.state.discord_token) {
      Discord.discord_user(this.$store.state.discord_token).then((r) => {
        this.$store.commit("SET_USER", r.data);
      });
    }

    TimeKeeper.getFactions().then((resp) => {
      this.$store.commit("SET_FACTIONS", resp.data.sort());
    });
    TimeKeeper.getRaces().then((resp) => {
      this.$store.commit("SET_RACES", resp.data.sort());
    });
    TimeKeeper.getSubraces().then((resp) => {
      //TODO Sort Subraces alphbetically by race then by subrace
      this.$store.commit("SET_SUBRACES", resp.data);
    });
    TimeKeeper.getOrigins().then((resp) => {
      this.$store.commit("SET_ORIGINS", resp.data.sort());
    });
    TimeKeeper.getSuborigins().then((resp) => {
      this.$store.commit("SET_SUBORIGINS", resp.data.sort());
    });
    TimeKeeper.getDeities().then((resp) => {
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
