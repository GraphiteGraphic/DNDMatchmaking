<template>
  <thead>
    <th v-for="i in 7" :key="i">
      {{ weekdays[i - 1] }}
      {{
        calcDate(
          weekStart + i - 1,
          $store.state.QUARTER_START.getMonth(),
          $store.state.QUARTER_START.getFullYear()
        )
      }}
    </th>
  </thead>
</template>

<script>
export default {
  name: "week-days",
  props: {
    page: Number,
  },
  data() {
    return {
      weekdays: ["SUN", "MON", "TUES", "WED", "THURS", "FRI", "SAT"],
    };
  },
  computed: {
    weekStart() {
      return this.$store.state.QUARTER_START.getDate() + 7 * (this.page - 1);
    },
  },
  methods: {
    //Date
    calcDate(date, month, year) {
      const DAYS_OF_MONTH = [
        31,
        year % 4 == 0 ? 29 : 28,
        31,
        30,
        31,
        30,
        31,
        31,
        30,
        31,
        30,
        31,
      ];

      while (date > DAYS_OF_MONTH[month]) {
        date -= DAYS_OF_MONTH[month];
        month++;

        if (month > 11) {
          month = 0;
          year++;
        }
      }

      while (date < 1) {
        month--;

        if (month < 0) {
          month = 11;
          year--;
        }

        date += DAYS_OF_MONTH[month];
      }

      return `${month + 1}/${date}`;
    },
  },
};
</script>

<style scoped>
th {
  border-bottom: 1px solid rgb(125, 125, 125);
  font-size: 9px;
  min-width: 54px;
}
</style>