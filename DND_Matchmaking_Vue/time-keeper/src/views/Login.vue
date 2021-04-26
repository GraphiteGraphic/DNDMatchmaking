<template>
  <a id="login" :href="redirect">Login</a>
</template>

<script>
export default {
  data() {
    return {
      redirect:
        "https://discord.com/api/oauth2/authorize?client_id=835298512962846750&redirect_uri=http%3A%2F%2Flocalhost%3A8080&response_type=code&scope=identify",
    };
  },
};
</script>

<style>
</style>