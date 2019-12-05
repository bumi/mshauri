<template>
    <div>
        <p><label v-bind:class="{'radiocontainer': !isMultiple, 'checkcontainer': isMultiple}">
                  <span class="text-lg">{{answer.value}}</span>
                   <input v-if="!isMultiple" type="radio" name="answer"
                                   v-on:input="updateRadio" :value="answer.id">

                            <input v-if="isMultiple" type="checkbox" name="answer"
                                   v-model="checkbox" :value="answer.id">

                            <span v-bind:class="{'radiomark': !isMultiple, 'checkmark': isMultiple}"></span>
                        </label>
        </p>
        <div v-if="answer.input && (checkbox || radioInput)" class="border-1 border-solid border-grey relative my-4 z-40 w-50 ">
            <label class="my-0 absolute z-99 bg-white px-2 mx-2 text-black text-xs line-height-small" style="top: -25%;">Value</label> 
            <input v-model="other" type="text" name="other" required="required" placeholder="" class="form-input my-0 border-none text-black relative px-3 shadow-none pb-1 pt-2 rounded-none bg-transparent">
        </div>
    </div>
</template>

<script>
 export default {
        name: "Answer",
        props:{
            answer: {
                type: Object,
                default: () =>{
                    return {}
                }
            },
            isMultiple: {
                type: Boolean,
                default: false
            }, value: {
                type: Object,
                default: () =>{
                    return {}
                }
            },
        },
        data() {
          return{
              other: '',
              radioInput: '',
              checkbox: ''
          }
        },
        methods:{
            updateData(){
                if(this.checkbox || this.radioInput){
                   return this.$emit('input',{
                        answer_id: this.answer.id,
                        value: this.other
                    });
                }
                this.$emit('input');
            },updateRadio(){
                this.radioInput = true;
                this.updateData();
            }
        },watch:{
            checkbox: function (val){
                this.updateData();
            },
            other: function(val){
                this.updateData();
            }, value: function(val){
                if(!this.isMultiple && (!val || val.answer_id != this.answer.id)){
                    this.radioInput = '';
                }
            }
        }
}
</script>