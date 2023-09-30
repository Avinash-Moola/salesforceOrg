import { LightningElement } from 'lwc';
import ADMIN from '@salesforce/resourceUrl/Administrator';
import APPBUILD from '@salesforce/resourceUrl/AppBuilder';
import PD1 from '@salesforce/resourceUrl/PlatformDeveloper1';

export default class CertificationsComponent extends LightningElement {
    admin = ADMIN;
    appBuilder = APPBUILD;
    pd1 = PD1;
}