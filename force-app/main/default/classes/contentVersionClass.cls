public class contentVersionClass {
	
    public static void uploadFile(Blob data, string title, string fileExtension, string recordId){
        contentVersion cv = new contentVersion();
        cv.ContentLocation = 'S';
        cv.Title = title;
        cv.PathOnClient = title + fileExtension;
        cv.VersionData = data;
        insert cv;
        
        id cdId = [select contentDocumentId from contentVersion where id = :cv.id].contentDocumentId;
        
        contentDocumentLink cdLink = new contentDocumentLink();
        cdLink.ContentDocumentId = cdId;
        cdLink.LinkedEntityId = recordId;
        cdLink.ShareType = 'V';
        cdLink.Visibility = 'AllUsers';
        insert cdLink;
    }
}