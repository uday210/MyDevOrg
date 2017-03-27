public class EinsteinvisionService_ctrl{




    @AuraEnabled
    public Static String EinsteinvisionDataSync(String ZipfilePath){

        EinsteinvisionCalloutLayer.EinsteinvisionDataSyncCallout(ZipfilePath);
    
       return null;
    }
    
 
    @AuraEnabled
    public static AllDataSetsEienstein getAlldataSets(){
    
       
        Http h =new Http();  
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://api.metamind.io/v1/vision/datasets');
        req.setHeader('Authorization','Bearer '+system.label.EinsteinvisionToken);
        
        HttpResponse res = h.send(req);
        
        System.debug('>>>>>>>> checking Request Data <<<<<<<<<');
        System.debug( res.getBody());
       return( AllDataSetsEienstein.parse(res.getBody()));
    }


}