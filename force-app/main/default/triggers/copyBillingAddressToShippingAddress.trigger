trigger copyBillingAddressToShippingAddress on Account (before insert, before update) {
        for(account a: trigger.new){
        if(a.Copy_Billing_Address_to_Shipping_Address__c){
            a.ShippingStreet = a.BillingStreet;
            a.ShippingCity = a.BillingCity;
            a.ShippingCountry = a.BillingCountry;
        }
    }
}