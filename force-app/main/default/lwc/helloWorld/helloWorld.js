import { LightningElement, wire } from 'lwc';

export default class HelloWorld extends LightningElement {

    fullName = "Deep Patel";
    title = 'Student'
    filterValue = 'Change the value'
    changeHandler(event){
        this.title = event.target.value;
        
    }

    address={
        city:'Melbourne',
        postcode: 3008,
        country:'Australia'
    }
    
    filterHandler(event){
        this.filterValue = event.target.value;
        console.log(event.target);
        console.log(filterValue);

    }
}