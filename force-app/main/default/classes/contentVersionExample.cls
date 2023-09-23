public class contentVersionExample {
    
    public static void uploadTextFile(){
        string sampleText = 'Hi, this is some sample text to save in text 0file created by content version';
        
        // inserting with help of Content Version
        contentVersion cv = new contentVersion();
        cv.ContentLocation = 'S';				// S,E,L (With in Salesforce, External, Social network)
        cv.Title = 'Sample Text File';			// The title of a document 
        cv.PathOnClient = cv.Title + '.txt';	// name of file and its format to save (.txt .pdf .xlsx etc)
        cv.VersionData = Blob.valueOf(sampleText);	// Converting in to Blob format from plain text
        insert cv;
        
        // Linking to record using Content Document Link
        
        id cdId = [select contentDocumentId from contentVersion where id = :cv.id].contentDocumentId;
        
        contentDocumentLink cdLink = new contentDocumentLink();
        cdLink.ContentDocumentId = cdId;
        cdLink.LinkedEntityId = '0015i00000Um4yPAAR';	// id of the record to which you want to link, it should be dynamic, dont hard code it
        cdLink.Visibility = 'AllUsers';	// AllUsers, InternalUsers, SharedUsers
        cdLink.ShareType = 'V';		// V,C,I (only View, View & Edit, user’s permission is determined by the related record)
        insert cdLink;
    }
}