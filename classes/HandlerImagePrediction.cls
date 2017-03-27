public class HandlerImagePrediction implements BotHandler {



public BotResponse handle(String utterance, String[] params, Map<String, String> session) {


      if (session == null) {
            session = new Map<String, String>();
            session.put('nextCommand', 'HandlerImagePrediction');
            session.put('step', 'askForImage');
            return new BotResponse(new BotMessage('Bot', 'yes Please enter image URL '), session);
        }
           String step = session.get('step');
        if (step == 'askForImage') {
         ContentVersion base64Content = [SELECT Title, VersionData FROM ContentVersion where Title='predictive_services' LIMIT 1];
        String keyContents = base64Content.VersionData.tostring();
        keyContents = keyContents.replace('-----BEGIN RSA PRIVATE KEY-----', '');
        keyContents = keyContents.replace('-----END RSA PRIVATE KEY-----', '');
        keyContents = keyContents.replace('\n', '');

        //Get a new token
        JWT jwt = new JWT('RS256');
        // jwt.cert = 'JWTCert'; // Uncomment this if you used a Salesforce certificate to sign up for a Predictive Services account
        jwt.pkcs8 = keyContents; // Comment this if you are using jwt.cert
        jwt.iss = 'developer.force.com';
        jwt.sub = 'udaykiran.uday@gmail.com';
        jwt.aud = 'https://api.metamind.io/v1/oauth2/token';
        jwt.exp = '3600';
        String access_token = JWTBearerFlow.getAccessToken('https://api.metamind.io/v1/oauth2/token', jwt);
            String  imageIs= vision.predictUrl(utterance,access_token,'HOUNVH7HE67DVFOC4YOLOVAELI')[0].label;
            Double probability = vision.predictUrl(utterance,access_token ,'HOUNVH7HE67DVFOC4YOLOVAELI')[0].probability;
            return new BotResponse(new BotMessage('Bot', 'Entered Image is " '+imageIs +'" \n and I am '+probability*100 +'% Confident'));
        }else{
        
        
         return new BotResponse(new BotMessage('Bot', 'i am Sorry'));
        }
        }





}