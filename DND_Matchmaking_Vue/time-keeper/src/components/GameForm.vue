<template>
  <form>
    <div>
      <label class="title" for="title">Mission Title: </label>
      <input type="text" required="true" name="title" id="title" />
    </div>
    <div>
      <div>
        <label class="description" for="description">Description: </label>
      </div>
      <textarea name="description" id="description"></textarea>
    </div>
    <div>
      <label for="descriptor">Descriptors: </label>
      <input
        type="text"
        placeholder="RPLock, Skirmish, Ruthless"
        name="descriptor"
        id="descriptor"
      />
    </div>
    <div>
      <label for="region">Regional Influence: </label>
      <select name="region" id="region">
        <option value="none">None</option>
      </select>

      <label for="minLevel">Minimum Level: </label>
      <input type="number" min="1" max="12" name="minLevel" id="minLevel" />

      <label for="maxLevel">Maximum Level: </label>
      <input type="number" min="1" max="12" name="maxLevel" id="maxLevel" />
    </div>
    <div>
      <label for="sessionDate">Session Date: </label>
      <input type="date" required="true" name="sessionDate" id="sessionDate" />

      <label for="startTime">Start Time: </label>
      <input type="time" required="true" name="startTime" id="startTime" />

      <label for="endTime">End Time: </label>
      <input type="time" required="true" name="endTime" id="endTime" />
    </div>
    <div>
      <label for="sessionNumber">Total Number of Sessions: </label>
      <input
        type="number"
        required="true"
        name="sessionNumber"
        id="sessionNumber"
        min="1"
        placeholder="1"
      />

      <label for="modifier">Mission Type: </label>
      <select required="true" name="modifier" id="modifier">
        <option value="minor">Minor</option>
        <option value="lesser">Lesser</option>
        <option value="major">Major</option>
      </select>

      <label for="prestige">Prestige Level: </label>
      <input
        type="number"
        min="0"
        max="4"
        placeholder="0"
        name="prestige"
        id="prestige"
      />
    </div>

    <div id="requirement">
      Required Attributes:
      <div>
        <label for="req-Faction">Faction: </label>
        <select
          name="req-Faction"
          id="req-Faction"
          v-model="reqFaction"
          @change="AddReq(reqFaction, 'faction')"
        >
          <option value="null"></option>
          <option v-for="faction in factions" :key="faction" :value="faction">
            {{ faction }}
          </option>
        </select>
      </div>

      <div>
        <label for="req-Race">Race: </label>
        <select
          name="req-Race"
          id="req-Race"
          v-model="reqRace"
          @change="AddReq(reqRace, 'race')"
        >
          <option value="Null"></option>
          <option v-for="race in races" :key="race" :value="race">
            {{ race }}
          </option>
        </select>
      </div>

      <div>
        <label for="req-Subrace">Subrace: </label>
        <select
          name="req-Subrace"
          id="req-Subrace"
          v-model="reqSubrace"
          @change="AddReq(reqSubrace, 'subrace')"
        >
          <option value="Null"></option>
          <option
            v-for="subrace in subraces"
            :key="subrace.race + '_' + subrace.name"
            :value="subrace.race + ': ' + subrace.name"
          >
            {{ subrace.race }}: {{ subrace.name }}
          </option>
        </select>
      </div>

      <div>
        <label for="req-Origin">Origin: </label>
        <select
          name="req-Origin"
          id="req-Origin"
          v-model="reqOrigin"
          @change="AddReq(reqOrigin, 'origin')"
        >
          <option value="Null"></option>
          <option v-for="origin in origins" :key="origin" :value="origin">
            {{ origin }}
          </option>
        </select>
      </div>

      <div>
        <label for="req-Suborigin">Suborigin: </label>
        <select
          name="req-Suborigin"
          id="req-Suborigin"
          v-model="reqSuborigin"
          @change="AddReq(reqSuborigin, 'suborigin')"
        >
          <option value="Null"></option>
          <option
            v-for="suborigin in suborigins"
            :key="suborigin"
            :value="suborigin"
          >
            {{ suborigin }}
          </option>
        </select>
      </div>

      <div>
        <label for="req-Deity">Deity: </label>
        <select
          name="req-Deity"
          id="req-Deity"
          v-model="reqDeity"
          @change="AddReq(reqDeity, 'deity')"
        >
          <option value="Null"></option>
          <option v-for="deity in deities" :key="deity" :value="deity">
            {{ deity }}
          </option>
        </select>
      </div>
    </div>

    <section name="required-list" id="required-list">
      <div>
        Faction:
        <p
          v-for="req in requirements.faction"
          :key="req"
          @click="DeleteReq(req, 'faction')"
        >
          {{ req }}
        </p>
      </div>
      <div>
        Race:
        <p
          v-for="req in requirements.race"
          :key="req"
          @click="DeleteReq(req, 'race')"
        >
          {{ req }}
        </p>
      </div>
      <div>
        Subrace:
        <p
          v-for="req in requirements.subrace"
          :key="req"
          @click="DeleteReq(req, 'subrace')"
        >
          {{ req }}
        </p>
      </div>
      <div>
        Origin:
        <p
          v-for="req in requirements.origin"
          :key="req"
          @click="DeleteReq(req, 'origin')"
        >
          {{ req }}
        </p>
      </div>
      <div>
        Suborigin:
        <p
          v-for="req in requirements.suborigin"
          :key="req"
          @click="DeleteReq(req, 'suborigin')"
        >
          {{ req }}
        </p>
      </div>
      <div>
        Deity:
        <p
          v-for="req in requirements.deity"
          :key="req"
          @click="DeleteReq(req, 'deity')"
        >
          {{ req }}
        </p>
      </div>
    </section>

    <div id="preference">
      Preferred Attributes:

      <div>
        <label for="pref-Faction">Faction: </label>
        <select
          name="pref-Faction"
          id="pref-Faction"
          v-model="prefFaction"
          @change="AddPref(prefFaction, 'faction')"
        >
          <option value="Null"></option>
          <option v-for="faction in factions" :key="faction" :value="faction">
            {{ faction }}
          </option>
        </select>
      </div>

      <div>
        <label for="pref-Race">Race: </label>
        <select
          name="pref-Race"
          id="pref-Race"
          v-model="prefRace"
          @change="AddPref(prefRace, 'race')"
        >
          <option value="Null"></option>
          <option v-for="race in races" :key="race" :value="race">
            {{ race }}
          </option>
        </select>
      </div>

      <div>
        <label for="pref-Subrace">Subrace: </label>
        <select
          name="pref-Subrace"
          id="pref-Subrace"
          v-model="prefSubrace"
          @change="AddPref(prefSubrace, 'subrace')"
        >
          <option value="Null"></option>
          <option
            v-for="subrace in subraces"
            :key="subrace.race + '_' + subrace.name"
            :value="subrace.race + ': ' + subrace.name"
          >
            {{ subrace.race }}: {{ subrace.name }}
          </option>
        </select>
      </div>

      <div>
        <label for="pref-Origin">Origin: </label>
        <select
          name="pref-Origin"
          id="pref-Origin"
          v-model="prefOrigin"
          @change="AddPref(prefOrigin, 'origin')"
        >
          <option value="Null"></option>
          <option v-for="origin in origins" :key="origin" :value="origin">
            {{ origin }}
          </option>
        </select>
      </div>

      <div>
        <label for="pref-Suborigin">Suborigin: </label>
        <select
          name="pref-Suborigin"
          id="pref-Suborigin"
          v-model="prefSuborigin"
          @change="AddPref(prefSuborigin, 'suborigin')"
        >
          <option value="Null"></option>
          <option
            v-for="suborigin in suborigins"
            :key="suborigin"
            :value="suborigin"
          >
            {{ suborigin }}
          </option>
        </select>
      </div>

      <div>
        <label for="pref-Deity">Deity: </label>
        <select
          name="pref-Deity"
          id="pref-Deity"
          v-model="prefDeity"
          @change="AddPref(prefDeity, 'deity')"
        >
          <option value="Null"></option>
          <option v-for="deity in deities" :key="deity" :value="deity">
            {{ deity }}
          </option>
        </select>
      </div>
    </div>

    <section name="pref-list" id="pref-list">
      <div>
        Faction:
        <p
          v-for="pref in preferences.faction"
          :key="pref"
          @click="DeletePref(pref, 'faction')"
        >
          {{ pref }}
        </p>
      </div>
      <div>
        Race:
        <p
          v-for="pref in preferences.race"
          :key="pref"
          @click="DeletePref(pref, 'race')"
        >
          {{ pref }}
        </p>
      </div>
      <div>
        Subrace:
        <p
          v-for="pref in preferences.subrace"
          :key="pref"
          @click="DeletePref(pref, 'subrace')"
        >
          {{ pref }}
        </p>
      </div>
      <div>
        Origin:
        <p
          v-for="pref in preferences.origin"
          :key="pref"
          @click="DeletePref(pref, 'origin')"
        >
          {{ pref }}
        </p>
      </div>
      <div>
        Suborigin:
        <p
          v-for="pref in preferences.suborigin"
          :key="pref"
          @click="DeletePref(pref, 'suborigin')"
        >
          {{ pref }}
        </p>
      </div>
      <div>
        Deity:
        <p
          v-for="pref in preferences.deity"
          :key="pref"
          @click="DeletePref(pref, 'deity')"
        >
          {{ pref }}
        </p>
      </div>
    </section>

    <input type="submit" value="Submit" />
  </form>
