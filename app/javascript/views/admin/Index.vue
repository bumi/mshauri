<template>
    <div>
     
    </div>
</template>

<script>
import Question from "../../models/Question";
import User from "../../models/User"  

export default {
    name: 'AdminIndex',
    data(){
        return {
            users:[],
            questions:[],
        }
    },methods:{
            getUsers(){
           User.index().then(({ data }) => {
        this.users = data
      })
            },getQuestions(){
               Question.index().then(({ datat}) =>{
                    this.questions = data
                    console.log(data)
                })
            }
    }
}
</script>