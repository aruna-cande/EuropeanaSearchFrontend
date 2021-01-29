<template><!--max-height:60rem;-->
  <div>
  <b-card
    :title="culturalHeritageRecord.title[0].length >= 20 ? culturalHeritageRecord.title[0].substring(1, 20)+'...': culturalHeritageRecord.title[0]"
    :img-src="culturalHeritageRecord.edmPreview[0]"
    img-alt="Image"
    img-top
    img-height="120"
    img-width="120"
  >
    <!--<b-card-text v-if="culturalHeritageRecord.title">
    <b>Title</b>
    {{culturalHeritageRecord.title[0]}}
    </b-card-text>-->

    <b-button href="#" variant="primary">Details</b-button>
  </b-card>
  </div>
</template>

<script>
//import CulturalHeritageRecordModal from "./CulturalHeritageRecordModal.vue";
export default {
  name: "culturalHeritageRecords",
  /*components: {
    CulturalHeritageRecordModal
  },*/
  props: {
    culturalHeritageRecord: Object
  },
  data: function() {
    return {
      showModal: false
    };
  } /*,
  methods: {
    setCulturalHeritageRecodModal: function() {}
  }*/
};
</script>