trigger phoneNumberFormat on Account (before insert, before update) {
    for (account a : Trigger.new) {
        if (a.Phone != null && a.Phone != '') {
            
            try {
                a.Phone = a.Phone.replaceAll('[^0-9]', '');
            } catch (Exception e) {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'An error occurred while standardizing the phone number: ' + e.getMessage()));
            }
        }
    }
}