<template>
<div>
    <section id="Time-Grid">
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
              available: availableDays[page - 1][i - 1][j - 1],
            }"
            v-on:mousedown.prevent="toggleData(i - 1, j - 1, $event)"
            v-on:mouseover.prevent="toggleData(i - 1, j - 1, $event)"
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
    <button id="save" name="save" type="button" @click="saveData">
        Save
      </button>
</div>
</template>

<script>
import TimeScale from "./TimeScale.vue";
import WeekDays from "./WeekDays.vue";
import TimeKeeper from "@/services/TimeKeeper.js"

export default {
  components: { TimeScale, WeekDays },
  name: "player-time",
  data() {
    return {
      page: 1,
      availableDays: [],
    };
  },
  created() {
    //Pull in string, convert to array of array of arrays of 0s and 1s
    this.$store.state.timeData
      .filter((p) => {
        return p.name === "Bob";
      })
      .forEach((obj) => {
        let objArray = obj.time.split("");
        objArray = objArray.map((x) => {
          return parseInt(x);
        });

        let pageArray = [];
        for (let i = 0; i < objArray.length; i = i + 7) {
          let weekArray = objArray.slice(i, i + 7);
          pageArray.push(weekArray);
        }
        this.availableDays.push(pageArray);
      });
  },
  methods: {
    //Grid Selection
    toggleData(time, day, ev) {
      if (ev.buttons === 1) {
        let td = ev.target;
        td.classList.toggle("available", !td.classList.contains("available"));
        this.availableDays[this.page - 1][time][day] =
          this.availableDays[this.page - 1][time][day] === 0 ? 1 : 0;
      }
    },
    updateTable() {
      let tr = document.querySelectorAll("tbody tr");
      for (let i = 0; i < 96; i++) {
        for (let j = 0; j < 7; j++) {
          tr[i].children[j].classList.toggle(
            "available",
            this.availableDays[this.page - 1][i][j]
          );
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
    //Save to Database
    saveData() {
      //Takes user modified data, converts to database readable format (mimicking store.state)
      let userData = [];
      for (let i = 0; i < 12; i++) {
        userData.push({
          name: "Bob",
          page: i + 1,
          time: this.availableDays
            .join()
            .replace(/,/g, "")
            .substr(i * 672, 672),
        });
      }

      //Print to console
      //TODO HTTP Put method to update user data in database
      TimeKeeper.saveTime(userData);
        //.then(resp => {
          //if(resp.status == 200)
        //});
    },
  },
};
</script>

<style scoped>

table {
  grid-area: timeGrid;
  border-collapse: collapse;
  width: 360px;
}

#Time-Grid {
  display: grid;
  grid-template-areas: "timeScale timeGrid";
  overflow: auto;
  max-height: 500px;
  width: 500px;
}

#buttons {
  grid-area: buttons;
  display: flex;
  align-items: flex-end;
  justify-content: space-between;
  font-size: 10px;
  font-weight: bolder;
  margin: 0px;
  width: 500px;
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
} */

tr#timeGrid td.available{
  background-color: green;
}

tr#timeGrid td.available.prevDay {
  background-color: rgb(128,228,100);
}

#timeGrid td:nth-child(odd):hover,
#timeGrid td:nth-child(even):hover,
#timeGrid td.prevDay:nth-child(odd):hover,
#timeGrid td.prevDay:nth-child(even):hover,
#timeGrid td.available:hover,
#timeGrid td.available.prevDay:hover {
  background-color: coral;
}
</style>