</template>

<script>
export default {
  data() {
    return {
      reqFaction: "",
      reqRace: "",
      reqSubrace: "",
      reqOrigin: "",
      reqSuborigin: "",
      reqDeity: "",
      prefFaction: "",
      prefRace: "",
      prefSubrace: "",
      prefOrigin: "",
      prefSuborigin: "",
      prefDeity: "",
      requirements: {
        faction: [],
        race: [],
        subrace: [],
        origin: [],
        suborigin: [],
        deity: [],
      },
      preferences: {
        faction: [],
        race: [],
        subrace: [],
        origin: [],
        suborigin: [],
        deity: [],
      },
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
    AddReq(value, prop) {
      if (!this.requirements[prop].includes(value) && value != "null") {
        this.requirements[prop].push(value);
        this.requirements[prop] = this.requirements[prop].sort();
      }
    },
    DeleteReq(value, prop) {
      this.requirements[prop].splice(this.requirements[prop].indexOf(value), 1);
    },
    AddPref(value, prop) {
      if (!this.preferences[prop].includes(value) && value != "null") {
        this.preferences[prop].push(value);
        this.preferences[prop] = this.preferences[prop].sort();
      }
    },
    DeletePref(value, prop) {
      this.preferences[prop].splice(this.preferences[prop].indexOf(value), 1);
    },
  },
};
</script>

<style scoped>
form {
  font-size: 14px;
  display: flex;
  flex-direction: column;
}
form > div {
  display: flex;
}
label.title,
label.description {
  display: block;
}
div > input,
div > select,
div > textarea {
  flex-grow: 1;
}
#required-list,
#pref-list {
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
  align-content: flex-start;
  text-align: left;
}
#required-list > div,
#pref-list > div {
  display: flex;
  flex-direction: row;
}
#required-list p,
#pref-list p {
  padding-right: 1vw;
}
p:hover {
  text-decoration: line-through;
  color: grey;
  cursor: pointer;
}
</style>