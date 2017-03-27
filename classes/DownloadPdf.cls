public class DownloadPdf{




@AuraEnabled
public static blob Downloadpdf_file(){


Pagereference pg = new Pagereference('/apex/my_pdf');

System.debug('>>>>>>>>>>>>>>>>>>>>> ');
System.debug(pg.getContent());
return pg.getContent();
}


}