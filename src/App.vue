<template>
  <div id="app">
    <header>
      <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Europeana Search</a>
        <button
          class="navbar-toggler collapsed"
          type="button"
          data-toggle="collapse"
          data-target="#navbarCollapse"
          aria-controls="navbarCollapse"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse" id="navbarCollapse" style>
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">
                Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
          </ul>
          <div class="form-inline mt-2 mt-md-0">
            <input
              class="form-control mr-sm-2"
              v-on:keyup.enter="getCulturalHeritageItems"
              type="text"
              placeholder="Search"
              v-model="searchInput"
              aria-label="Search"
            />
            <button
              class="btn btn-outline-success my-2 my-sm-0"
              v-on:click="getCulturalHeritageItems"
            >Search</button>
          </div>
        </div>
      </nav>
    </header>

    <main role="main" class="flex-shrink-0">
      <div class="album py-5 bg-light">
        <div class="container">
          <div class="row">
          <b-card-group columns>
              <CulturalHeritageRecords
                v-for="culturalHeritageRecord in culturalHeritageItems"
                :key="culturalHeritageRecord.id"
                :culturalHeritageRecord="culturalHeritageRecord"
              ></CulturalHeritageRecords>
          </b-card-group>
          </div>
        </div>
      </div>

      <!-- FOOTER -->
      <footer class="container">
        <p class="float-right">
          <a href="#">Back to top</a>
        </p>
        <p>
          © 2017-2019 Company, Inc. ·
          <a href="#">Privacy</a> ·
          <a href="#">Terms</a>
        </p>
      </footer>
    </main>
  </div>
</template>

<script>
import CulturalHeritageRecords from "./components/CulturalHeritageRecords.vue";
import axios from "axios";

export default {
  name: "app",
  components: {
    CulturalHeritageRecords
  },
  data: function() {
    return {
      searchInput: "",
      culturalHeritageItems: [],
      searchUrl: '{{ SEARCH_URL }}'//,process.env.VUE_APP_SEARCH_HOST
      //searchPort: '{{ SERVICE_PORT }}',//process.env.VUE_APP_SEARCH_PORT
    };
  },
  methods: {
    getCulturalHeritageItems: function() {
      //console.log("getCulturalHeritageItems was called");
      axios
        .get(
          "http://"+this.searchUrl+"/search?query=" +
            this.searchInput +
            "&media=true&thumbnail=true&Landingpage=true&rows=10"
        )
        .then(response => {
          this.culturalHeritageItems = response.data.items;
        })
        .catch(error => {
          console.log(error.statusText);
        });
    }
  }
};
</script>

