public class FKartData {
    @AuraEnabled
    public Static list<ProductWrapper>  fromFkart(String Query){ 
   System.debug('>>>>>>>>>>>>>>>>>> Query '+Query);
        
       
    Http h = new Http();
 HttpRequest request = new HttpRequest();
	
request.setEndpoint('https://affiliate-api.flipkart.net/affiliate/search/json?query='+Query+'&resultCount=100');
request.setMethod('GET');
request.setHeader('Fk-Affiliate-Id','udaykiran16');
request.setHeader('Fk-Affiliate-Token','2e7dac1211964179b172c1321c66d1a8');

        
        HttpResponse res = h.send(request);
      //  return res.getBody();
        
         return convertdata( flipkartserachparser.parse(res.getBody()));

       // return 'grrr';
    }
     @AuraEnabled
    public static list<ProductWrapper > Allpro {get;set;}
        
    @AuraEnabled
    public static list<ProductWrapper > convertdata(flipkartserachparser passeddata){
        
       
        Allpro = new list<ProductWrapper >();
        for(flipkartserachparser.productInfoList pdlist: passeddata.productInfoList){
            ProductWrapper pw = new ProductWrapper();
            pw.ProductImage = pdlist.ProductBaseInfo.productAttributes.imageUrls.unknown;
            pw.ProductPrice = pdlist.ProductBaseInfo.productAttributes.MaximumRetailPrice.amount;
            pw.ProductName =  pdlist.ProductBaseInfo.productAttributes.productUrl;
            
            Allpro.add(pw);
        }
        
        return Allpro;
        
    }

}