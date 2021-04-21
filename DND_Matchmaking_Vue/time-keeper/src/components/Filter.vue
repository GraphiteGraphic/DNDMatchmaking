<template>
  <section id="Player_Filter">
    <div>
      Level:
      <input
        type="number"
        id="min-level"
        name="min-level"
        min="1"
        :max="maxLevel"
        v-model="minLevel"
        @change="setLevel()"
      />-
      <input
        type="number"
        id="max-level"
        name="max-level"
        :min="minLevel"
        max="20"
        v-model="maxLevel"
        @change="setLevel()"
      />
    </div>
    <div>
      Search By Name:
      <div>
        <input
          list="player_names"
          name="player"
          id="player"
          v-model="player_text"
        />
        <datalist id="player_names">
          <option
            v-for="player of $store.state.characterData"
            :key="player.name"
            :value="player.name"
          >
            {{ player.name }}
          </option>
        </datalist>
      </div>
      <button type="button" @click="addName()">Add Player</button>
      <div v-for="name of players" :key="name" class="player_name">
        <img src="@/assets/recycle-bin.png" @click="deleteName(name)" />
        {{ name }}
      </div>
    </div>
    <div>
      <span @click.prevent="show.faction = !show.faction"
        ><span v-show="!show.faction">⮞</span
        ><span v-show="show.faction">⮟</span> Faction:</span
      >
      <div
        v-show="show.faction || show.list.faction.includes(faction)"
        v-for="faction of factions"
        :key="faction"
        class="faction"
      >
        <input
          type="checkbox"
          :id="faction"
          @change="
            toggleFilterParam(
              faction,
              $event.target.parentNode.classList.toString()
            )
          "
        />
        <label :for="faction">
          {{ faction }}
        </label>
      </div>
    </div>
    <div>
      <span @click.prevent="show.race = !show.race"
        ><span v-show="!show.race">⮞</span
        ><span v-show="show.race">⮟</span> Race:</span
      >
      <div v-show="show.race || show.list.race.includes(race)" v-for="race of races" :key="race" class="race">
        <input
          type="checkbox"
          :id="race"
          @change="
            toggleFilterParam(
              race,
              $event.target.parentNode.classList.toString()
            )
          "
        />
        <label :for="race">
          {{ race }}
        </label>
      </div>
    </div>
    <div>
      <span @click.prevent="show.subrace = !show.subrace"
        ><span v-show="!show.subrace">⮞</span
        ><span v-show="show.subrace">⮟</span> Subrace:</span
      >
      <div
        v-show="show.subrace || show.list.subrace.includes(subrace.name)"
        v-for="subrace of subraces"
        :key="subrace.race + subrace.name"
        class="subrace"
      >
        <input
          type="checkbox"
          :id="subrace.race + '_' + subrace.name"
          @change="
            toggleFilterParam(
              subrace.name,
              $event.target.parentNode.classList.toString()
            )
          "
        />
        <label :for="subrace.race + '_' + subrace.name">
          {{ subrace.race }}: {{ subrace.name }}
        </label>
      </div>
    </div>
    <div>
      <span @click.prevent="show.origin = !show.origin"
        ><span v-show="!show.origin">⮞</span
        ><span v-show="show.origin">⮟</span> Origin:</span
      >
      <div
        v-show="show.origin  || show.list.origin.includes(origin)"
        v-for="origin of origins"
        :key="origin"
        class="origin"
      >
        <input
          type="checkbox"
          :id="origin"
          @change="
            toggleFilterParam(
              origin,
              $event.target.parentNode.classList.toString()
            )
          "
        />
        <label :for="origin">
          {{ origin }}
        </label>
      </div>
    </div>
    <div>
      <span @click.prevent="show.suborigin = !show.suborigin"
        ><span v-show="!show.suborigin">⮞</span
        ><span v-show="show.suborigin">⮟</span> Suborigin:</span
      >
      <div
        v-show="show.suborigin  || show.list.suborigin.includes(suborigin)"
        v-for="suborigin of suborigins"
        :key="suborigin"
        class="suborigin"
      >
        <input
          type="checkbox"
          :id="suborigin"
          @change="
            toggleFilterParam(
              suborigin,
              $event.target.parentNode.classList.toString()
            )
          "
        />
        <label :for="suborigin">
          {{ suborigin }}
        </label>
      </div>
    </div>
    <div>
      <span @click.prevent="show.deity = !show.deity"
        ><span v-show="!show.deity">⮞</span
        ><span v-show="show.deity">⮟</span> Deity:</span
      >
      <div
        v-show="show.deity  || show.list.deity.includes(deity)"
        v-for="deity of deities"
        :key="deity"
        class="deity"
      >
        <input
          type="checkbox"
          :id="deity"
          @change="
            toggleFilterParam(
              deity,
              $event.target.parentNode.classList.toString()
            )
          "
        />
        <label :for="deity">
          {{ deity }}
        </label>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "player-filter",
  data() {
    return {
      show: {
        faction: false,
        race: false,
        subrace: false,
        origin: false,
        suborigin: false,
        deity: false,
        list: {
          faction: [],
          race: [],
          subrace: [],
          origin: [],
          suborigin: [],
          deity: [],
          name: []
        },
      },
      players: [],
      player_text: "",
      minLevel: 1,
      maxLevel: 20,
    };
  },
  computed: {
    factions() {
      return this.$store.state.faction;
    },
    races() {
      return this.$store.state.race;
    },
    subraces() {
      return this.$store.state.subrace;
    },
    origins() {
      return this.$store.state.origin;
    },
    suborigins() {
      return this.$store.state.suborigin;
    },
    deities() {
      return this.$store.state.deity;
    },
  },
  methods: {
    toggleFilterParam(param, filterName) {
      //Add/Remove selected checkbox to list controlling what is seen in the front end
      if (!this.show.list[filterName].includes(param)) {
        this.show.list[filterName].push(param);
      }
      else {
        this.show.list[filterName].splice(this.show.list[filterName].indexOf(param), 1);
      }

      //Add/Remove selected checkbox to global store filter for internal filtering logic
      let newFilter = {};
      newFilter[filterName] = param;
      this.$store.commit("TOGGLE_FILTER", newFilter);
    },
    addName() {
      if (!this.players.includes(this.player_text)) {
        this.players.push(this.player_text);
      }
      this.toggleFilterParam(this.player_text, "name");
    },
    deleteName(name) {
      this.players.splice(this.players.indexOf(name), 1);
      this.toggleFilterParam(name, "name");
    },
    setLevel() {
      this.$store.commit("SET_MIN_LEVEL", parseInt(this.minLevel));
      this.$store.commit("SET_MAX_LEVEL", parseInt(this.maxLevel));
    },
  },
};
</script>

<style scoped>
#Player_Filter {
  grid-area: filter;
  margin-right: 20px;
}
#Player_Filter > div {
  margin-bottom: 10px;
  font-weight: bold;
  font-size: 14px;
}
#Player_Filter label {
  font-size: 12px;
}
.faction,
.race,
.subrace,
.origin,
.suborigin,
.deity {
  display: flex;
  align-content: left;
  font-weight: normal;
}
.player_name {
  display: flex;
  justify-content: space-between;
  align-content: center;
  font-size: 15px;
}
img {
  width: 15px;
}
#min-level,
#max-level {
  width: 30px;
}
</style>