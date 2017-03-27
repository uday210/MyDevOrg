global class send_emailfromPostMark{


global static void  send_email(String toaddress,String Subject,String HtmlBody,String cont,String fname){



blob csvBlob = Blob.valueOf(cont);   
String encodedString = EncodingUtil.base64Encode(csvBlob);


Http http = new Http();
Httprequest req = new Httprequest();
req.setEndpoint('https://api.postmarkapp.com/email');
req.setMethod('POST');
req.setHeader('X-Postmark-Server-Token','50c8c629-c534-4541-95a0-071ee7c433f4');
req.setHeader('Accept','application/json');
req.setHeader('Content-Type','application/json');
JSONGenerator gen = JSON.createGenerator(true);
gen.writeStartObject();
gen.writeStringField('From','udaykiran.bussa@globalnest.com');
gen.writeStringField('To',toaddress);
gen.writeStringField('Subject', Subject);
 gen.writeStringField('HtmlBody',HtmlBody);
 gen.writeFieldName('Attachments');
 gen.writeStartArray();
 gen.writeStartObject();
gen.writeStringField('Name',fname);
gen.writeStringField('Content',encodedString);
gen.writeStringField('ContentType','text/csv');
gen.writeEndObject();
gen.writeEndArray();
gen.writeEndObject();
req.setBody(gen.getAsString());
HttpResponse res = new HttpResponse();
res= http.send(req);
System.debug(res.getbody());

}





global static void  sendemail(String toaddress,String Subject,String HtmlBody,String cont,String fname){

/*String cont = 'name,id\n';
for(Integer i=0;i<10;i++){
cont+= 'uday '+i+','+'i\n';
}*/

//blob csvBlob = Blob.valueOf(cont);   
//String encodedString = EncodingUtil.base64Encode(csvBlob);

String  encodedString = cont;

Http http = new Http();
Httprequest req = new Httprequest();
req.setEndpoint('https://api.postmarkapp.com/email');
req.setMethod('POST');
req.setHeader('X-Postmark-Server-Token','50c8c629-c534-4541-95a0-071ee7c433f4');
req.setHeader('Accept','application/json');
req.setHeader('Content-Type','application/json');
JSONGenerator gen = JSON.createGenerator(true);
gen.writeStartObject();
gen.writeStringField('From','udaykiran.bussa@globalnest.com');
gen.writeStringField('To',toaddress);
gen.writeStringField('Subject', Subject);
 gen.writeStringField('HtmlBody',HtmlBody);
 gen.writeFieldName('Attachments');
 gen.writeStartArray();
 gen.writeStartObject();
gen.writeStringField('Name',fname);
gen.writeStringField('Content',encodedString);
gen.writeStringField('ContentType','text/csv');
gen.writeEndObject();
gen.writeEndArray();
gen.writeEndObject();
req.setBody(gen.getAsString());
HttpResponse res = new HttpResponse();
res= http.send(req);
System.debug(res.getbody());

}

}