<template>
    <div>
        <div class="text-center">
            <h2>Hi {{user.name}}</h2>
            <h3>Start learning</h3>

        </div>
        <div class="flex">
           <div class="w-50 center">
               <div class="mt-4 b-2 bg-blue-darker w-25 h-100% center r-5">
              Iteration
               </div>
           </div>
            <div class="w-50">
                <div class="mt-4 b-2 bg-grey-lighter w-25 h-100% center r-5">
                   <i class="fas fa-times-circle"></i>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

    import User from "../models/User";

    export default {
        name: "Home",
        data() {
            return {
                user: {}
            }
        }, methods: {
            getUser() {
                User.show(this.$route.params.user_slug, (data) => {
                    this.user = data
                });
            }
        }, mounted() {
            this.getUser();
        }
    }
</script>

<style scoped>

</style>