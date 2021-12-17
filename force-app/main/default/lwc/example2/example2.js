import { LightningElement } from 'lwc';
import template1 from './template1.html';
import template2 from './template2.html';

import example2 from './example2.html';

export default class Example2 extends LightningElement {

    selectedBtn = '';


    render(){
        return this.selectedBtn === 'Signup' ? template2 : this.selectedBtn == 'Signin' ?  template1 : example2;
    }


    handleClick(event){
        this.selectedBtn = event.target.label;
    }
}