import { LightningElement, wire, api, track } from 'lwc';
import LiveClassObj from '@salesforce/apex/LiveClassController.getClassList';

import liveimg from '@salesforce/resourceUrl/liveclass';


export default class LiveClass extends LightningElement {
    
    classByName
    @api liveclasslist = '';
    img = liveimg;
    showModal = false;
    @api value
    searchKey 


    @wire(LiveClassObj,{searchKey:'$searchKey'})
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




    handleSearchKeyChange(event){
        this.searchKey = event.target.value
        console.log(this.searchKey);
    }

    handleClickClass(event){
        this.searchKey = event.target.value;
        console.log(event.target.value);
        LiveClassObj({searchKey:this.searchKey}).then(results=>{
            this.liveclasslist = results.map(item=>{
                let totalStudents = item.Total_Students__c > 0 ? item.Total_Students__c : 0;
                return {...item, totalStudents};
            });
        }).catch(error=>{
            console.error(error);
        })
    }

    
}