<template>
    <div class="w-50 mx-auto">
        <p>Do you want these recommendations via email ?</p>
        <div class="mb-3">
            <div class="flex border-1 border-solid border-grey-light rounded-lg overflow-hidden">
                <div class="w-65">
                    <input v-model="form.email" class="form-input border-none px-3 py-2 text-base h-auto min-h-auto shadow-none" placeholder="Email">
                </div>
                <div class="w-35">
                    <button @click="save" class="w-100 btn btn-primary py-2 text-base rounded-lg ">Submit</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Form from "../../utilities/Form";
    export default {
        name: "UserEmail",
        data(){
            return {
                form: new Form({
                    email:''
                })
            }
        }, methods:{
            save(){

            }
        }
    }
</script>