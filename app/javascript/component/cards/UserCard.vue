<template>
  <div>
    <router-link :to="{name: 'admin-user-show', params:{id: user.id}}">
      <div class="w-100 rounded-xl mb-4 mx-auto border-1 p-4 border-solid border-grey-light ">

        <div class="w-100 mx-auto px-3 flex relative py-2">
          <div class="w-rem-24 flex align-items-center">
            <div class="w-rem-18 h-18 rounded-full bg-grey-lighter flex align-items-center justify-content-center">
              <i class="fas fa-user text-3xl" />
            </div>
          </div>

          <div class="w-40 pl-2">
            <div>
              <h3 class="mt-2 mb-2">
                {{ user.name ? user.name : 'No Email provided' }}
              </h3>
              <p class="my-0 text-muted">
                {{ user.email }}
              </p>
            </div>
          </div>

          <div class="text-right w-45 ml-auto">
            <h5 class="my-2 font-bold text-lg">
              Joined on {{ joinedOn }} <i class="far fa-calendar ml-2" />
            </h5>
            <ul class="w-100 list-type-0 inline-list my-0 mt-2 ">
              <li class="my-0 mr-2">
                <span class="opacity-80">Iterations:</span> <button
                  class="w-5 h-5 bg-green text-white rounded-full p-0 leading-0">
                  {{ user.iterations.length }}
                </button>
              </li>
              <li class="my-0 ml-2">
                <span class="opacity-80">Answers:</span> <button
                  class="w-5 h-5 bg-green text-white rounded-full p-0 leading-0 text-sm">
                  {{ user.answers.length }}
                </button>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </router-link>
  </div>
</template>

<script>
  export default {
    name: "UserCard",
    props: {
      user: {
        type: Object,
        default: () => {}
      }
    },
    computed: {
      joinedOn() {
        let date = new Date(this.user.created_at);
        return date.getDate() + '-' + (date.getMonth() + 1) + '-' + date.getFullYear();
      }
    }
  }
</script>