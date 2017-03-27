public class ReportViewController {

    @AuraEnabled
    public static String runReport(){
        Report rep = [select id,DeveloperName from Report Where DeveloperName='Opportunity_Stage_Report1' Limit 1];
		Reports.ReportResults results= Reports.ReportManager.runReport(rep.id,true);
	return JSON.serialize(results);        
    }
}