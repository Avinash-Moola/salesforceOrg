import { LightningElement } from 'lwc';
import alarm from '@salesforce/resourceUrl/alarm2'
import alarmRing from '@salesforce/resourceUrl/alarm'

export default class AlarmClock extends LightningElement { 
    clockImage = alarm
    ringtone = new Audio(alarmRing)
    currentTime = ''
    hours =[]
    minutes = []
    meridiems =['AM', 'PM']
    alarmTime
    isAlarmSet = false
    isAlarmTriggered = false
    dateToDay
    hourSelected
    minSelected
    meridiemSelected
  
    get isFieldNotSelected(){
      return !(this.hourSelected && this.minSelected && this.meridiemSelected)
    }

    get shakeImage(){
        return this.isAlarmTriggered ? 'shake':''
      }
  
    connectedCallback(){
      this.createHoursOptions()
      this.createMinutesOptions()
      this.currentTimeHandler()
    }
    currentTimeHandler(){
      setInterval(()=>{
        let dateTime = new Date()
        let hour = dateTime.getHours()//getHours() returns the hour (0 to 23) of a date.
        let min = dateTime.getMinutes()
        let sec = dateTime.getSeconds()
        const weekday = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
        let day = weekday[dateTime.getDay()]
        const monthList = ["January","February","March","April","May","June","July","August","September","October","November","December"];
        let month = monthList[dateTime.getMonth()]
        let year = dateTime.getFullYear()
        let dat = dateTime.getDate()
        let ampm = "AM"
        if(hour == 0){
          hour = 12
        } else if(hour >=12){
          hour = hour - 12
          ampm = "PM"
        }
        hour = hour<10 ? "0"+hour : hour
        min = min<10 ? "0"+min : min
        sec  = sec<10 ? "0"+sec : sec
    
        this.currentTime = `${hour}:${min}:${sec} ${ampm}`
        if(this.alarmTime === `${hour}:${min} ${ampm}`){
          console.log("Alarm Triggered!!")
          this.isAlarmTriggered = true
          this.ringtone.play()
          this.ringtone.loop = true
        }

        this.dateToDay = day + ', '+dat+' '+month+' '+ year
  
      }, 1000)
    }
  
    createHoursOptions(){
      for(let i = 1; i<=12; i++){
        let val = i<10 ? "0"+i : i
        this.hours.push(val)
      }
    }
    createMinutesOptions(){
      for(let i = 0; i<=59; i++){
        let val = i<10 ? "0"+i : i
        this.minutes.push(val)
      }
    }
  
    optionhandler(event){
      const {label, value} = event.detail
      if(label === "Hour(s)"){
        this.hourSelected = value
      } else if(label === "Minute(s)"){
        this.minSelected = value
      } else if(label === "AM/PM"){
        this.meridiemSelected = value
      } else {}
  
      console.log(" this.hourSelected",  this.hourSelected)
      console.log(" this.minSelected",  this.minSelected)
      console.log(" this.meridiemSelected",  this.meridiemSelected)
    }
  
    setAlarmHandler(){
      this.alarmTime = `${this.hourSelected}:${this.minSelected} ${this.meridiemSelected}`
      if(this.hourSelected !=null && this.minSelected != null && this.meridiemSelected !=null){
        this.isAlarmSet = true

      }
    }
    clearAlarmHandler(){
      this.alarmTime = ''
      this.isAlarmSet = false
      const elements = this.template.querySelectorAll('c-clock-dropdown')
      Array.from(elements).forEach(element=>{
        element.reset("")
        this.hourSelected =null 
        this.minSelected = null 
        this.meridiemSelected =null
        this.isAlarmTriggered = false
        this.ringtone.pause()
      })
    }
}