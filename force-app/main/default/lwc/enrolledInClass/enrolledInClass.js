import { LightningElement, wire,api } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import STUDENTS_ENROLLED from '@salesforce/schema/Student_Enrolled_In_Class__c';

import { getRecord } from 'lightning/uiRecordApi';
import CUSTOMER_ACCOUNT_FIELD from '@salesforce/schema/Student_Enrolled_In_Class__c.Customer_Account__c';
import LIVE_CLASS_FIELD from '@salesforce/schema/Student_Enrolled_In_Class__c.Live_Class__c';

import CONTACT_FIELD from '@salesforce/schema/Student_Enrolled_In_Class__c.Contact__c';



export default class EnrolledInClass extends LightningElement {
    @api liveclassList
    studentsEnrolledObj = STUDENTS_ENROLLED;
    fields = {
        accountFeild:CUSTOMER_ACCOUNT_FIELD, 
        liveclassField: LIVE_CLASS_FIELD, 
        contactField: CONTACT_FIELD
    };
    
    handleSuccess(event){
        console.log(event.detail.id);
        const evt = new ShowToastEvent({
            title: 'You are Enrolled In Class',
            message: 'Record ID: ' + event.detail.id,
            variant: 'success',
        });
        this.dispatchEvent(evt);

    }

    handleClose(){
        const closeEvent = new CustomEvent('close');
        this.dispatchEvent(closeEvent);
    }

    // @api recordId

    // @wire(getRecord,{recordId:'$recordId', fields:[CUSTOMER_ACCOUNT_FIELD, LIVE_CLASS_FIELD]})
    // studentEnrollHandler({data}){
    //     if(data){
    //         console.log(data);
    //     }
    // }




    // defaultRecordTypeId;

    // @wire(getObjectInfo,{objectApiName :STUDENTS_ENROLLED})
    // studentEnrolledObj({data,error}){
    //     if(data){
    //         console.log(data);
    //         this.defaultRecordTypeId = data.defaultRecordTypeId
    //     }
    //     if(error){
    //         console.log(error);
    //     }
    // }
}