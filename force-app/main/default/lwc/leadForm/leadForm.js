import { LightningElement, api } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import LeadObj from '@salesforce/schema/Lead';
import LeadFirstName from '@salesforce/schema/Lead.FirstName';
import LeadLastName from '@salesforce/schema/Lead.LastName';
import LeadCompany from '@salesforce/schema/Lead.Company';


export default class LeadForm extends LightningElement {

    LeadObject = LeadObj;
    fields = [LeadFirstName, LeadLastName, LeadCompany];
    
    handleSuccess(event){
        console.log(event.detail.id);
        const evt = new ShowToastEvent({
            title: 'Lead created',
            message: 'Record ID: ' + event.detail.id,
            variant: 'success',
        });
        this.dispatchEvent(evt);

    }


}