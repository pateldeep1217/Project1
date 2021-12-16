import { LightningElement } from 'lwc';

export default class Example1 extends LightningElement {

    selected={}
    correctAnswers = 0;
    myQuestions=[
        {
            id:'Question1',
            question:'Which one of the folowing is not a template loop',
            answers:{
                a:'for:each',
                b:'iterator',
                c:'map loop'
            },
            correctAnwer:'c'
        },
        {
            id:'Question2',
            question:'Which of the file is invalid in LWC Component folder',
            answers:{
                a:'.svg',
                b:'.apex',
                c:'.js'
            },
            correctAnwer:'b'
        },
        {
            id:'Question3',
            question:'Which one of the following is not a directive',
            answers:{
                a:'for:each',
                b:'if:true',
                c:'@track'
            },
            correctAnwer:'c'
        }
    ]

    get allNotSelected(){
        return !(Object.keys(this.selected).length === this.myQuestions.length )
    }
    changeHandler(event){
        console.log('Name', event.target.name);
        console.log('Value', event.target.value);
        const {name, value} = event.target;
        this.selected = {...this.selected, [name]:value}
    }


    submitHandler(event){
        event.preventDefault();
        let correct = this.myQuestions.filter(item=>this.selected[item.id] === item.correctAnwer);

        this.correctAnswers = correct.length;
        console.log(this.correctAnswers);

    }

    resetHandler(event){
        this.selected = {};
        this.correctAnswers = 0;
    }
}