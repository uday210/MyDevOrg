public class EinsteinvisionCalloutLayer{




    public Static String EinsteinvisionDataSyncCallout(String ZipfilePath){
    
        Http h = new Http();
        
        HttpRequest req = createHttpRequest('POST','https://api.metamind.io/v1/vision/datasets/upload/sync');
        
      //  String bodyString = 'path:'+ZipfilePath;
      
    String bodyString  = 'path=https://metamind.io/images/mountainvsbeach.zip';
        
        //  Compose the form
        string form64 = '';

        form64 += HttpFormBuilder.WriteBoundary();
      //  form64 += HttpFormBuilder.WriteBodyParameter('modelId', EncodingUtil.urlEncode(model, 'UTF-8'));
        form64 += HttpFormBuilder.WriteBoundary();
     
         form64 += HttpFormBuilder.WriteBodyParameter('path', 'https://metamind.io/images/mountainvsbeach.zip');
        form64 += HttpFormBuilder.WriteBoundary(HttpFormBuilder.EndingType.CrLf);

        blob formBlob = EncodingUtil.base64Decode(form64);
            string contentLength = string.valueOf(formBlob.size());
             req.setHeader('Connection', 'keep-alive');
        req.setHeader('Content-Length', contentLength);
       
       req.setBodyAsBlob(formBlob);
        
        HttpResponse res = h.send(req);
        
        System.debug('>>>>>>>> checking Request Data <<<<<<<<<');
        System.debug(res);
    
        return null;
    }
    
    
    
    
    
    public static HttpRequest createHttpRequest(String calloutMethod,String CalloutEndpoint){
    
    
        HttpRequest req = new HttpRequest();
        req.setMethod(calloutMethod);
        req.setEndpoint(CalloutEndpoint);
        req.setHeader('Authorization','Bearer '+System.Label.EinsteinvisionToken);
        req.setHeader('Cache-Control','no-cache');
       // req.setHeader('Content-Type','multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW');
    
    
        return req;
    
    }


}