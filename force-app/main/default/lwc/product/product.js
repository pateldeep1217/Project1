import { LightningElement, wire } from 'lwc';
import getProducts from '@salesforce/apex/Product.getProduct';


export default class Product extends LightningElement {

    headings = ["Product Name", "Price", "Product Descritpion"];

    fullTableData;
    searchKey 

    @wire(getProducts,{searchKey:'$searchKey'})
    productHandler({data,error}){
        if(data){
           
            this.fullTableData = data
            console.log(this.fullTableData);

        }
        if(error){
            console.log(error);
        }
    }

    handleSearchKeyChange(event){
        this.searchKey = event.target.value
        console.log(this.searchKey);
    }

  

    
}