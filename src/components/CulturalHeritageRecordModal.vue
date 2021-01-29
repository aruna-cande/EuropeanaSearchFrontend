<template>
  <transition name="modal">
    <div class="modal" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">culturalHeritageRecord.title[0]</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <img
              v-if="culturalHeritageRecord.edmIsShownBy"
              :src="culturalHeritageRecord.edmIsShownBy[0]"
              class="img-fluid"
              alt="image"
            />
            <p class="card-text" v-if="culturalHeritageRecord.dcDescription">
              <b>Description:</b>
              {{culturalHeritageRecord.dcDescription[0]}}
            </p>
            <p v-if="culturalHeritageRecord.provider">
              <b>Provider:</b>
              {{culturalHeritageRecord.provider[0]}}
            </p>
            <p v-if="culturalHeritageRecord.dcCreator">
              <b>Creator:</b>
              {{culturalHeritageRecord.dcCreator[0]}}
            </p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" @click="$emit('close')">Close</button>
            <!--<button type="button" class="btn btn-primary">Save changes</button>-->
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
export default {
  name: "CulturalHeritageRecordModal",
  props: {
    culturalHeritageRecord: Object
  }
};
</script>