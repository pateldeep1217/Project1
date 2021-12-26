import { LightningElement, wire,api,track } from 'lwc';
import STUDENTS_ENROLLED from '@salesforce/schema/Student_Enrolled_In_Class__c';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import CUSTOMER_ACCOUNT_FIELD from '@salesforce/schema/Student_Enrolled_In_Class__c.Customer_Account__c';
import LIVE_CLASS_FIELD from '@salesforce/schema/Student_Enrolled_In_Class__c.Live_Class__c';
import CONTACT_FIELD from '@salesforce/schema/Student_Enrolled_In_Class__c.Contact__c';


import {getRecord} from 'lightning/uiRecordApi';

import USERID from '@salesforce/user/Id';



export default class EnrolledInClass extends LightningElement {
    userId = USERID;
    // userName = USERName;

    @api liveclassList;
    @track userDetail

    // renderedCallback(){
    //     const inputFields = this.template.querySelectorAll('lightning-input-field');

    //     if(inputFields){
    //         inputFields.forEach(field=>{
    //             if(field.fieldName == {CUSTOMER_ACCOUNT_FIELD}){
    //                 field.value = this.userDetail.Name.value;
    //                 console.log(field.value);
    //             }
    //             if(field.fieldName == {LIVE_CLASS_FIELD}){
    //                 field.value = this.liveclassList;
    //                 console.log(field.value);
    //             }
    //         })
    //     }
    // }

    @wire(getRecord,{recordId:USERID, fields:['User.Name', 'User.Email']})
    studentEnrollHandler({data, error}){
        if(data){
            this.userDetail = data.fields;
            console.log(data);

        }
        if(error){
            console.log(error);
        }
    }




    StudentEnrolledObj = STUDENTS_ENROLLED;
    fields = {accountFeild: CUSTOMER_ACCOUNT_FIELD, liveclassField: LIVE_CLASS_FIELD, contactField: CONTACT_FIELD};
    
    handleSuccess(){
        const evt = new ShowToastEvent({
            title: 'You are Enrolled',
            variant: 'success',
        });
        this.dispatchEvent(evt);

    }

    handleClose(){
        const closeEvent = new CustomEvent('close');
        this.dispatchEvent(closeEvent);
    }

















































 
    // formFields={}
    // changeHandler(event){
    //     const {name, value} = event.target; 
    //     this.formFields[name]= value;
        
    // }
    // enrollStudent(){
    //     const recordInput = {apiName: STUDENTS_ENROLLED.objectApiName, fields:this.formFields}
    //     createRecord(recordInput).then(result =>{
    //         this.showToast('Succes', `You are enrolled ${result.Id}`);
    //         this.template.querySelector('form.createForm').reset();
    //         this.formFields={};
    //     }).catch(error=>{
    //         this.showToast('Error Creating record', error.body.message,'error');
    //     })
    // }

    // showToast(title,message,variant){
    //     this.dispatchEvent(new ShowToastEvent({
    //         title,
    //         message,
    //         variant: variant||'succes'
    //     }))
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