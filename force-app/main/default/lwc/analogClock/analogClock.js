import { LightningElement } from 'lwc';

export default class AnalogClock extends LightningElement {
    connectedCallback() {
        setInterval(() => {
          const date = new Date();
          const seconds = date.getSeconds();
          const minutes = date.getMinutes();
          const hours = date.getHours() % 12;
          const hourAngle = (hours * 30) + (minutes * 0.5);
          const minuteAngle = minutes * 6;
          const secondAngle = seconds * 6;
          const hourHand = this.template.querySelector(".hour");
          const minuteHand = this.template.querySelector(".minute");
          const secondHand = this.template.querySelector(".second");
          hourHand.setAttribute("transform", `rotate(${hourAngle}, 50, 50)`);
          minuteHand.setAttribute("transform", `rotate(${minuteAngle}, 50, 50)`);
          secondHand.setAttribute("transform", `rotate(${secondAngle}, 50, 50)`);
        }, 1000);
      }
}