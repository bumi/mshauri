<template>
  <div class="w-45 mx-auto text-center xs:w-95 md:w-60 sm:w-70 lg:w-55">
    <p
      v-if="submitted"
      class="text-green"
    >
      An email has been sent to you.
    </p>
    <div v-if="!submitted">
      <p>Do you want these recommendations via email ?</p>
      <div class="mb-3">
        <form
          @submit.prevent="save"
          @keydown="form.errors.clear()"
        >
          <errors :errors="form.errors.errors" />
          <div
            class="flex border-1 border-solid  rounded-lg overflow-hidden transition-500ms border-grey-light"
          >
            <div class="w-70">
              <input
                v-model="form.email"
                class="form-input border-none px-3 py-2 text-base h-auto min-h-auto shadow-none"
                type="email"
                required
                placeholder="Email"
              >
            </div>
            <div class="w-30 bg-primary rounded-lg overflow-hidden">
              <button
                class="w-100 btn btn-primary py-2 text-base"
                type="submit"
              >
                Submit
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import Form from "../../utilities/Form";
import Iteration from '../../models/Iteration';
import Errors from '../../component/form/Errors';
export default {
  name: "UserEmail",
  components: { Errors },
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