import ActivityDate from '@salesforce/schema/Task.ActivityDate';
import { LightningElement } from 'lwc';

export default class ForEachExample extends LightningElement {
    Contacts = [
        {ID: 1, Name: "Avi" , Title : "Husband"},
        {ID : 2, Name: "Sony", Title: "Wife"},
        {ID : 3, Name: "Xeon", Title: "Son"}
    ]
}