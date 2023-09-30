import { LightningElement } from 'lwc';
import skills from '@salesforce/resourceUrl/skills';

export default class SkillsComponent extends LightningElement {
    html = skills +`/html.png`
    css = skills +`/css.png`
    js = skills +`/js.png`
    ant = skills +`/ant.png`
    pml = skills +`/pml.png`
    database = skills +`/database.png`
    sql = skills +`/sql.png`


    skillsList = [
        {
            Id: 1,
            src: this.html
        },
        {
            Id: 2,
            src: this.css
        },
        {
            Id: 3,
            src: this.js
        },
          
        {
            Id: 4,
            src: this.ant
        },
        
        {
            Id: 5,
            src: this.pml
        },
        {
            Id: 6,
            src: this.database
        },
        {
            Id: 7,
            src: this.sql
        },
      ];
    
}