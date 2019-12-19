<template>
  <div class="w-90 mx-auto text-center">
    <p
      v-if="submitted"
      class="text-green"
    >
      An email has been sent to you.
    </p>
    <div v-if="!submitted">
      <p>Do you want these recommendations via email ?</p>
      <div class="mb-3">
        <div class="flex border-1 border-solid border-grey-light rounded-lg overflow-hidden">
          <div class="w-65">
            <input
              v-model="form.email"
              class="form-input border-none px-3 py-2 text-base h-auto min-h-auto shadow-none"
              type="email"
              placeholder="Email"
            >
          </div>
          <div class="w-35">
            <button
              class="w-100 btn btn-primary py-2 text-base rounded-lg "
              @click="save"
            >
              Submit
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Form from "../../utilities/Form";
import Iteration from '../../models/Iteration';
export default {
  name: "UserEmail",
  props: {
    iterationId: {
      type: [Number, String],
      default: ''
    }
  },
  data() {
    return {
      form: new Form({
        email: ''
      }),
      submitted: false,
    }
  },
  methods: {
    save() {
      this.form.put(Iteration.url(this.iterationId, '/notify_user')).then(() => {
        this.form.reset();
        this.submitted = true;
      });
    }
  }
}
</script>