import { LightningElement, api } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import LeadObj from '@salesforce/schema/Lead';
import LeadFirstName from '@salesforce/schema/Lead.FirstName';
import LeadLastName from '@salesforce/schema/Lead.LastName';
import LeadCompany from '@salesforce/schema/Lead.Company';




import CUSTOMER_ACCOUNT_FIELD from '@salesforce/schema/Student_Enrolled_In_Class__c.Customer_Account__c';
import LIVE_CLASS_FIELD from '@salesforce/schema/Student_Enrolled_In_Class__c.Live_Class__c';
import CONTACT_FIELD from '@salesforce/schema/Student_Enrolled_In_Class__c.Contact__c';
import STUDENTS_ENROLLED from '@salesforce/schema/Student_Enrolled_In_Class__c';


export default class LeadForm extends LightningElement {

    StudentEnrolledObj = STUDENTS_ENROLLED;
    fields = [CUSTOMER_ACCOUNT_FIELD, LIVE_CLASS_FIELD, CONTACT_FIELD];
    
    handleSuccess(event){
        console.log(event.detail.id);
        const evt = new ShowToastEvent({
            title: 'Enrolled',
            message: 'Record ID: ' + event.detail.id,
            variant: 'success',
        });
        this.dispatchEvent(evt);

    }


}


// export default class LeadForm extends LightningElement {

//     LeadObject = LeadObj;
//     fields = [LeadFirstName, LeadLastName, LeadCompany];
    
//     handleSuccess(event){
//         console.log(event.detail.id);
//         const evt = new ShowToastEvent({
//             title: 'Lead created',
//             message: 'Record ID: ' + event.detail.id,
//             variant: 'success',
//         });
//         this.dispatchEvent(evt);

//     }


// }