import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/ApexController.getAccounts';
import getLiveClasses from '@salesforce/apex/ApexController.getLiveClasses';
export default class ControllerExample extends LightningElement {
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