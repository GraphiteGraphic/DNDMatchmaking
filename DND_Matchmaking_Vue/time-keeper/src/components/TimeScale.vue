<template>
  <div>
    <p></p>
    <p
      v-for="i in 48"
      :key="i"
      :class="{
        midnight:
          `${timeOffset(Math.ceil((i - 2) / 2))}:${halfHour(i)}${AM_PM(
            Math.ceil(i / 2)
          )}` == '12:00AM',
      }"
    >
      {{ timeOffset(Math.ceil((i - 2) / 2)) }}:{{ halfHour(i)
      }}{{ AM_PM(Math.ceil(i / 2)) }}
    </p>
    <p></p>
  </div>
</template>

<script>
export default {
  name: "time-scale",
  methods: {
    //Time
    timeOffset(time) {
      return (time + this.$store.state.TIME_ZONE) % 12 == 0
        ? 12
        : (time + this.$store.state.TIME_ZONE) % 12;
    },
    AM_PM(time) {
      return time + this.$store.state.TIME_ZONE >= 12 &&
        time + this.$store.state.TIME_ZONE < 24
        ? "AM"
        : "PM";
    },
    halfHour(time) {
      return time % 2 == 0 ? "30" : "00";
    },
  },
};
</script>

<style scoped>
div {
  grid-area: timeScale;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  margin-right: 5px;
  text-align: right;
}

p:first-child {
  height: 2px;
}
p:last-child {
  height: 6px;
}

p {
  font-size: 9px;
  margin: 0px;
}

.midnight{
  font-weight: bold;
}
</style>