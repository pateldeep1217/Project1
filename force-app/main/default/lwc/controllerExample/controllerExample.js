import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/ApexController.getAccounts';
import {getRecord} from 'lightning/uiRecordApi';
import getLiveClasses from '@salesforce/apex/ApexController.getLiveClasses';

import Id from '@salesforce/user/Id';


export default class ControllerExample extends LightningElement {

    
    userId = Id;

    @wire(getRecord, {recordId:'0055f000005NTAjAAO', fields:['User.Name', 'User.Email']})
    userDetailHandler({data,error}){
        if(data){
            this.userDetail = data.fields;
        }
        if(error){
            console.error(error);
        }
    }



    @wire(getAccounts)
    accounts

   liveClasses
    @track error;
    
    handleLoad() {
        getLiveClasses()
            .then(result => {
                this.liveClasses = result;
            })
            .catch(error => {
                // this.liveClasses = error;
                console.log(error);
            });
    }

    // connectedCallback(){
    //     console.log(this.accounts.data);
    //     console.log('Hello');
    // }



}