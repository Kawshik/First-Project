import { LightningElement, wire } from 'lwc';
import getAllCustomers from '@salesforce/apex/CustomerDetailsController.getAllCustomers';
export default class CustomerDetailsComponent extends LightningElement {

    customerDetails;
	error;

	connectedCallback() {
		this.loadCustomers();
	}
	
	loadCustomers() {
		getAllCustomers()
			.then(result => {
				this.customerDetails = result;
			})
			.catch(error => {
				this.error = error;
			});
	} 
}