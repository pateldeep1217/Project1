import { LightningElement, wire } from 'lwc';

export default class HelloWorld extends LightningElement {

    fullName = "Deep Patel";
    title = 'Student'
    
    changeHandler(event){
        this.title = event.target.value;
        
    }

    address={
        city:'Melbourne',
        postcode: 3008,
        country:'Australia'
    }

}