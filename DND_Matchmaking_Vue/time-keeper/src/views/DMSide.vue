<template>
  <div>
    <header>
      <h1>DM Side</h1>
    </header>
    <main>
      <DM_Filter />
      <DM_Time />
      <game-form />
    </main>
  </div>
</template>

<script>
import DM_Time from "@/components/DMTime.vue";
import DM_Filter from "@/components/Filter.vue";
import GameForm from '../components/GameForm.vue';

export default {
  name: "dm-side",
  components: { DM_Time, DM_Filter, GameForm },
};
</script>

<style>
main {
  display: flex;
}
</style>