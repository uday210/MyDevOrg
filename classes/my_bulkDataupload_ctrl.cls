public with sharing class my_bulkDataupload_ctrl {

    //Store Csv Attachment body As Blob 
    public Blob csvFileBody {
        get;
        set;
    }

    //Variable to Hold String equivalent of CSV Body 
    //this Variable for Some intermediate Process 
    public string csvAsString {
        get;
        set;
    }

    //Strore each Row of CSV in This List
    public list < String > csvFileLines {
        get;
        set;
    }

    //Separately store the header Of CSV
    //Note : Header Values are Api Names of an Object
    public String headervalue {
        get;
        set;
    }

    //Split  Header Row string with comma (',') To Get each Field Api Name
    public list < String > headervalues {
        get;
        set;
    }

    //
    public list < String > CsvToJsonData {
        get;
        set;
    }
    public String CsvString {
        get;
        set;
    }
    public String Jobidis {
        get;
        set;
    }

    public boolean isJobClosed {
        get;
        set;
    }
    public String JSONBodyIs {
        get;
        set;
    }
    public String BatchstatusData {
        get;
        set;
    }


    public String JSONString {
        get;
        set;
    }

    //Instances of parser Classes

    public BulkApiStatus Jobstarted {
        get;
        set;
    }
    public BatchStatusParser BulkApiCompletedStatus {
        get;
        set;
    }

    //End of Parser Class Instances

    //Start Of constructure
    public my_bulkDataupload_ctrl() {

        isJobClosed = false;
        csvFileLines = new list < String > ();
        headervalues = new list < String > ();
        JSONBodyIs = '';

        Jobstarted = new BulkApiStatus();
        BulkApiCompletedStatus = new BatchStatusParser();

    }

    //end of Constructure

    public PageReference upload() {

        CsvString = csvFileBody.toString(); //convert the CSV Body (From Blob to String using .toString() method);

        csvFileLines = CsvString.split('\n'); //Split The each row and store in a 'List'

        CsvToJsonData = new list < String > ();

        headervalue = csvFileLines[0]; //Store the First Row in a separate variable as this is a header and contains API Names//This is a single string
       
        headervalues = headervalue.split(','); //Split the Above String with Comma (',') so we get individual header or Field APi Names
       
        csvFileLines.remove(0); //then remove the First value from The 'List ' because this is aheader and we already copied this to 'headervalue' Variable


        //this loop for each row 
        //Start iterating Over Each String Presnt in 'csvFileLines' List Variable
        //this each string represents one complete row in the CSV
        for (String eachrow: csvFileLines) {

            JSONGenerator gen = JSON.createGenerator(true);

            gen.writeStartObject();

            //loop for each field ( or header of CSV );

            list < String > eachfieldValues = new list < String > ();
            
            /*****************************************************
            -------------------------------------
            Name  |    Email__c       | Age__c  //This is Header
            -------------------------------------
            Uday  |  uday@noemail.com | 25      //Row1
            sai   |  sai@noemail.com  | 24      //Row2 
   
            *****************************************************/
            eachfieldValues = eachrow.split(','); //Split the Each Row with comma (',') to get each cell or Field Value
            
            Integer i = 0;
            
            //This loop is to Generate a JSON String (KEY:VALUE) 
            //As we are passing JSON Data to BULK Api

            //This Looping Generates following format String
            /***********************************************
            {"Name":"Uday","Email__c":"uday@noemail.com","Age__c":"25"}  //JSOn Representation of ROW1 Above
            ***********************************************/
            
            //This Loop continues thi sprocess for All the Rows Present in CSV
            
            for (String ss: eachfieldValues) {

                //as CSV adds some escape sequence characters for each cell we need to remove them
                gen.writeStringField(headervalues[i].replace('\r', ''), ss.replace('\r', ''));

                i++;
            }
            gen.writeEndObject();

            CsvToJsonData.add(gen.getAsString()); //At the End of this Loop we are Converting This Json To a String
        }

        //Step 1: do a HTTP callout To Geat/Create a Job and to get Job Id
        Http h = new Http();
        HttpRequest req = new Httprequest();
        req.setEndpoint('https://newworld-dev-ed.my.salesforce.com/services/async/36.0/job'); //this endpoint creates a new JOB and returns JOBid
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('charset', 'UTF-8');
        req.setHeader('Accept', 'application/json');
        req.setHeader('X-SFDC-Session', userinfo.getSessionId());

        //we need to Mention the Object name (ex: Account,Contact e.t.c ) in The Body of the Request
        //we need to Mention the Operation name (ex: Insert,Update e.t.c ) in The Body of the Request

        String Body = '{"operation" : "insert","object" : "Partner_request__c","contentType" : "JSON"}';
        req.setBody(Body);

        //This line sends the HTTp request and stores the Returned value from End point in 'res' variable

        HttpResponse res = h.send(req);
        System.debug(BulkApiReqParser.parse(res.getBody()).id);

        //we are parsing the returned data using 'BulkApiReqParser' class and retreving 'jobid' which 
        String jobID = BulkApiReqParser.parse(res.getBody()).id; //


        //Step 2: create a onemore callout with Jobid retreived from Above callout
        Http hh = new Http();
        HttpRequest req1 = new Httprequest();
        req1.setEndpoint('https://newworld-dev-ed.my.salesforce.com/services/async/36.0/job/' + jobID + '/batch');
        req1.setMethod('POST');
        req1.setHeader('Content-Type', 'application/json');
        req1.setHeader('charset', 'UTF-8');
        req1.setHeader('Accept', 'application/json');
        req1.setHeader('X-SFDC-Session', userinfo.getSessionId());

        //this loop is to convert Each JSON Structured CSV row into a comma (',')separated string
        for (String s: CsvToJsonData) {
            JSONBodyIs += s + ',';
        }
        //As we Know this loop adds an extra comma "," at the end of the String so we need to remove it
        JSONBodyIs = JSONBodyIs.removeEnd(',');


        //Append and prepend SQUARE ("[","]") Brackets for Above string Because bULK api expects Array of Objects as a String
        req1.setBody('[' + JSONBodyIs + ']');


        HttpResponse res1 = hh.send(req1);


        system.debug(res1.getBody());

        Jobstarted = BulkApiStatus.parse(res1.getBody());

        //once we done with sending JSON data To BULK API we need to close The JOb 
        //otherwise Data is not commited to Data Base

        closeBatch(Jobstarted.jobId);

        return null;
    }


    public void CloseBatch(String jobID) {
        Jobidis = jobID;
        Http h = new Http();
        HttpRequest req = new Httprequest();
        req.setEndpoint('https://newworld-dev-ed.my.salesforce.com/services/async/36.0/job/' + jobID);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('charset', 'UTF-8');
        req.setHeader('Accept', 'application/json');
        req.setHeader('X-SFDC-Session', userinfo.getSessionId());

        String Body = '{"state" : "Closed"}';

        req.setBody(Body);


        HttpResponse res = h.send(req);


        System.debug(res.getBody());

        isJobClosed = true;

    }



    public void QueryJobStatus() {

        Http h = new Http();
        HttpRequest req = new Httprequest();
        req.setEndpoint('https://newworld-dev-ed.my.salesforce.com/services/async/36.0/job/' + Jobidis);
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('charset', 'UTF-8');
        req.setHeader('Accept', 'application/json');
        req.setHeader('X-SFDC-Session', userinfo.getSessionId());

        HttpResponse res = h.send(req);
        BulkApiCompletedStatus = BatchStatusParser.parse(res.getBody());




    }

}