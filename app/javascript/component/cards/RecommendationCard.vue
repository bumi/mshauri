<template>
  <div class="w-90 mx-auto flex relative py-2">
    <div class="absolute h-100 w-10 flex align-items-center justify-content-center">
      <div class="h-100 w-05 bg-grey-light" />
    </div>
    <div class="w-10 z-99 flex align-items-center justify-content-center">
      <div
        class="rounded-full h-16 w-rem-16 xs:h-8 xs:w-rem-8 md:h-12 md:w-rem-12 sm:h-10 sm:w-rem-10 bg-white border-solid border-1 border-grey-lighter shadow z-9999 flex align-items-center justify-content-center text-2xl"
      >
        <div
          class="rounded-full h-4 bg-grey-darker"
          style="width: 1rem"
        />
      </div>
    </div>
    <div class="w-90 py-3">
      <router-link
        tag="div"
        class="cursor-pointer"
        :to="{name: 'recommendation-show', params:{id: recommendation.id}}"
      >
        <div class="w-95 ml-auto bg-transparent border-grey-light shadow-sm border-solid border-1 rounded-xl">
          <h4 class="text-lg pt-4 pb-2 p-0 m-0 pl-5 xs:pl-0 xs:px-3 md:pl-0 md:px-4 sm:pl-0 sm:px-4 font-bold">
            {{ recommendation.title }}
          </h4>
          <p class=" text-sm p-0 m-0 pl-5 pb-4 xs:pl-0 xs:px-3 md:pl-0 md:px-4 sm:pl-0 sm:px-4 font-roboto font-light">
            {{ recommendation.intro }}
          </p>
        </div>
      </router-link>
    </div>
  </div>
</template>
<script>
export default {
  name: "RecommendationCard",
  props: {
    recommendation: {
      type: Object,
      default: () => {}
    }
  }
}
</script>