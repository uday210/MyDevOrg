global class appattachment implements Messaging.InboundEmailHandler {
      global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
          Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
          
          System.debug('>>>>>>>>>>>>>>>> '+email.subject);
             System.debug('>>>>>>>>>>>>>>>> email '+email);
          //System.debug('<<<<<<<<<<<<<<< '+email.textAttachments);
        //  System.debug('<<<<<<<<<<<<<< '+email.textAttachments.getBody());
          
          
  
            
          return result;
      }
  }