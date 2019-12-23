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
          <div
            class="flex border-1 border-solid  rounded-lg overflow-hidden transition-500ms"
            :class="[form.errors.has('email') ? 'border-red-light' : 'border-grey-light']"
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
          <div
            v-if="form.errors.has('email')"
            class="text-left px-3 transition-500ms"
          >
            <span class="text-red text-xs">
              Email {{ form.errors.get('email') }}
            </span>
          </div>
        </form>
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