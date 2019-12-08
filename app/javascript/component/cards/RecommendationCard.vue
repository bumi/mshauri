<template>
  <div class="card card-default h-100 w-30 mx-2 my-3 shadow  rounded-t-lg">
    <router-link
      tag="div"
      class="cursor-pointer"
      :to="{name: 'recommendation-show', params:{id: recommendation.id, title: recommendation.title}}"
    >
      <div class="w-90 font-primary mx-auto">
        <h5 class="font-bold text-base">
          {{ recommendation.title }}
        </h5>
        <div class="my-3 text-left">
          <div>
            {{ recommendation.description }}
          </div>
        </div>
      </div>
      <div class="text-right w-90  my-4 text-blue cursor-pointer">
        <span class="text-sm">Read more</span>
      </div>
    </router-link>
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