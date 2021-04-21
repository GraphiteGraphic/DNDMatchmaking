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
        <select name="req-Faction" id="req-Faction" v-model="reqFaction" @change="AddReq(reqFaction)">
          <option value="null"></option>
          <option v-for="faction in factions" :key="faction" :value="faction">
            {{ faction }}
          </option>
        </select>
      </div>

      <div>
        <label for="req-Race">Race: </label>
        <select name="req-Race" id="req-Race">
          <option value="Null"></option>
          <option v-for="race in races" :key="race" :value="race">
            {{ race }}
          </option>
        </select>
      </div>

      <div>
        <label for="req-Subrace">Subrace: </label>
        <select name="req-Subrace" id="req-Subrace">
          <option value="Null"></option>
          <option
            v-for="subrace in subraces"
            :key="subrace.race + '_' + subrace.name"
            :value="subrace.name"
          >
            {{ subrace.race }}: {{ subrace.name }}
          </option>
        </select>
      </div>

      <div>
        <label for="req-Origin">Origin: </label>
        <select name="req-Origin" id="req-Origin">
          <option value="Null"></option>
          <option v-for="origin in origins" :key="origin" :value="origin">
            {{ origin }}
          </option>
        </select>
      </div>

      <div>
        <label for="req-Suborigin">Suborigin: </label>
        <select name="req-Suborigin" id="req-Suborigin">
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
        <select name="req-Deity" id="req-Deity">
          <option value="Null"></option>
          <option v-for="deity in deities" :key="deity" :value="deity">
            {{ deity }}
          </option>
        </select>
      </div>

      <section name="required-list" id="required-list">
        <p v-for="req in requirements" :key="req">{{ req }}</p>
      </section>
    </div>

    <div id="preference">
      Preferred Attributes:

      <div>
        <label for="pref-Faction">Faction: </label>
        <select name="pref-Faction" id="pref-Faction">
          <option value="Null"></option>
          <option v-for="faction in factions" :key="faction" :value="faction">
            {{ faction }}
          </option>
        </select>
      </div>

      <div>
        <label for="pref-Race">Race: </label>
        <select name="pref-Race" id="pref-Race">
          <option value="Null"></option>
          <option v-for="race in races" :key="race" :value="race">
            {{ race }}
          </option>
        </select>
      </div>

      <div>
        <label for="pref-Subrace">Subrace: </label>
        <select name="pref-Subrace" id="pref-Subrace">
          <option value="Null"></option>
          <option
            v-for="subrace in subraces"
            :key="subrace.race + '_' + subrace.name"
            :value="subrace.name"
          >
            {{ subrace.race }}: {{ subrace.name }}
          </option>
        </select>
      </div>

      <div>
        <label for="pref-Origin">Origin: </label>
        <select name="pref-Origin" id="pref-Origin">
          <option value="Null"></option>
          <option v-for="origin in origins" :key="origin" :value="origin">
            {{ origin }}
          </option>
        </select>
      </div>

      <div>
        <label for="pref-Suborigin">Suborigin: </label>
        <select name="pref-Suborigin" id="pref-Suborigin">
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
        <select name="pref-Deity" id="pref-Deity">
          <option value="Null"></option>
          <option v-for="deity in deities" :key="deity" :value="deity">
            {{ deity }}
          </option>
        </select>
      </div>

      <section name="pref-list" id="pref-list"></section>
    </div>
    <input type="submit" value="Submit" />
  </form>
</template>

<script>
export default {
  data() {
    return {
      reqFaction: '',
      requirements: [],
      preferences: []
    }
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
    }
  },
  methods: {
    AddReq(value) {
      if (!this.requirements.includes(value) && value != 'null') {
        this.requirements.push(value);
        this.requirements = this.requirements.sort();
      }
    },
    AddPref(value) {
      if (!this.preferences.includes(value) && value != 'null') {
        this.preferences.push(value);
        this.preferences = this.preferences.sort();
      }
    },
  }
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
</style>