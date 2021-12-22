import { LightningElement, wire, api, track } from 'lwc';
import LiveClassObj from '@salesforce/apex/LiveClassController.getClassList';

import liveimg from '@salesforce/resourceUrl/liveclass';

export default class LiveClass extends LightningElement {
    

    @api liveclasslist = '';
    img = liveimg;
    showModal = false;
    @api value


    @wire(LiveClassObj)
    liveclassHandler({data, error}){
        if(data){
            this.liveclasslist = data.map(item=>{
                let totalStudents = item.Total_Students__c > 0 ? item.Total_Students__c : 0;
                return {...item, totalStudents};
            });
        }
        if(error){
            console.log(error);
        }
    }
    handleClick(event){
        this.showModal = true;
        this.value = event.target.dataset.name;
       

    }
    handleClose(){
        this.showModal = false;
    }


    liveclassValue(event){
        console.log(event.target.value);
    }

   

    
}