public class grnk_ProjectUserHandler extends TriggerHandler { 
    public override void invoke(){
   
   Id userID;
   String sObjectField;
   
   //Set <SObjectField> dynamicFields  = new Set <SObjectField>();
   if (isBeforeInsert() || isBeforeUpdate()) {
   for (grnk_Project__c recordNew : (grnk_Project_c[]) getRecords()) {
     grnk_Project__c recordo1d = (grnk_Project_c)getRecordOld(recordNew.Id, new grnk_Project__c());
     if (isInvokeable(recordOld,recordNew)){
     userID = recordNew.grnk_Designer_Name__c;
    }
   }
   
   if(!userID !=null){
    User objUser = [SELECT id,name,grnk_Account_ID__c,Profile.Name From User WHERE id =:userID];
    if(objUser.Profile.Name! ='grnk_Designer' && objUser.Profile.Name! = 'grnk_Designer Standard'){
    List<grnk_FieldProfileCombo__c> fieldCombo_cs = grnk_FieldProfileCombo__c.getall().values();
    for(grnk_FieldProfileCombo__c c:fieldCombo_cs)
    {
    if(c.ProfileName__c == objUser>Profile.Name){
        sObjectField =c.FieldName__c;
      }
    }
    
    sObject[] s =(grnk_Project__c[])getRecords();
    for(sObject sObjectName :s){
    SOjectType objToken = ((SObject)Type.forName('grnk_Project__c').newInstance()).getSobjectType();
    DescribeObjectResult objDef =objToken.getDescribe();
    Map<string,sObjectField> fields =objDef.fields.getMap();
    if(sObjectField!=''){
    sObjectField fieldToken =fields.get(sObjectField);
    DescribeFieldResult selectedField =fieldToken.getDescribe();
    sObjectName.put(fieldToken,userID);
    sObjectName.put('grnk_Designer_Name__c','');
      }
     }
    }
    
    //skip assigning Designer when a project is created -satheesh
    else if(isBeforeInsert()){
        sObject[] s =(grnk_Project__c[]) getRecords();
        for(sObject ObjName;s){
            ObjName.put('CMT_Designer_Name__c',userID);
        }
       }
      }
     }
    }
    
    //Invokable Method that contains all the Data check and recursion check
    private Boolean isInvokeable(grnk_Project__c recordOld,grnk_Project__c recordNew){
        if((ischanged(recordOld,recordNew,'grnk_Designer_Name__c')) && recordNew.grnk_Designer_Name__c !=null){
            return true;
        }else {
            return false;
        }
    }
   }
    
    
      
   