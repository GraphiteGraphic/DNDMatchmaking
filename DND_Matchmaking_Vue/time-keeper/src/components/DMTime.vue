<template>
  <section>
    <section id="Heat-Map">
      <time-scale />
      <table>
        <week-days :page="page" />
        <tbody>
          <tr id="timeGrid" v-for="i in 96" v-bind:key="i">
            <td
              v-for="j in 7"
              :key="j"
              :class="{
                prevDay: Math.ceil(i / 4) + $store.state.TIME_ZONE <= 12,
              }"
            ></td>
          </tr>
        </tbody>
      </table>
    </section>
    <section id="buttons">
      <button @click="prevPage()">&#8617;</button>
      {{ page }}/12
      <button @click="nextPage()">&#8618;</button>
    </section>
  </section>
</template>

<script>
import TimeScale from "./TimeScale.vue";
import WeekDays from "./WeekDays.vue";

export default {
  components: { TimeScale, WeekDays },
  name: "dm-time",
  data() {
    return {
      page: 1,
      isLoaded: false,
    };
  },
  watch: {
    filteredplayers: function () {
      if (this.isLoaded) {
        this.updateTable();
      }
    },
  },
  computed: {
    players() {
      return this.$store.state.timeData;
    },
    filters() {
      return this.$store.state.filter;
    },
    filteredplayers() {
      //Find all players that meet all selected filters
      //More than 1 selection in the same category, finds all players that have either
      let i = this.$store.state.characterData
        .filter((p) => {
          let x = true;
          for (let prop in this.filters) {
            if (prop != "minLevel" && prop != "maxLevel") {
              x =
                this.filters[prop].length < 1
                  ? true
                  : this.filters[prop].includes(p[prop]);
            } else {
              x =
                p["mv"] >= this.filters.minLevel &&
                p["mv"] < this.filters.maxLevel;
            }
            if (!x) {
              return x;
            }
          }
          return x;
        })
        .map((q) => {
          return q.name;
        });

      return this.players.filter((p) => {
        let x = false;
        for (let j of i) {
          x = p.name === j && p.page === this.page;
          if (x) {
            return x;
          }
        }
        return x;
      });
    },
  },
  methods: {
    //Grid Population
    updateTable() {
      let tr = document.querySelectorAll("tbody tr");

      //Clear Table
      tr.forEach((row) => {
        row.children.forEach((cell) => {
          cell.style.opacity = "";
          cell.classList.remove("available");
        });
      });

      for (let h = 0; h < this.filteredplayers.length; h++) {
        for (let i = 0; i < 96; i++) {
          for (let j = 0; j < 7; j++) {
            let opacity = parseFloat(tr[i].children[j].style.opacity);
            if (parseInt(this.filteredplayers[h].time.substr(i * 7, 7)[j])) {
              tr[i].children[j].classList.add("available");
              if (!opacity) {
                tr[i].children[j].style.opacity = 0.075;
              } else {
                tr[i].children[j].style.opacity = opacity + 0.075;
              }
            }
          }
        }
      }
    },
    //Page
    prevPage() {
      this.page = this.page > 1 ? this.page - 1 : this.page;
      this.updateTable();
    },
    nextPage() {
      this.page = this.page < 12 ? this.page + 1 : this.page;
      this.updateTable();
    },
  },
  mounted() {
    //Loads table on DOM generation
    this.updateTable();
    this.isLoaded = true;
  },
};
</script>

<style scoped>
table {
  grid-area: timeGrid;
  border-collapse: collapse;
  width: 360px;
}

#buttons {
  grid-area: buttons;
  display: flex;
  justify-content: space-between;
  font-size: 10px;
  font-weight: bolder;
  margin: 0px;
  width: 500px;
}

#Heat-Map {
  display: grid;
  grid-template-areas: "timeScale timeGrid";
  overflow: auto;
  max-height: 500px;
}

tr#timeGrid:nth-child(odd) {
  border-bottom: 1px dashed gray;
}

tr#timeGrid:nth-child(even) {
  border-bottom: 1px solid darkgray;
}

tr#timeGrid:nth-child(4n) {
  border-bottom: 1px solid rgb(125, 125, 125);
}

#timeGrid td {
  border-left: 1px solid rgb(125, 125, 125);
  border-right: 1px solid rgb(125, 125, 125);
  width: 15vw;
  height: 6px;
  background-color: lightgray;
}

tr#timeGrid td.prevDay {
  background-color: rgb(255, 200, 200);
}

/* tr#timeGrid td:nth-child(even).prevDay,
tr#timeGrid td:nth-child(odd) {
  background-color: rgb(190, 190, 190);
}

tr#timeGrid td:nth-child(odd).prevDay,
tr#timeGrid td:nth-child(even) {
  background-color: lightgray;
}

tr#timeGrid td:nth-child(even).prevDay.available,
tr#timeGrid td:nth-child(odd).available {
  background-color: rgb(0, 0, 128);
}

tr#timeGrid td:nth-child(odd).prevDay.available,
tr#timeGrid td:nth-child(even).available {
  background-color: rgb(0,128,0);
} */

tr#timeGrid td.available {
  background-color: green;
}

tr#timeGrid td.available.prevDay {
  background-color: blue;
}
</style>