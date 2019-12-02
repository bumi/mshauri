<template>
    <div>
        <div class="text-center">
            <h2>Hi {{user.name}}</h2>
            <h3>Start learning</h3>
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
                User.show((data) => {
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