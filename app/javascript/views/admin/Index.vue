<template>
    <div>
     lewis
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
         User.index().then(({data}) => {
        this.users = data
        console.log(data)
      })
            },getQuestions(){
               Question.index().then(({data}) =>{
                    this.questions = data
                    console.log(data)
                })
            }
    }
}
</script>