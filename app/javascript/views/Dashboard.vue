<template>
    <div class="bg-white w-80 mx-auto">
        <div class="p-5">
                <h4>Thanks {{user.name}} for completing the questionnaire.</h4>
        </div>
    </div>
</template>

<script>
    import User from "../models/User";

    export default {
        name: "Dashboard",
        data() {
            return {
                user: {}
            }
        },mounted() {
            User.show((data) => {
                this.user = data
            });
        }
    }
</script>

<style scoped>

</style>