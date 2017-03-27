public class checksum_genCon {

public String orderid{get;set;}
public string cust_id{get;set;}
public String amount{get;set;}

public String gen_checkSum{get;set;}


public void pay(){

gen_checkSum = checksumgen.genCheckSum(orderid,cust_id,amount);
}


}